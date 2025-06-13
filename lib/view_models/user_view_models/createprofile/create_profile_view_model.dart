// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Services/auth/auth_services.dart';
import '../../../screens/home/home_screen.dart';
import '../../controller/getuserprofile/get_userprofile_view_model.dart';
import '../../imagepicker/image_picker_view_model.dart';

class CreateUserViewModel extends GetxController {
  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());
  final fullnamecontroller = TextEditingController().obs;
  final usernameController = TextEditingController().obs;
  final phonecontrollerController = TextEditingController().obs;
  final dobController = TextEditingController().obs;
  final selectedDate = Rx<DateTime?>(null);
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  RxString country = 'Nigeria'.obs;
  final getUserData = Get.put(GetUserDataController());

  validations() {
    if (imagepickercontroller.selectedImagePath.isEmpty) {
      Get.snackbar('Message', 'Please Select Profile Picture');
    } else if (fullnamecontroller.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Full Name',
          backgroundColor: Colors.red, colorText: Colors.white);
    } else if (usernameController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter User Name');
    } else if (phonecontrollerController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Phone');
    } else if (addressController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Complete Address');
    } else if (cityController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter your City');
    } else if (stateController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter your State');
    } else if (dobController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter your Date of Birth');
    } else {
      CreateUserProfile();
    }
  }

  RxBool loading = false.obs;

  void CreateUserProfile() async {
    loading.value = true;
    var data = {
      'user_profile_picture': imagepickercontroller.selectedImagePath.value,
      'full_name': fullnamecontroller.value.text,
      'user_name': usernameController.value.text,
      'phone': phonecontrollerController.value.text,
      'address': addressController.value.text+"/"+stateController.value.text+"/"+cityController.value.text,
      'country': country.value,
      'dob':selectedDate,

    };

    var result = await AuthServices().CreateUserProfile(data);
    var responseBody = await result.stream.bytesToString();
    Map<String, dynamic> response = json.decode(responseBody);

    if (response['status']['success'] == true) {
      loading.value = false;
      getUserData.getUserData();
      Get.to(() => HomeScreen());
      Get.snackbar('Message', response['message']);
    } else {
      loading.value = false;
      Get.snackbar('Message', response['message']);
    }
  }
}
