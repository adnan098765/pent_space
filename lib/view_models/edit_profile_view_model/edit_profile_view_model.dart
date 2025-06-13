// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pent_space/Services/auth/auth_services.dart';
import '../../../models/usermodel/user_model.dart';
import '../../screens/home/home_screen.dart';
import '../controller/getuserprofile/get_userprofile_view_model.dart';
import '../imagepicker/image_picker_view_model.dart';

class EditProfileController extends GetxController {
  final imagepicker = Get.put(ImagePickerController());
  final getuserprofile = Get.put(GetUserDataController());
  bool isLoading = false;
  UserData userdata = UserData();
  RxBool loading = false.obs;
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;

  // setUserData(UserData data) {
  //   userdata = data;
  //   print(userdata.data!.phone);
  //   update();
  // }

  var resData;

  void editProfile() async {
    try {
      loading.value = true;
      var data = {
        'business_name': nameController.value.text,
        'phone': phoneController.value.text
      };

      if (imagepicker.selectedImagePath.value.isNotEmpty) {
        data['user_profile_picture'] = imagepicker.selectedImagePath.value;
      }
      var result = await AuthServices().EditProfile(data);
      var responseBody = await result.stream.bytesToString();
      Map<String, dynamic> response = json.decode(responseBody);

      if (response['status']['success'] == true) {
        getuserprofile.setUserData(UserData.fromJson(response));
        Get.to(() => HomeScreen());
        print('Send Success');
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
