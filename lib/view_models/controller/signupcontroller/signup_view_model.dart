// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/auth/verifyotp/verify_otp.dart';
import '../../../Services/auth/auth_services.dart';
import '../../../core/const/app_const.dart';

class SignUpViewModel extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmpasswordController = TextEditingController().obs;
  RxBool loading = false.obs;
  validations() {
    if (emailController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Email',
          backgroundColor: Colors.red, colorText: Colors.white);
    } else if (passwordController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Password');
    } else if (confirmpasswordController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Confirm Password');
    } else {
      SignUpApi();
    }
  }

  void SignUpApi() async {
    useremailaddress = emailController.value.text;
    loading.value = true;
    var data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'user_type': UserRole,
    };

    var result = await AuthServices().UserSignUp(data);
    Map<String, dynamic> response = json.decode(result.body);

    if (response['status']['success'] == true) {
      loading.value = false;
      Get.snackbar('Message', response['message']);
      print('USER OTp ${response['data']['otp']}');
      Get.to(() => VerifyOppScreen());
    } else {
      loading.value = false;
      Get.snackbar('Message', response['message']);
    }
  }
}
