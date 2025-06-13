// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, empty_catches

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/app_const.dart';
import 'package:pent_space/screens/agreement/agreement_screen.dart';
import 'package:pent_space/screens/auth/forgot_password/reset_password_screen.dart';
import 'package:pent_space/screens/auth/signup/ServiceProviderRegistration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Services/auth/auth_services.dart';
import '../../../screens/auth/signup/complete_signup.dart';

class VerifyOtpViewModel extends GetxController {
  final emailController = TextEditingController().obs;
  String otpcode = '';
  RxBool loading = false.obs;

  void VerifyOtp([bool isresetpass = false]) async {
    SharedPreferences spPref = await SharedPreferences.getInstance();
    try {
      loading.value = true;
      var data = {'email': useremailaddress, 'otp': otpcode};

      var result = await AuthServices().VerifyOtp(data);
      Map<String, dynamic> response = json.decode(result.body);

      if (response['status']['success'] == true) {
        loading.value = false;
        authtoken = response['data']['access_token'];
        // spPref.setString("authtoken", authtoken);

        Get.snackbar('Message', response['message']);
        if (isresetpass == true) {
          Get.to(() => ResetPasswordScreen());
        } else if (UserRole == 'BUSINESS') {
          Get.to(() => AgreementScreen());
        } else {
          Get.to((AgreementScreen()));
        }
      } else {
        loading.value = false;
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      print(e);
      loading.value = false;
    }
  }

  void ResendOtp() async {
    loading.value = true;
    var data = {
      'email': useremailaddress,
    };

    var result = await AuthServices().ResendOtp(data);
    Map<String, dynamic> response = json.decode(result.body);

    if (response['status']['success'] == true) {
      loading.value = false;
      print('OTP ${response['data']['otp']}');
      Get.snackbar('Message', response['message']);
    } else {
      loading.value = false;
      Get.snackbar('Message', response['message']);
    }
  }
}
