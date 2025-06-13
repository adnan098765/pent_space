// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/home/home_screen.dart';
import '../../../Services/auth/auth_services.dart';

class PostEnquiryViewModel extends GetxController {
  final enquirycontroller = TextEditingController().obs;
  List AllQuestions = [];
  List MyQuestions = [];
  RxBool loading = false.obs;

  void CreateEnquiry() async {
    try {
      loading.value = true;
      var data = {
        'question_text': enquirycontroller.value.text,
      };

      var result = await AuthServices().CreateEnquiry(data);

      Map<String, dynamic> response = json.decode(result.body);

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
      enquirycontroller.value.clear();
    }
  }

  getEnquiry() async {
    try {
      loading.value = true;
      var result = await AuthServices().getAllQuestions();
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        AllQuestions = response['data'];
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

  getMyEnquiries() async {
    try {
      loading.value = true;
      var result = await AuthServices().getMyQuestions();
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        MyQuestions = response['data'];
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

  deleteQuestion(questionid) async {
    try {
      loading.value = true;
      var result = await AuthServices().deleteQuestion(questionid);
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
    AllQuestions.removeWhere((element) => data["id"] == element["id"]);
    update();
  }

  addById(data) {
    AllQuestions.add(data);
    update();
  }
}
