import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/extensions/globalkey_extension.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/auth/signup/UserSearchbox.dart';
import 'package:pent_space/screens/home/models/feeds_model.dart';

import '../explore/explore_screen.dart';
import '../messages/messages_screen.dart';
import '../profile/profile_screen.dart';
import 'home_screen.dart';

class HomeController extends GetxController {
  var showFeeds = true.obs;
  var currentScreen = "home".obs;
  var serviceMenuHeight = 0.0.obs;
  var showServiceMenu = false.obs;
  var feedList = <FeedsModel>[].obs;
  var isFetchingFeeds = false.obs;
  var newCommentList = <Comment>[].obs;
  var isSendingComment = false.obs;

  final serviceHeaderKey = GlobalKey();
  late TextEditingController commentController =
      TextEditingController(text: '');

  void toggleFeeds(bool value) {
    if (!value) {
      AppUtils.go(UserSearchBox());
    }
    showFeeds.value = value;
  }

  void setCurrentScreen(String value) {
    currentScreen.value = value;
    showServiceMenu.value = false;
    update();
  }

  void setServiceMenuHeight() {
    serviceMenuHeight.value = serviceHeaderKey.globalPaintBounds!.top;
  }

  void toggleServiceMenu() {
    showServiceMenu.value = !showServiceMenu.value;
  }

  // void navigateToScreen(String screen) {
  //   currentScreen.value = screen;
  //   switch (screen) {
  //     case 'explore':
  //       Get.to(() => ExploreScreen());
  //       break;
  //     case 'messages':
  //       Get.to(() => MessagesScreen());
  //       break;
  //     case 'profile':
  //       Get.to(() => ProfileScreen());
  //       break;
  //     case 'home':
  //     default:
  //       Get.to(() => HomeScreen());
  //       break;
  //   }
  // }
}
