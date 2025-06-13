// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/auth/auth_services.dart';

class NotificationViewModel extends GetxController {
  final commentController = TextEditingController().obs;
  RxInt feedsid = 0.obs;
  RxBool loading = false.obs;
  List AllNotifications = [];
  RxInt messageCount = 0.obs;

  getNotifications() async {
    try {
      loading.value = true;
      var result = await AuthServices().getNotifications();
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        AllNotifications = response['data']['notifications'];
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
}
