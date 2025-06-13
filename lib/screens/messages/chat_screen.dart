// ignore_for_file: must_be_immutable, unnecessary_string_interpolations, unused_field, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/app_const.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/models/app_state_model.dart';
import 'package:pent_space/screens/messages/ChatScreenProvider.dart';
import 'package:sizer/sizer.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:websafe_svg/websafe_svg.dart';

import '../../Services/core/app_urls.dart';
import '../../core/const/svg_const.dart';
import '../../core/utils/app_utils.dart';
import '../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import 'chat_screen_controller.dart';
import 'messages_screen.dart';
import 'package:pent_space/utils/helpers.dart';
class ChatScreen extends StatefulWidget {
  AppStateModel? reciveruser;
  final reciverid;
  final chatid;
  final recivername;
  final reciverprofile;
  final user_id_one;
  final user_id_two;
  final isblocked;
  final iamblocked;

  ChatScreen(
      {Key? key,
      this.reciveruser,
      this.reciverid,
      this.chatid,
      this.recivername,
      this.reciverprofile,
      this.user_id_one,
      this.user_id_two,
      this.isblocked,
      this.iamblocked})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late IO.Socket socket;
  List _messages = [];
  bool canSendMessage = true;
  final getUserData = Get.put(GetUserDataController());
  var blockeduserid;
  final getChat = Get.put(GetChatController());

  TextEditingController _messageController = TextEditingController();

  var reciverid;

  @override
  void initState() {
    super.initState();

    if (getUserData.userdata.data!.id == widget.user_id_one) {
      blockeduserid = widget.user_id_two;
    } else {
      blockeduserid = widget.user_id_one;
    }

    reciverid = widget.reciverid != null ? widget.reciverid : widget.chatid;
    getChat.getChat(widget.reciverid, widget.chatid);
    _connectToSocket();
    print('AuthToken  is ${authtoken}');
    joinChatRoom(reciverid);
    // isChatOpened = true;
    // log("isChatOpened-->  $isChatOpened");
    // _fetchChatHistory();
  }

  blockuser() {}

  void _connectToSocket() {
    socket = IO.io(
      '${AppUrls.socketurl}',
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build(),
    );

    socket.connect();

    sendOnlineAck();
    addChatListeners();

    // socket.onConnect((_) {
    //   log('connected to socket server $_');

    //   addChatListeners();
    //   joinChatRoom(reciverid);
    //   sendOnlineAck();
    // });

    // socket.onDisconnect((_) {
    //   log('disconnected from socket server');
    // });
  }

  sendOnlineAck() {
    socket.emit("online", {
      "access_token": authtoken,
    });
  }

  // socketDisposeee() {
  //   // log("---- ${widget.user.chatId}");

  //   if (widget.reciverid != null) {
  //     socket.emit("privateMessageSuccess",
  //         {"access_token": authtoken, "recipient_id ": reciverid});
  //   } else {
  //     socket.emit("privateMessageSuccess",
  //         {"access_token": authtoken, "chat_id ": reciverid});
  //   }
  // }

  addChatListeners() {
    socket.on('privateMessage', (data) {
      log("New Message recieved $data");

      // socket.emit("readPrivateMessage", {
      //   "message_id": data['message_id'],
      //   "access_token": authtoken,
      // });

      // socket.on('readPrivateMessageSuccess', (data) {
      //   log("Read Message $data");
      // });

      // _messages.add(data['message']);
      // getChat.AllChats.add({
      //   'message': data['message'],
      //   'createdAt': DateTime.now().toUtc().toString(),
      //   'sender_id': data['sender_id'],
      // });

      getChat.AllChats.insert(0, {
        'message': data['message'],
        'createdAt': DateTime.now().toUtc().toString(),
        'sender_id': data['sender_id'],
      });

      setState(() {});

      // sendAckforMessage(data['message_id']);
    });

    socket.on('privateChatMessageSuccess', (data) {
      log("Message sent $data");
      // _messages.insert(
      //     0,
      //     ChatMessage(map: {
      //       'message': _messageController.text.trim(),
      //       'createdAt': DateTime.now().toUtc().toString(),
      //       'sender_type': 'USER',
      //     }));
      _messageController.clear();
      canSendMessage = true;
      setState(() {});
    });

    socket.on('error', (data) {
      log("socket error ${widget.reciverid} $data");
    });
  }

