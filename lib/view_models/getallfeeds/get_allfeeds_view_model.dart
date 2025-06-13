// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable, invalid_use_of_protected_member

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:pent_space/Services/auth/auth_services.dart';
import 'package:pent_space/screens/onboarding/onboarding_screen.dart';
import '../../../models/usermodel/user_model.dart';
import '../likes_view_model/likes_view_model.dart';

class AllFeedsController extends GetxController {
  final likedvm = Get.put(LikesViewModel());

  UserData userdata = UserData();
  RxBool loading = false.obs;

  setUserData(UserData data) {
    userdata = data;
    update();
  }

  List AllFeeds = [];
  RxList MyFeeds = [].obs;

  Future<void> getAllFeeds() async {
    likedvm.favList.value.clear();
    try {
      loading.value = true;
      var resData = await AuthServices().getAllFeeds();
      Map<String, dynamic> response = json.decode(resData.body);
      if (response['status']['success'] == true) {
        AllFeeds = response['data'];
        // Get.snackbar('Message', response['message']);
        // AllFeeds.forEach((element) {
        //   if (element["is_liked"] == 1) {
        //     likedvm.addToLike(element["id"].toString(), 'yes');
        //   }
        // });
        for (var i = 0; i < AllFeeds.length; i++) {
          if (AllFeeds[i]['is_liked'] == true) {
            likedvm.addToLike(AllFeeds[i]['id'].toString(), 'yes');
          }
        }
      } else if (response['message'] == 'Access Token Expired.') {
        Get.snackbar('Message', response['message']);
        Get.offAll(() => OnBoardingScreen());
      } else if (response['message'] == 'Access Token Expired.') {
        Get.snackbar('Message', response['message']);
        Get.offAll(() => OnBoardingScreen());
      } else if (response['message'] == 'User not found.') {
        Get.snackbar('Message', response['message']);
        Get.offAll(() => OnBoardingScreen());
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
    }
  }

  Future<void> getMyFeeds() async {
    likedvm.favList.value.clear();
    try {
      loading.value = true;
      var resData = await AuthServices().getMyFeeds();
      Map<String, dynamic> response = json.decode(resData.body);
      if (response['status']['success'] == true) {
        MyFeeds.value = response['data'];

        for (var i = 0; i < MyFeeds.length; i++) {
          if (MyFeeds[i]['is_liked'] == 1) {
            likedvm.addToLike(MyFeeds[i]['id'].toString(), 'yes');
          }
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

  deleteFeed(feedid) async {
    try {
      loading.value = true;
      var result = await AuthServices().deleteFeed(feedid);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        removeById(response['data']);

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

  removeById(data) {
    print("Data to remove: ${data["id"]}");
    print("Before removal: $MyFeeds");
    MyFeeds.value
        .removeWhere((element) => data["id"].toString() == element["id"]);
    log("After removal: $MyFeeds");
    update();
  }

  // addOne(data) {
  //   PaymentMethods.add(data);
  //   update();
  // }
}
