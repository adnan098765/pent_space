import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pent_space/Services/firebaseServices.dart';
import 'package:pent_space/models/app_state_model.dart';

import '../../../core/utils/app_utils.dart';
import '../../../widgets/platformDialog.dart';
import '../signin/signin_screen.dart';

final registerChangeProvider = ChangeNotifierProvider((ref) {
  return SignupNotifier();
});

class SignupNotifier extends ChangeNotifier {
  late final TextEditingController emailController =
      TextEditingController(text: '');
  late final TextEditingController phoneNumberController =
      TextEditingController(text: '');
  late final TextEditingController nameController =
      TextEditingController(text: '');
  late final TextEditingController enterSecondKeywordController =
      TextEditingController(text: '');
  late final TextEditingController enterSecondKeywordController1 =
      TextEditingController(text: '');
  late final TextEditingController enterSecondKeywordController2 =
      TextEditingController(text: '');
  late final TextEditingController confirmPasswordController2 =
      TextEditingController(text: '');
  late final TextEditingController passwordController2 =
      TextEditingController(text: '');
  late final TextEditingController businessNameController =
      TextEditingController(text: '');

  // late final TextEditingController fullnameController =
  //     TextEditingController(text: '');
  // late final TextEditingController firstNameController =
  //     TextEditingController(text: '');
  // late final TextEditingController lastNameController =
  //     TextEditingController(text: '');
  // late final TextEditingController businessNameController =
  //     TextEditingController(text: '');
  // late final TextEditingController phomeController =
  //     TextEditingController(text: '');
  // late final TextEditingController emailAddressController =
  //     TextEditingController(text: '');
  // late final TextEditingController passwordController =
  //     TextEditingController(text: '');
  // late final TextEditingController confirmPasswordController =
  //     TextEditingController(text: '');

  bool _showPassword = false;
  bool get showPassword => _showPassword;
  void toggleShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  bool _showConfirmPassword = false;
  bool get showConfirmPassword => _showConfirmPassword;
  void toggleShowConfirmPassword() {
    _showConfirmPassword = !_showConfirmPassword;
    notifyListeners();
  }

  String _country = "Nigeria";
  get country => _country;

  void setCountry(String value) {
    _country = value;
    notifyListeners();
  }

  Uint8List? _image;
  get image => _image;
  String photoUrl = "";

  bool _isRegistering = false;
  bool get isRegistering => _isRegistering;
  register(userbool) async {
    if (_isRegistering) {
      print("Registration already in progress");
      return;
    }
    if (businessNameController.text.isEmpty) {
      print("Validation failed: Busniess name can't be empty");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "Busniess name can't be empty",
      );
    }

    if (passwordController2.text.isEmpty ||
        confirmPasswordController2.text.isEmpty) {
      print("Validation failed: Password can't be empty");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "Password can't be empty",
      );
    }

    if (passwordController2.text != confirmPasswordController2.text) {
      print("Validation failed: Passwords don't match");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "Passwords don't match",
      );
    }

    if (emailController.text.isEmpty) {
      print("Validation failed: Email can't be empty");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "Email can't be empty",
      );
    }

    if (enterSecondKeywordController.text.isEmpty) {
      print("Validation failed: First Keyword can't be empty");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "First Keyword can't be empty",
      );
    }

    if (enterSecondKeywordController1.text.isEmpty) {
      print("Validation failed: Second Keyword can't be empty");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "Second Keyword can't be empty",
      );
    }

    if (phoneNumberController.text.isEmpty) {
      print("Validation failed: Phone number can't be empty");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "Phone number can't be empty",
      );
    }

    if (image == null) {
      print("Validation failed: Image is required");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "Image is required",
      );
    }

    if (enterSecondKeywordController2.text.isEmpty) {
      print("Validation failed: Third Keyword can't be empty");
      return PlatformDialog.showModal(
        title: 'Alert',
        body: "Third Keyword can't be empty",
      );
    }

    _isRegistering = true;
    notifyListeners();

    // try {
    //   AppStateModel? appStateModel = await FirebaseService()
    //       .signUpWithEmailAndPassword2(
    //           brandname: businessNameController.text,
    //           email: emailController.text,
    //           image: image,
    //           password: passwordController2.text,
    //           firskeyword: enterSecondKeywordController.text,
    //           thirdkeyword: enterSecondKeywordController2.text,
    //           seckeyword: enterSecondKeywordController1.text,
    //           phone: phoneNumberController.text,
    //           avatar: "",
    //           country: country,
    //           userBoolean: userbool);
    //   if (appStateModel != null) {
    //     print("Registration successful");
    //     // verifyPhoneNumber();
    //   }
    // } catch (e) {
    //   _isRegistering = false;
    //   notifyListeners();
    //   print(e);
    // }

    _isRegistering = false;
    notifyListeners();

    // globalUserData = appStateModel!;
  }

  selectImage() async {
    try {
      print(1);
      Uint8List? im = await pickImage(ImageSource.gallery);

      if (im != null) {
        _image = im;
        print(_image);

        // print(globalUserData.image);
      } else {
        // Image picking was canceled or failed
        print("Image picking canceled or failed");
        // You can show a message or perform other actions if needed
      }
    } catch (e) {
      // Handle other exceptions
      print("Error in selectImage: $e");
      // You can show a message or perform other actions if needed
    } finally {
      // Always notify listeners to update the UI
      notifyListeners();
    }
  }
}
