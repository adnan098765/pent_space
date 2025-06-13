import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pent_space/core/notifiers/app_notifier.dart';
import 'package:pent_space/core/services/api_service.dart';
import 'package:pent_space/models/app_state_model.dart';
import 'package:pent_space/screens/home/models/feeds_model.dart';
import 'package:pent_space/widgets/platformDialog.dart';

import '../../Services/firebaseServices.dart';
import '../../core/utils/app_utils.dart';
import '../home/home_screen.dart';

var profileChangeProfider = ChangeNotifierProvider<ProfileNotifier>((ref) {
  return ProfileNotifier();
});

class ProfileNotifier extends ChangeNotifier {
  TextEditingController firstNameController =
      TextEditingController(text: globalUserData.firstName);
  TextEditingController lastNameController =
      TextEditingController(text: globalUserData.lastName);
  TextEditingController dateOfBirthController =
      TextEditingController(text: globalUserData.dateOfBirth);
  TextEditingController maritalStatusController =
      TextEditingController(text: globalUserData.maritalStatus);
  TextEditingController professionController =
      TextEditingController(text: globalUserData.profession);
  TextEditingController schoolAttendedController =
      TextEditingController(text: globalUserData.schoolAttended);

  ProfileNotifier() {
    _fetchCrowdFund();
    _fetchFeeds();
  }
  String _currentTab = "feeds";
  get currentTab => _currentTab;

  void setCurrentTab(String value) {
    _currentTab = value;
    notifyListeners();
  }

  String selectedGender = ''; // 'Male' or 'Female'

  void setGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  Uint8List? _image;
  get image => _image;

  // selectImage() async {
  //   try {
  //     Uint8List? im = await pickImage(ImageSource.gallery);

  //     if (im != null) {
  //       EasyLoading.show();
  //       // Image successfully picked
  //       _image = im;
  //       String photoUrl = await StorageMethods()
  //           .uploadImageToStorage('profilePics', im, false);
  //       globalUserData.image = photoUrl;
  //       FirebaseService()
  //           .updatedata(globalUserData.toJson(), globalUserData.userId);
  //       EasyLoading.dismiss();
  //       print(globalUserData.image);
  //     } else {
  //       // Image picking was canceled or failed
  //       print("Image picking canceled or failed");
  //       // You can show a message or perform other actions if needed
  //     }
  //   } catch (e) {
  //     // Handle other exceptions
  //     print("Error in selectImage: $e");
  //     // You can show a message or perform other actions if needed
  //   } finally {
  //     // Always notify listeners to update the UI
  //     notifyListeners();
  //   }
  // }

  bool _isLogining = false;

  bool get isLogining => _isLogining;
  // savechanges() async {
  //   if (_isLogining) {
  //     return;
  //   }
  //   _isLogining = true;
  //   notifyListeners();

  //   try {
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       EasyLoading.show();
  //       print("update pofile start");
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(user.uid)
  //           .set(globalUserData.toJson(), SetOptions(merge: true));
  //       AppUtils.go(const HomeScreen());
  //     }
  //     EasyLoading.showSuccess("Successfully Update");

  //     print("update pofile end");

  //     _isLogining = false;
  //     notifyListeners();
  //   } catch (e) {
  //     EasyLoading.dismiss();
  //     _isLogining = false;
  //     print("Error updating profile: $e");
  //   }
  // }

  final List<FeedsModel> _feedList = [];
  List<FeedsModel> get feedList => _feedList;

  final bool _isFetchingFeeds = false;
  bool get isFetchingFeeds => _isFetchingFeeds;
  _fetchFeeds() async {
    // try {
    //   if (_isFetchingFeeds) {
    //     return;
    //   }
    //   _isFetchingFeeds = true;
    //   notifyListeners();
    //   print("User Id: ${AppState.userId}");

    //   var res = await ApiService.get(path: "/feeds/${AppState.userId}");

    //   print(res);

    //   if (res["code"] == "00") {
    //     _isFetchingFeeds = false;
    //     // _feedList = FeedsModel.feedsModelFromJson(res["otherDetails"]["data"]);
    //     notifyListeners();
    //   } else {
    //     _isFetchingFeeds = false;
    //     notifyListeners();
    //     // PlatformDialog.showModal(title: 'Alert', body: res["message"]);
    //   }
    // } catch (e) {
    //   _isFetchingFeeds = false;
    //   notifyListeners();
    // }
  }
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  String _country = "Married";
  get country => _country;

  void setCountry(String value) {
    _country = value;
    notifyListeners();
  }

  final List _crowdFundList = [];
  List get crowdFundList => _crowdFundList;

  final bool _isFetchingCrowdFund = false;
  bool get isFetchingCrowdFund => _isFetchingCrowdFund;

  Future<bool> sendFriendRequest(userId, userdata) async {
    try {
      // Simulate some asynchronous operation, replace it with your actual logic
      await Future.delayed(Duration(seconds: 2));

      // Add the friend request to Firestore
      // Note: You may need to adjust this logic based on your data structure
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(userdata);

      notifyListeners();
      return true; // Friend request sent successfully
    } catch (e) {
      print("Error sending friend request: $e");
      return false; // Failed to send friend request
    }
  }

  _fetchCrowdFund() async {
    // try {
    //   if (_isFetchingCrowdFund) {
    //     return;
    //   }
    //   _isFetchingCrowdFund = true;
    //   notifyListeners();
    //   var res = await ApiService.get(path: "/project/${AppState.userId}");

    //   if (res["code"] == "00") {
    //     _isFetchingCrowdFund = false;

    //     // _crowdFundList = res["otherDetails"]["data"];
    //     notifyListeners();
    //   } else {
    //     _isFetchingCrowdFund = false;
    //     notifyListeners();
    //     // PlatformDialog.showModal(title: 'Alert', body: res["message"]);
    //   }
    // } catch (e) {
    //   _isFetchingCrowdFund = false;
    //   notifyListeners();
    // }
  }
}
