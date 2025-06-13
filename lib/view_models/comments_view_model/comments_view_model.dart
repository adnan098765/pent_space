// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/auth/auth_services.dart';

class CommentsViewModel extends GetxController {
  final commentController = TextEditingController().obs;
  RxInt feedsid = 0.obs;
  RxBool loading = false.obs;
  Map postComments = {};

  getComments() async {
    try {
      loading.value = true;
      var result = await AuthServices().getPostComments(feedsid.value);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        postComments = response['data'];
        // Get.snackbar('Message', response['message']);
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
    }
  }

  void PostComment() async {
    try {
      loading.value = true;
      var data = {
        'feed_id': feedsid.value,
        'comment_text': commentController.value.text,
      };

      var result = await AuthServices().PostComment(data);
      Map<String, dynamic> response = json.decode(result.body);

      if (response['status']['success'] == true) {
        Get.snackbar('Message', response['message']);
        // Get.to(() => HomeScreen());
        addcomment(response['data']);
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
      commentController.value.clear();
    }
  }

  deleteComments(feedid) async {
    try {
      loading.value = true;
      var result = await AuthServices().deleteComments(feedid);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        removeById(response['data']);
        // Get.snackbar('Message', response['message']);
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
    }
  }

  removeById(data) {
    postComments['comments']
        .removeWhere((element) => data["id"] == element["id"]);
    update();
  }

  addcomment(data) {
    postComments['comments'].add(data);
    update();
  }
}
