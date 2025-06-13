// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/home/home_screen.dart';
import '../../../Services/auth/auth_services.dart';
import '../../../view_models/imagepicker/image_picker_view_model.dart';

class PostFeedViewModel extends GetxController {
  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());
  final aboutcontroller = TextEditingController().obs;

  RxBool loading = false.obs;

  void CreatePost() async {
    try {
      loading.value = true;
      var data = {
        'feed_picture': imagepickercontroller.selectedImagePath.value,
        'about': aboutcontroller.value.text,
      };

      var result = await AuthServices().CreateFeed(data);
      var responseBody = await result.stream.bytesToString();
      Map<String, dynamic> response = json.decode(responseBody);

      if (response['status']['success'] == true) {
        loading.value = false;
        Get.snackbar('Message', response['message']);
        Get.to(() => HomeScreen());
      } else {
        loading.value = false;
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
      imagepickercontroller.selectedImagePath.value = '';
      aboutcontroller.value.clear();
    }
  }

  deletPost() {
    try {} catch (e) {}
  }
}