  joinChatRoom(int id) {
    if (widget.reciverid != null) {
      socket.emit("joinPrivateChat", {
        "recipient_id": id,
        "access_token": authtoken,
      });
    } else {
      socket.emit("joinPrivateChat", {
        "chat_id": id,
        "access_token": authtoken,
      });
    }

    socket.on('joinedPrivateChatSuccess', (data) {
      log("Joined Room ${reciverid} $data");
    });
  }

  leaveChatRoom(int id) {
    if (widget.reciverid != null) {
      socket.emit("leavePrivateChat", {
        "recipient_id": id,
        "access_token": authtoken,
      });
    } else {
      socket.emit("leavePrivateChat", {
        "chat_id": id,
        "access_token": authtoken,
      });
    }

    socket.on('leftPrivateChatSuccess', (data) {
      log("Joined Left ${widget.reciverid} $data");
    });
  }

  getAllChats() {
    socket.emit("getAllChats", {
      "access_token": authtoken,
    });
  }

  void sendMessage(int recipientid, String message) {
    if (message.isNotEmpty) {
      if (widget.reciverid != null) {
        socket.emit("privateChatMessage", {
          "recipient_id": recipientid,
          "access_token": authtoken,
          "message": message,
        });
      } else {
        socket.emit("privateChatMessage", {
          "chat_id": recipientid,
          "access_token": authtoken,
          "message": message,
        });
      }

      socket.on('privateMessageSuccess', (data) {
        log('Message Sent ${data}');
      });

      getChat.AllChats.insert(0, {
        'message': message,
        'createdAt': DateTime.now().toUtc().toString(),
        'sender_id': getUserData.userdata.data!.id,
      });

      _messageController.clear();
    }
  }

