// ignore_for_file: unused_field, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pent_space/Services/firebaseServices.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/models/FeedModel.dart';
import 'package:pent_space/models/app_state_model.dart';
import 'package:pent_space/widgets/platformDialog.dart';
import 'package:uuid/uuid.dart';

import '../../../models/EnquiryModel.dart';

final createPostEnquiryChangeProvider =
    ChangeNotifierProvider<CreatePostNotifier>((ref) {
  return CreatePostNotifier();
});

class CreatePostNotifier extends ChangeNotifier {
  final List<String> _selectedCategories = [];
  List<String> get selectedCategories => _selectedCategories;

  late final TextEditingController _enquiryContentController =
      TextEditingController(text: '');
  TextEditingController get enquiryContentController =>
      _enquiryContentController;
  late final TextEditingController _postContentController =
      TextEditingController(text: '');
  TextEditingController get postContentController => _postContentController;
  bool _isCreatingPost = false;
  bool get isCreatingPost => _isCreatingPost;
  late final TextEditingController _commentController =
      TextEditingController(text: '');
  get commentController => _commentController;
  bool _isSendingComment = false;
  bool get isSendingComment => _isSendingComment;
}
