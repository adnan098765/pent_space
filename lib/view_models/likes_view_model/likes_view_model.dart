// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print, invalid_use_of_protected_member

import 'dart:convert';
import 'package:get/get.dart';
import '../../../Services/auth/auth_services.dart';

class LikesViewModel extends GetxController {
  RxInt feedsid = 0.obs;
  RxBool loading = false.obs;
  RxList<String> favList = RxList<String>();

  void addToLike(String id, like) {
    if (like == "yes") {
      favList.add(id);
    } else {
      if (favList.contains(id)) {
        favList.remove(id);
      } else {
        favList.add(id);
      }
    }
    update();
  }

  void AddLikeDisLike() async {
    try {
      loading.value = true;
      var data = {
        'feed_id': feedsid.value,
      };
      var result = await AuthServices().AddLike(data);
      Map<String, dynamic> response = json.decode(result.body);

      if (response['status']['success'] == true) {
        print('Liked');
      } else {
        print('Error');
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
      print('Final Error');
    }
  }
}