  sendAckforMessage(id) {
    socket.emit("receivedPrivateChatMessage", {
      "access_token": authtoken,
      "message_id": id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, WidgetRef ref, child) {
        final chatScreenState = ref.watch(chatScreenStateProvider);
        return Column(
          children: [
            Container(
              color: AppPallet.textColor,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 4.8.w),
              child: SafeArea(
                bottom: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        leaveChatRoom(reciverid);
                        getAllChats();
                        Navigator.pop(context);
                        // Get.to(() => MessagesScreen());
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15.sp,
                        color: AppPallet.whiteTextColor,
                      ),
                    ),
                    Text(
                      'Chats',
                      style: TextStyle(
                        color: AppPallet.whiteTextColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: AppPallet.whiteBackground,
                borderRadius: BorderRadius.circular(1.w),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFcccccc),
                    offset: Offset(0.w, 3.w),
                    spreadRadius: -5.w,
                    blurRadius: 4.w,
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 12.w,
                          height: 12.w,
                          decoration: BoxDecoration(
                            color: AppPallet.greyBackgroundColor,
                            borderRadius: BorderRadius.circular(15.w),
                            image: DecorationImage(
                              image: NetworkImage(cleanUrl('${widget.reciverprofile}')),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0.3.w,
                                right: 0.3.w,
                                child: Container(
                                  width: 3.w,
                                  height: 3.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF61CBBB),
                                    borderRadius: BorderRadius.circular(1.5.w),
                                    border: Border.all(
                                      width: 0.4.w,
                                      color: AppPallet.whiteBackground,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.4.w)),
                        Expanded(
                          child: Text(
                            "${widget.recivername}",
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(padding: EdgeInsets.only(right: 2.4.w)),
                  // Icon(
                  //   Icons.search,
                  //   size: 17.sp,
                  //   color: AppPallet.textColor,
                  // ),
                  PopupMenuButton<dynamic>(
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          onTap: () {
                            log("block");
                            getChat.blockUser(blockeduserid);
                          },
                          // enabled: true,
                          child: Container(
                            height: 7.4.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F7),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WebsafeSvg.asset(
                                  answersReportFilledVector,
                                  height: 2.3.h,
                                ),
                                Padding(padding: EdgeInsets.only(top: 0.8.h)),
                                Text(
                                  widget.isblocked == 0 ? 'Block' : 'Unblock',
                                  style: TextStyle(
                                    color: const Color(0xFF9A1708),
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ];
                    },
                    onSelected: (dynamic value) {
                      // Handle the selected option
                      print('Selected: $value');
                    },
                  ),
                ],
              ),
            ),

            Expanded(
                child: Obx(
              () => getChat.loading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      reverse: true,
                      itemCount: getChat.AllChats.length,
                      itemBuilder: (context, index) {
                        return MessageBubble(
                          msg: getChat.AllChats[index]['message'],
                          text: DateTime.parse(
                              getChat.AllChats[index]['createdAt']),
                          from: getChat.AllChats[index]['sender_id'] ==
                              getUserData.userdata.data!.id,
                        );
                      }),
            )),

            // Expanded(
            //   child: StreamBuilder<List<Message>>(
            //       stream: ref
            //           .read(chatScreenStateProvider.notifier)
            //           .getMessageStream(
            //             '${globalUserData.userId}', // Replace with actual current user ID
            //             widget.reciveruser.userId, // Use the receiver user ID
            //           ),
            //       builder: (context, snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return const Center(child: CircularProgressIndicator());
            //         }

            //         if (snapshot.hasError) {
            //           return Text('Error: ${snapshot.error}');
            //         }
            //         final List<Message> messages = snapshot.data ?? [];
            //         return ListView.builder(
            //           itemCount: messages.length,
            //           itemBuilder: (context, index) {
            //             final message = messages[index];
            //             return MessageBubble(
            //               msg: message,
            //               text: message.text,
            //               from: message.senderId == '${globalUserData.userId}',
            //             );
            //           },
            //         );
            //       }),
            //   // ListView(
            //   //   padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.4.w),
            //   //   children: const [
            //   //     MessageBubble(text: 'Hi Sarah, how you'),
            //   //     MessageBubble(text: 'Hey', from: false),
            //   //     MessageBubble(
            //   //         text:
            //   //             'Congrats! After all this searches you finally made it.'),
            //   //     MessageBubble(text: 'Hi Sarah, how you'),
            //   //     MessageBubble(text: 'Hey', from: false),
            //   //     MessageBubble(
            //   //         text:
            //   //             'Congrats! After all this searches you finally made it.'),
            //   //   ],
            //   // ),
            // ),
            if (widget.isblocked == 0 && widget.iamblocked == 0) ...[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: AppPallet.whiteBackground,
                  borderRadius: BorderRadius.circular(1.w),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFcccccc),
                      offset: Offset(3.w, 0.w),
                      spreadRadius: -5.w,
                      blurRadius: 4.w,
                    )
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    children: [
                      // Icon(
                      //   Icons.attach_file,
                      //   color: AppPallet.textColor,
                      //   size: 18.sp,
                      // ),
                      // Padding(padding: EdgeInsets.only(right: 2.w)),

                      Expanded(
                        child: Container(
                          height: 5.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2EFEF),
                            borderRadius: BorderRadius.circular(2.5.h),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _messageController,
                                  decoration: InputDecoration(
                                    fillColor: const Color(0xFFF2EFEF),
                                    contentPadding: EdgeInsets.zero,
                                    hintText: '',
                                    hintStyle: TextStyle(
                                      color: AppPallet.greyTextColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                  sendMessage(
                                      reciverid, _messageController.text);
                                },
                                child: Icon(
                                  Icons.send,
                                  size: 16.sp,
                                  color: AppPallet.textColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      )

                      // Padding(padding: EdgeInsets.only(right: 2.w)),
                      // Icon(
                      //   Icons.mic_outlined,
                      //   color: AppPallet.textColor,
                      //   size: 19.sp,
                      // )
                    ],
                  ),
                ),
              ),
            ],
            if (widget.iamblocked == 1) ...[
              Text(
                'You have been blocked by this user',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )
            ]
          ],
        );
      }),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final msg;
  final text;
  final bool from;
  MessageBubble({Key? key, this.from = true, this.text, required this.msg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: from ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 60.w),
        // width: 60.w,
        margin: EdgeInsets.only(bottom: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 2.6.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: from ? const Color(0xFFB2E6DE) : const Color(0xFFD7DDDC),
          borderRadius: BorderRadius.circular(2.4.w),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$msg",
              style: TextStyle(
                color: AppPallet.textColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.done_all,
                  color: const Color(0xFF5F656F),
                  size: 11.sp,
                ),
                Padding(padding: EdgeInsets.only(right: 2.4.w)),
                Text(
                  '${formatTimestamp(text)}',
                  style: TextStyle(
                    color: AppPallet.lightTextColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final Map<String, dynamic> map;
  const ChatMessage({required this.map});
  int? get id => map['id'] as int?;
  String? get message => map['message'] as String?;
  String get createdAt => map['createdAt'] as String? ?? '';
  String get senderType => map['sender_type'] as String? ?? '';
  // String get createdAtFormatted => Global.convertDateTime(createdAt);
}
