// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable, invalid_use_of_protected_member

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:pent_space/Services/auth/auth_services.dart';
import 'package:pent_space/screens/home/home_screen.dart';

class GetChatController extends GetxController {
  RxBool loading = false.obs;

  List AllChats = [];

  Future<void> getChat(reciverid, chatid) async {
    try {
      loading.value = true;
      var resData = await AuthServices().getAllChats(reciverid, chatid);
      Map<String, dynamic> response = json.decode(resData.body);
      if (response['status']['success'] == true) {
        AllChats = response['data'];
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
    }
  }

  void blockUser(blockid) async {
    try {
      var data = {'blocked_user_id': blockid};
      // loading.value = true;
      var result = await AuthServices().blockUser(data);
      Map<String, dynamic> response = json.decode(result.body);
      log(response.toString());
      if (response['status']['success'] == true) {
        Get.to(() => HomeScreen());
        // Get.snackbar('Message', response['message']);
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      // loading.value = false;
    }
  }

  // removeById(data) {
  //   // ShippingAddress.remove(data);
  //   PaymentMethods.removeWhere((element) => data["id"] == element["id"]);
  //   update();
  //   PaymentMethods;
  // }

  // addOne(data) {
  //   PaymentMethods.add(data);
  //   update();
  // }
}
