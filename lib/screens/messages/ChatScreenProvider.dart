// chat_screen_provider.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/Message.dart';
import '../../models/app_state_model.dart';

final chatScreenStateProvider =
    ChangeNotifierProvider<CreatePostNotifier>((ref) {
  return CreatePostNotifier();
});

class CreatePostNotifier extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var messagecontroller = TextEditingController();

  List<Message> _messages = [];
  List<String> _chatContacts = [];

  List<Message> get messages => _messages;
  Future<Message?> getLastMessage(
      String currentUserId, String contactId) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(currentUserId)
              .collection('chats')
              .doc(contactId)
              .collection('messages')
              .orderBy('timestamp', descending: true)
              .limit(1)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        final lastMessageData = querySnapshot.docs.first.data();
        print(lastMessageData["text"]);
        return Message.fromJson(lastMessageData);
      } else {
        return null; // No messages found
      }
    } catch (e) {
      print('Error getting last message: $e');
      return null;
    }
  }

  Stream<List<String>> getChatContactsStream(String userId) {
    try {
      return _firestore
          .collection('users')
          .doc(userId)
          .collection('chats')
          .snapshots()
          .map((querySnapshot) {
        print("Document ID: ${querySnapshot.docs}${userId} ");
        final List<String> contacts = [];
        for (final doc in querySnapshot.docs) {
          print("Document ID: ${doc.id}");
          print("Document Data: ${doc.data()}");
          // Check if the document data is not null and contains the expected field
          if (doc.data() != null && doc.data()!['id'] != null) {
            final contactId = doc.data()!['id'];
            contacts.add(contactId);
          }
        }
        return contacts;
      });
    } catch (e) {
      print("Error getting chat contacts stream: $e");
      // Handle the exception based on your application's requirements
      return Stream.value([]);
    }
  }

  List<String> get chatContacts => _chatContacts;

  Future<void> sendMessage(
      Message message, AppStateModel sender, AppStateModel reciver) async {
    try {
      // Sender's collection
      await _firestore
          .collection('users')
          .doc(message.senderId)
          .collection('chats')
          .doc(message.receiverId)
          .collection('messages')
          .add(message.toJson());
      await _firestore
          .collection('users')
          .doc(message.senderId)
          .collection('chats')
          .doc(message.receiverId)
          .set(sender.toJson());
      messagecontroller.clear();
      // Receiver's collection
      await _firestore
          .collection('users')
          .doc(message.receiverId)
          .collection('chats')
          .doc(message.senderId)
          .collection('messages')
          .add(message.toJson());
      await _firestore
          .collection('users')
          .doc(message.receiverId)
          .collection('chats')
          .doc(message.senderId)
          .set(reciver.toJson());

      _messages.add(message);

      // Sort messages based on index
      _messages.sort((a, b) => a.index.compareTo(b.index));

      notifyListeners();
    } catch (e) {
      // Handle exceptions here
      print("Error sending message: $e");

      // You can choose to rethrow the exception or handle it gracefully
      // rethrow;
    }
  }

  Stream<List<Message>> getMessageStream(String senderId, String receiverId) {
    return _firestore
        .collection('users')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .map((querySnapshot) {
      final List<Message> messages = [];
      for (final doc in querySnapshot.docs) {
        final message = Message.fromJson(doc.data() as Map<String, dynamic>);
        messages.add(message);
      }
      return messages;
    });
  }

  Future<AppStateModel> getUserData(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await _firestore.collection('users').doc(userId).get();

      if (userSnapshot.exists) {
        return AppStateModel.fromJson(userSnapshot.data()!);
      } else {
        // Handle the case where the user does not exist
        return globalUserData;
      }
    } catch (e) {
      // Handle any errors that might occur during the fetch operation
      print('Error getting user data: $e');
      // You can throw an exception or return a default user data based on your app's requirements
      return globalUserData;
    }
  }
}
