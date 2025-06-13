import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pent_space/core/notifiers/app_notifier.dart';
import 'package:pent_space/core/services/api_service.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/auth/forgot_password/reset_password_success_screen.dart';
import 'package:pent_space/screens/auth/forgot_password/verify_forgot_password_email_screen.dart';
import 'package:pent_space/screens/auth/signin/signin_screen.dart';
import 'package:pent_space/screens/auth/signup/complete_signup.dart';
import 'package:pent_space/screens/auth/signup/enter_phone_screen.dart';
import 'package:pent_space/screens/auth/signup/signup_success_screen.dart';
import 'package:pent_space/screens/auth/signup/upload_profile.dart';
import 'package:pent_space/screens/auth/signup/verify_email_screen.dart';
import 'package:pent_space/widgets/platformDialog.dart';

final forgotPasswordChangeProvider = ChangeNotifierProvider((ref) {
  return ForgotPasswordNotifier();
});

class ForgotPasswordNotifier extends ChangeNotifier {
  void verifyBusinesData() {}

  late final TextEditingController _box1 = TextEditingController(text: '');
  late final TextEditingController _box2 = TextEditingController(text: '');
  late final TextEditingController _box3 = TextEditingController(text: '');
  late final TextEditingController _box4 = TextEditingController(text: '');
  late final TextEditingController _box5 = TextEditingController(text: '');
  late final TextEditingController _box6 = TextEditingController(text: '');

  TextEditingController get box1 => _box1;
  TextEditingController get box2 => _box2;
  TextEditingController get box3 => _box3;
  TextEditingController get box4 => _box4;
  TextEditingController get box5 => _box5;
  TextEditingController get box6 => _box6;

  final _editableBox1 = true;
  final _editableBox2 = true;
  final _editableBox3 = true;
  final _editableBox4 = true;
  final _editableBox5 = true;
  final _editableBox6 = true;

  bool get editableBox1 => _editableBox1;
  bool get editableBox2 => _editableBox2;
  bool get editableBox3 => _editableBox3;
  bool get editableBox4 => _editableBox4;
  bool get editableBox5 => _editableBox5;
  bool get editableBox6 => _editableBox6;

  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  FocusNode myFocusNode3 = FocusNode();
  FocusNode myFocusNode4 = FocusNode();
  FocusNode myFocusNode5 = FocusNode();
  FocusNode myFocusNode6 = FocusNode();

  late final TextEditingController fullnameController =
      TextEditingController(text: '');
  late final TextEditingController firstNameController =
      TextEditingController(text: '');
  late final TextEditingController lastNameController =
      TextEditingController(text: '');
  late final TextEditingController businessNameController =
      TextEditingController(text: '');
  late final TextEditingController phomeController =
      TextEditingController(text: '');
  late final TextEditingController emailAddressController =
      TextEditingController(text: '');
  late final TextEditingController passwordController =
      TextEditingController(text: '');
  late final TextEditingController confirmPasswordController =
      TextEditingController(text: '');

  bool _isResetingPassword = false;
  bool get isResetingPassword => _isResetingPassword;

  resetPassword() async {
    try {
      if (_isResetingPassword) {
        return;
      }

      _isResetingPassword = true;
      notifyListeners();
      print(emailAddressController.text.toString());
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailAddressController.text,
      );

      _isResetingPassword = false;
      notifyListeners();

      //AppUtils.go(const SigninScreen());
      // You might want to show a success message here
      PlatformDialog.showModal(
          title: 'Success', body: 'Password reset email sent.');
    } on FirebaseAuthException catch (e) {
      _isResetingPassword = false;
      notifyListeners();

      String errorMessage = 'An error occurred while resetting the password.';

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email address.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address format.';
          break;
        default:
          errorMessage = 'Error: ${e.message}';
          break;
      }

      PlatformDialog.showModal(title: 'Alert', body: errorMessage);
    } catch (e) {
      print(e);

      _isResetingPassword = false;
      notifyListeners();

      PlatformDialog.showModal(
          title: 'Alert',
          body: 'An unexpected error occurred. Please try again later.');
    }
  }
  // resetPassword() async {
  //   AppUtils.go(const VerifyForgotPasswordEmailScreen());

  //   // try {
  //   //   if (_isResetingPassword) {
  //   //     return;
  //   //   }

  //   //   _isResetingPassword = true;
  //   //   notifyListeners();

  //   //   var res = await ApiService.post(path: "/account/forgotPassword", data: {
  //   //     "email": emailAddressController.text,
  //   //   });
  //   //   if (res["status"] == 200) {
  //   //     _isResetingPassword = false;
  //   //     notifyListeners();
  //   //     AppUtils.go(const VerifyForgotPasswordEmailScreen());
  //   //     PlatformDialog.showModal(title: 'Success', body: res["message"]);
  //   //   } else {
  //   //     _isResetingPassword = false;
  //   //     notifyListeners();
  //   //     PlatformDialog.showModal(
  //   //         title: 'Alert',
  //   //         body: res["message"] ?? "An error occred while signing up");
  //   //   }
  //   // } catch (e) {
  //   //   print(e);
  //   //   _isResetingPassword = false;
  //   //   notifyListeners();
  //   //   PlatformDialog.showModal(title: 'Alert', body: "An error occured");
  //   // }
  // }

  final bool _isVerifyingOtp = false;
  bool get isVerifyingOtp => _isVerifyingOtp;
  verifyOtpResetPassword() async {
    AppUtils.go(const ResetPasswordSuccessScreen());

    // try {
    //   if (passwordController.text.isEmpty ||
    //       confirmPasswordController.text.isEmpty) {
    //     return PlatformDialog.showModal(
    //       title: 'Alert',
    //       body: "Password can't be empty",
    //     );
    //   }
    //   if (passwordController.text != confirmPasswordController.text) {
    //     return PlatformDialog.showModal(
    //       title: 'Alert',
    //       body: "Passwords don't match",
    //     );
    //   }
    //   if (_isVerifyingOtp) {
    //     return;
    //   }
    //   _isVerifyingOtp = true;
    //   notifyListeners();

    //   var res = await ApiService.post(path: "/account/validate", data: {
    //     "email": emailAddressController.text,
    //     "token": "${box1.text}${box2.text}${box3.text}${box4.text}",
    //     "newPassword": passwordController.text
    //   });

    //   if (res["status"] == 200) {
    //     var userBox = Hive.box('userBox');
    //     userBox.put('token', res["data"]["jwtoken"]["accessToken"]);
    //     _isVerifyingOtp = false;
    //     notifyListeners();

    //     AppUtils.go(const ResetPasswordSuccessScreen());
    //   } else {
    //     _isVerifyingOtp = false;
    //     notifyListeners();
    //     PlatformDialog.showModal(
    //       title: 'Alert',
    //       body: res["error"] ?? res["message"],
    //     );
    //   }
    // } catch (e) {
    //   print(e);
    //   _isVerifyingOtp = false;
    //   notifyListeners();
    //   PlatformDialog.showModal(title: 'Alert', body: "An error occured");
    // }
  }
}
