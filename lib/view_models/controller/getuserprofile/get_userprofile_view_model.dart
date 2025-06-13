// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:pent_space/Services/auth/auth_services.dart';
import 'package:pent_space/core/const/app_const.dart';
import '../../../models/usermodel/user_model.dart';

class GetUserDataController extends GetxController {
  bool isLoading = false;
  UserData userdata = UserData();
  RxBool loading = false.obs;

  setUserData(UserData data) {
    userdata = data;
    update();
  }

  var resData;

  Future<void> getUserData() async {
    loading.value = false;

    resData = await AuthServices().getUserData();
    print(resData.body);
    Map<String, dynamic> response = json.decode(resData.body);
    if (response['status']['success'] == true) {
      UserRole = response['data']['user_type'];
      loading.value = false;
      setUserData(UserData.fromJson(response));
      sendFCMToken();
      Get.snackbar('Message', response['message']);
    } else {
      loading.value = false;
      Get.snackbar('Message', response['message']);
    }
  }

  void sendFCMToken() async {
    try {
      loading.value = true;
      var data = {
        'fcm_token': Fcmtoken.isNotEmpty
            ? Fcmtoken
            : 'fV3UYFnoTmqSQOB9n6InRt:APA91bGmqdJ4OciaD8eGw5TCYjjRuj4GUP4TYpfALnJN7VPD54O46WSS-kGY1rXHHZreh8i4ndr0ohrCDrShuU8DTWX8iwNE-zS4iT--eHPzRbYsoIqkZGGegJlyDsll6pWtMophMyHX',
      };
      var result = await AuthServices().SendFCMToken(data);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
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
