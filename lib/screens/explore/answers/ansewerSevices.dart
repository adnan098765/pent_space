// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/auth/auth_services.dart';

class AnswersViewModel extends GetxController {
  final answerController = TextEditingController().obs;
  RxInt questionid = 0.obs;
  RxBool loading = false.obs;
  List Answers = [];

  getAnswers() async {
    try {
      loading.value = true;
      var result = await AuthServices().getAllAnswers(questionid.value);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        Answers = response['data']['answers'];

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

  void PostAnswer() async {
    try {
      loading.value = true;
      var data = {
        'questionnaires_id': questionid.value,
        'answer_text': answerController.value.text,
      };

      var result = await AuthServices().PostAnswer(data);
      Map<String, dynamic> response = json.decode(result.body);

      if (response['status']['success'] == true) {
        Get.snackbar('Message', response['message']);
        addOne(response['data']);
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
      answerController.value.clear();
    }
  }

  deleteAnswer(questionid) async {
    try {
      loading.value = true;
      var result = await AuthServices().deleteAnswer(questionid);
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
    Answers.removeWhere((element) => data["id"] == element["id"]);
    update();
  }

  addOne(data) {
    Answers.add(data);
    update();
  }
}
