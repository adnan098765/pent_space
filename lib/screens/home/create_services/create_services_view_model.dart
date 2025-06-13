// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/home/home_screen.dart';
import 'package:pent_space/screens/home/nearby_services/near_by_services.dart';
import '../../../Services/auth/auth_services.dart';
import '../../../view_models/imagepicker/image_picker_view_model.dart';

class ServicesViewModel extends GetxController {
  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());
  final servicenameController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;
  final firstkeywordController = TextEditingController().obs;
  final secondkeywordController = TextEditingController().obs;
  final thirdkeywordController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final streetController = TextEditingController().obs;
  var selectedcountry;
  var lat;
  var long;
  var categoryid;
  RxInt feedsid = 0.obs;
  RxBool loading = false.obs;
  RxBool iscreating = false.obs;

  List allServices = [];
  List ServicesName = [];
  Map<String,dynamic> allnearbyServices = {};

  validations() {
    if (imagepickercontroller.selectedImagePath.isEmpty) {
      Get.snackbar('Message', 'Please Select Service Image');
    } else if (servicenameController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Service Name',
          backgroundColor: Colors.transparent, colorText: Colors.white);
    } else if (descriptionController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Description');
    }
    // else if (lat == null) {
    //   Get.snackbar('Message', 'Please Select Location');
    // }
    else {
      CreateServices();
    }
  }

  getServiceCategories() async {
    ServicesName.clear();
    try {
      loading.value = true;
      var result = await AuthServices().getServiceCategories();
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        allServices = response['data'];
        for (var i = 0; i < allServices.length; i++) {
          ServicesName.add(allServices[i]['name']);
        }
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

  getAllServices() async {
    if (firstkeywordController.value.text.isEmpty && secondkeywordController.value.text.isEmpty && thirdkeywordController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Atleast 1 keyword');
    } else if (streetController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Your Street Address',
          backgroundColor: Colors.transparent, colorText: Colors.white);
    } else if (cityController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Your City');
    }
    else if (stateController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Your State');
    }
    else if (selectedcountry.toString().isEmpty) {
      Get.snackbar('Message', 'Please Choose Your Country');
    }
    else {
      try {
        loading.value = true;
        var params = {
          'first_key_word': firstkeywordController.value.text,
          'second_key_word': secondkeywordController.value.text,
          'third_key_word': thirdkeywordController.value.text,
          'street': streetController.value.text,
          'city': cityController.value.text,
          'state': stateController.value.text,
          'country': selectedcountry.toString(),
          'longitude': '24.89323752560252',
          'latitude': '67.07495506624251',

        };
        var result = await AuthServices().getAllServices(params);
        var response = await json.decode(result.body);
        print(response['data']);
        if (response['status']['success'] == true) {
          allnearbyServices = response['data'];

          Get.to(() => NearByServices());

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
  }

  void CreateServices() async {
    try {
      iscreating.value = true;
      var data = {
        'service_name': servicenameController.value.text,
        'description': descriptionController.value.text,
        'service_image': imagepickercontroller.selectedImagePath.value,
        'service_category_id': categoryid.toString(),
        'longitude': '${streetController.value.text}/${cityController.value.text}/${stateController.value.text}',
        'latitude': '67.07495506624251',
        'country': selectedcountry

        // lat.toString()
      };

      var result = await AuthServices().CreateServices(data);
      var responseBody = await result.stream.bytesToString();
      Map<String, dynamic> response = json.decode(responseBody);

      if (response['status']['success'] == true) {
        Get.snackbar('Message', response['message']);
        Get.to(() => HomeScreen());
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      servicenameController.value.clear();
      descriptionController.value.clear();
      lat = 0;
      long = 0;

      iscreating.value = false;
    }
  }
}
