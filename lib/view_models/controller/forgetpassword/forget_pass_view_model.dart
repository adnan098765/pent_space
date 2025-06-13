// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/auth/signin/user_signin_screen.dart';
import 'package:pent_space/screens/auth/verifyotp/verify_otp.dart';
import '../../../Services/auth/auth_services.dart';
import '../../../core/const/app_const.dart';

class ForgetPasswordViewModel extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  void ForgetPassword() async {
    useremailaddress = emailController.value.text;
    loading.value = true;
    var data = {
      'email': emailController.value.text,
    };
    var result = await AuthServices().ForgetPassword(data);
    Map<String, dynamic> response = json.decode(result.body);
    if (response['status']['success'] == true) {
      loading.value = false;
      Get.snackbar('Message', response['message']);
      print('USER OTp ${response['data']['otp']}');
      Get.to(() => VerifyOppScreen(
            isresetpass: true,
          ));
    } else {
      loading.value = false;
      Get.snackbar('Message', response['message']);
    }
  }

  void ResetPasswordd() async {
    loading.value = true;
    var data = {
      'password': passwordController.value.text,
    };
    var result = await AuthServices().ResetPassword(data);
    Map<String, dynamic> response = json.decode(result.body);
    if (response['status']['success'] == true) {
      loading.value = false;
      Get.snackbar('Message', response['message']);
      Get.offAll(() => UserSignIn());
    } else {
      loading.value = false;
      Get.snackbar('Message', response['message']);
    }
  }
}
