import 'package:get/get.dart';
import '../../core/utils/app_utils.dart';
import '../../screens/auth/signup/UserSearchbox.dart';

class FeedController extends GetxController {
  var showFeeds = true.obs; // Observable variable

  void toggleFeeds(bool value) {
    if (value == false) {
      // Assuming AppUtils.go is a method to navigate to UserSearchBox
      AppUtils.go(UserSearchBox());

      showFeeds.value = value;
      print(value.toString() + " value");
    } else {
      showFeeds.value = value;
    }
  }
}
