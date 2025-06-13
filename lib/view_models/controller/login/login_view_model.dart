// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/agreement/agreement_screen.dart';

import 'package:pent_space/screens/auth/verifyotp/verify_otp.dart';
import 'package:pent_space/screens/home/home_screen.dart';
import 'package:pent_space/screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Services/auth/auth_services.dart';
import '../../../core/const/app_const.dart';
import '../getuserprofile/get_userprofile_view_model.dart';

class LoginViewModel extends GetxController {
  final getUserData = Get.put(GetUserDataController());
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  void Login() async {
    SharedPreferences spPref = await SharedPreferences.getInstance();
    useremailaddress = emailController.value.text;

    try {
      loading.value = true;
      var data = {
        'email': emailController.value.text,
        'password': passwordController.value.text
      };
      var result = await AuthServices().UserSignIn(data);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        Get.snackbar('Message', response['message']);
        if (response['data']['is_verified'] == false) {
          Get.to(() => VerifyOppScreen());
        } else if (response['data']['is_completed'] == false) {
          authtoken = response['data']['access_token'];
          if (response['data']['user_type'] == 'BUSINESS') {
            Get.to(() => AgreementScreen());
          } else {
            Get.to(() => AgreementScreen());
          }
        } else {
          authtoken = response['data']['access_token'];
          refreshtoken = response['data']['refresh_token'];
          spPref.setString("authtoken", authtoken);
          getUserData.getUserData();

          Get.to(() => HomeScreen());
        }
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
    }
  }

  void LogOut() async {
    try {
      var data = {
        'refresh_token': refreshtoken,
      };
      var result = await AuthServices().UserSignOut(data);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        print('Logout Successfully');
        Get.snackbar('Message', 'Logout Successfully');
      } else {
        Get.snackbar('Message', 'Logout Successfully');
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {}
  }

  void DeleteAccount() async {
    try {
      var result = await AuthServices().DeleteMyAccount();

      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        print('Logout Successfully');
        Get.offAll(OnBoardingScreen());
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {}
  }
}
