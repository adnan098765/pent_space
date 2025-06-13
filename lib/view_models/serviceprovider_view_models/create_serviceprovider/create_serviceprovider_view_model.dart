// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Services/auth/auth_services.dart';
import '../../../core/const/app_const.dart';
import '../../../screens/home/home_screen.dart';
import '../../controller/getuserprofile/get_userprofile_view_model.dart';
import '../../imagepicker/image_picker_view_model.dart';

class CreateServiceProviderViewModel extends GetxController {
  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());
  final getUserData = Get.put(GetUserDataController());

  final businessnamecontroller = TextEditingController().obs;
  final phonecontrollerController = TextEditingController().obs;
  final firstkeywordcontroller = TextEditingController().obs;
  final secondkeywordcontroller = TextEditingController().obs;
  final thirdkeywordcontroller = TextEditingController().obs;
  final dobController = TextEditingController().obs;
  final selectedDate = Rx<DateTime?>(null);
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final addressController = TextEditingController().obs;

  RxString country = 'Nigeria'.obs;

  validations() {
    if (imagepickercontroller.selectedImagePath.isEmpty) {
      Get.snackbar('Message', 'Please Select Profile Picture');
    } else if (businessnamecontroller.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Full Name',
          backgroundColor: Colors.red, colorText: Colors.white);
    } else if (phonecontrollerController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Phone');
    } else if (firstkeywordcontroller.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter First Keyword');
    } else if (secondkeywordcontroller.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Second Keyword');
    } else if (thirdkeywordcontroller.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Third Keyword');
    } else if (cityController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter your City');
    } else if (stateController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter your State');
    } else if (dobController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter your Date of Birth');
    } else if (addressController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Complete Address');
    } else {
      CreateServiceProviderProfile();
    }
  }

  RxBool loading = false.obs;

  void CreateServiceProviderProfile() async {
    SharedPreferences spPref = await SharedPreferences.getInstance();
    try {
      loading.value = true;
      var data = {
        'business_profile_picture':
            imagepickercontroller.selectedImagePath.value,
        'business_name': businessnamecontroller.value.text,
        'phone': phonecontrollerController.value.text,
        'address': addressController.value.text+"/"+stateController.value.text+"/"+cityController.value.text,
        'country': country.value,
        'dob':selectedDate,
        'first_key_word': firstkeywordcontroller.value.text,
        'second_key_word': secondkeywordcontroller.value.text,
        'third_key_word': thirdkeywordcontroller.value.text
      };

      var result = await AuthServices().CreateServiceProvider(data);
      var responseBody = await result.stream.bytesToString();
      Map<String, dynamic> response = json.decode(responseBody);

      if (response['status']['success'] == true) {
        authtoken = response['data']['access_token'];
        refreshtoken = response['data']['refresh_token'];
        spPref.setString("authtoken", authtoken);

        Get.snackbar('Message', response['message']);
        getUserData.getUserData();
        Get.to(() => HomeScreen());
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
