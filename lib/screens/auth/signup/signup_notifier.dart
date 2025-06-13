import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/auth/signin/signin_screen.dart';
import 'package:pent_space/screens/auth/signup/ServiceProviderRegistration.dart';
import 'package:pent_space/screens/auth/signup/complete_signup.dart';
import 'package:pent_space/screens/auth/signup/enter_phone_screen.dart';
import 'package:pent_space/screens/auth/signup/signup_success_screen.dart';
import 'package:pent_space/widgets/platformDialog.dart';
import '../../../Services/firebaseServices.dart';
import '../../../core/utils/navigation_service.dart';
import '../../../models/app_state_model.dart';

final signupChangeProvider = ChangeNotifierProvider((ref) {
  return SignupNotifier();
});

class SignupNotifier extends ChangeNotifier {
  String _selectedUser = "SERVICE_PROVIDER";
  get selectedUser => _selectedUser;

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController enterSecondKeywordController = TextEditingController();
  TextEditingController enterSecondKeywordController1 = TextEditingController();
  TextEditingController enterSecondKeywordController2 = TextEditingController();
  TextEditingController confirmPasswordController2 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  void setSelectedUser(String value) {
    _selectedUser = value;
    notifyListeners();
    if (value == "SERVICE_PROVIDER") {
      AppUtils.go(const ServiceProvideRegister(
        userboolean: false,
      ));
      // AppUtils.go(const CompleteSignup(
      //   userboolean: false,
      // ));
      // AppUtils.go(const UploadProfile());
    } else {
      AppUtils.go(const CompleteSignup(
        userboolean: true,
      ));
    }
  }

  String _userCategory = "Choose Service Category";
  get userCategory => _userCategory;
  void setUserCategory(String value) {
    _userCategory = value;
    notifyListeners();
  }

  Uint8List? _image;
  get image => _image;
  String photoUrl = "";
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

  String _country = "Nigeria";
  get country => _country;

  void setCountry(String value) {
    _country = value;
    notifyListeners();
  }

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
  late final TextEditingController addressController =
      TextEditingController(text: '');
  late final TextEditingController passwordController =
      TextEditingController(text: '');
  late final TextEditingController confirmPasswordController =
      TextEditingController(text: '');

  bool _isRegistering = false;
  bool get isRegistering => _isRegistering;

//mynew register
  // Future<void> register(bool userValue) async {
  //   try {
  //     if (_isRegistering) {
  //       print("Registration already in progress");
  //       return;
  //     }

  //     if (passwordController.text.isEmpty ||
  //         confirmPasswordController.text.isEmpty) {
  //       print("Validation failed: Password can't be empty");
  //       return PlatformDialog.showModal(
  //         title: 'Alert',
  //         body: "Password can't be empty",
  //       );
  //     }
  //     if (passwordController.text != confirmPasswordController.text) {
  //       print("Validation failed: Passwords don't match");
  //       return PlatformDialog.showModal(
  //         title: 'Alert',
  //         body: "Passwords don't match",
  //       );
  //     }
  //     if (emailAddressController.text.isEmpty) {
  //       print("Validation failed: Email can't be empty");
  //       return PlatformDialog.showModal(
  //         title: 'Alert',
  //         body: "Email can't be empty",
  //       );
  //     }
  //     if (firstNameController.text.isEmpty) {
  //       print("Validation failed: First name can't be empty");
  //       return PlatformDialog.showModal(
  //         title: 'Alert',
  //         body: "First name can't be empty",
  //       );
  //     }
  //     if (lastNameController.text.isEmpty) {
  //       print("Validation failed: Last name can't be empty");
  //       return PlatformDialog.showModal(
  //         title: 'Alert',
  //         body: "Last name can't be empty",
  //       );
  //     }
  //     if (phomeController.text.isEmpty) {
  //       print("Validation failed:  Phone number can't be empty");
  //       return PlatformDialog.showModal(
  //         title: 'Alert',
  //         body: "Phone number can't be empty",
  //       );
  //     }

  //     _isRegistering = true;
  //     notifyListeners();

  //     print("Registering user...");
  //     FirebaseService firebaseService = FirebaseService();
  //     if (image == null) {
  //       AppStateModel? appStateModel =
  //           await firebaseService.signUpWithEmailAndPassword(
  //         address: addressController.text.trim().toString(),
  //         image: null,
  //         brandname: businessNameController.text,
  //         email: emailAddressController.text.trim(),
  //         password: passwordController.text,
  //         firstName: firstNameController.text,
  //         lastName: lastNameController.text,
  //         phone: phomeController.text,
  //         avatar: "",
  //         country: _country,
  //         userBoolean: userValue,
  //       );
  //       if (appStateModel != null) {
  //         print("Registration successful");
  //         FirebaseService firebaseService = FirebaseService();

  //         // AppStateModel? appStateModel2 =
  //         //     await firebaseService.signInWithEmailAndPassword(
  //         //         email: emailAddressController.text.trim().toString(),
  //         //         password: passwordController.text.trim().toString());
  //         // verifyPhoneNumber();
  //         Navigator.pushAndRemoveUntil(
  //           NavigationService.instance.getContext(),
  //           MaterialPageRoute(
  //             builder: (context) => const SigninScreen(),
  //           ),
  //           (route) => false,
  //         );
  //         // AppUtils.go(HomeScreen());
  //       } else {
  //         print("Registration failed");
  //         // PlatformDialog.showModal(
  //         //   title: 'Alert',
  //         //   body: "An error occurred while signing up",
  //         // );
  //       }
  //     } else {
  //       AppStateModel? appStateModel =
  //           await firebaseService.signUpWithEmailAndPassword(
  //         image: _image!,
  //         address: addressController.text.trim().toString(),
  //         brandname: businessNameController.text,
  //         email: emailAddressController.text.trim(),
  //         password: passwordController.text,
  //         firstName: firstNameController.text,
  //         lastName: lastNameController.text,
  //         phone: phomeController.text,
  //         avatar: "",
  //         country: _country,
  //         userBoolean: userValue,
  //       );
  //       if (appStateModel != null) {
  //         print("Registration successful");
  //         // verifyPhoneNumber();
  //         AppUtils.go(const SigninScreen());
  //       } else {
  //         print("Registration failed");
  //         PlatformDialog.showModal(
  //           title: 'Alert',
  //           body: "An error occurred while signing up",
  //         );
  //       }
  //     }
  //   } finally {
  //     _isRegistering = false;
  //     notifyListeners();
  //   }
  // }

  bool _isVerifyingOtp = false;
  bool get isVerifyingOtp => _isVerifyingOtp;

  // Future<bool> verifyPhoneNumber() async {
  //   try {
  //     if (_isVerifyingOtp) {
  //       print("Verification already in progress");
  //       return false;
  //     }

  //     _isVerifyingOtp = true;
  //     notifyListeners();

  //     print("Initiating phone verification...");
  //     bool verificationInitiated = await FirebaseService()
  //         .initiatePhoneVerification(phomeController.text);

  //     if (verificationInitiated) {
  //       print("Phone verification initiated successfully");
  //       AppUtils.go(const EnterPhoneScreen());
  //     } else {
  //       print("Failed to initiate phone verification");
  //       PlatformDialog.showModal(
  //         title: 'Alert',
  //         body: 'Failed to initiate phone verification. Please try again.',
  //       );
  //     }

  //     return verificationInitiated;
  //   } catch (e) {
  //     print("Error during phone verification: $e");
  //     PlatformDialog.showModal(
  //       title: 'Alert',
  //       body: 'An unexpected error occurred. Please try again later.',
  //     );
  //     return false;
  //   } finally {
  //     _isVerifyingOtp = false;
  //     notifyListeners();
  //   }
  // }

  // verifyOtp() async {
  //   try {
  //     if (_isVerifyingOtp) {
  //       print("OTP verification already in progress");
  //       return;
  //     }

  //     _isVerifyingOtp = true;
  //     notifyListeners();

  //     print("Verifying OTP...");
  //     bool otpVerified = await FirebaseService().verifyOtp(
  //       phone: phomeController.text,
  //       otp: "${box1.text}${box2.text}${box3.text}${box4.text}",
  //     );

  //     if (otpVerified) {
  //       print("OTP verification successful");
  //       AppUtils.go(const SignupSuccessScreen());
  //     } else {
  //       print("Failed to verify OTP");
  //       PlatformDialog.showModal(
  //         title: 'Alert',
  //         body:
  //             'Failed to verify OTP. Please check the entered code and try again.',
  //       );
  //     }
  //   } catch (e) {
  //     print("Error during OTP verification: $e");
  //     PlatformDialog.showModal(
  //       title: 'Alert',
  //       body: 'An unexpected error occurred. Please try again later.',
  //     );
  //   } finally {
  //     _isVerifyingOtp = false;
  //     notifyListeners();
  //   }
  // }

  bool _isResendingOtp = false;
  bool get isResendingOtp => _isResendingOtp;

  // Future<void> resendOtp() async {
  //   try {
  //     if (_isResendingOtp) {
  //       return;
  //     }

  //     // Set loading state
  //     _isResendingOtp = true;
  //     notifyListeners();

  //     // Call the FirebaseService function for resending OTP
  //     // You need to implement this function in FirebaseService
  //     // and handle the logic for resending the OTP to the user's phone number
  //     bool otpResent = await FirebaseService()
  //         .initiatePhoneVerification(phomeController.text);

  //     if (otpResent) {
  //       // Handle successful OTP resend (e.g., show a message to the user)
  //       print("OTP resent successfully");
  //     } else {
  //       // Handle failure to resend OTP
  //       PlatformDialog.showModal(
  //         title: 'Alert',
  //         body: 'Failed to resend OTP. Please try again.',
  //       );
  //     }
  //   } catch (e) {
  //     print(e);
  //     // Handle any unexpected errors
  //     PlatformDialog.showModal(
  //       title: 'Alert',
  //       body: 'An unexpected error occurred. Please try again later.',
  //     );
  //   } finally {
  //     // Set loading state to false regardless of success or failure
  //     _isResendingOtp = false;
  //     notifyListeners();
  //   }
  // }

//   register() async {
//     AppUtils.go(const VerifyEmailScreen());

// //     try {
// //       if (_isRegistering) {
// //         return;
// //       }
// //       if (passwordController.text.isEmpty ||
// //           confirmPasswordController.text.isEmpty) {
// //         return PlatformDialog.showModal(
// //           title: 'Alert',
// //           body: "Password can't be empty",
// //         );
// //       }
// //       if (passwordController.text != confirmPasswordController.text) {
// //         return PlatformDialog.showModal(
// //           title: 'Alert',
// //           body: "Passwords don't match",
// //         );
// //       }
// //       _isRegistering = true;
// //       notifyListeners();

// //       var res = await ApiService.post(path: "/account/signUp", data: {
// //         // "name": _fullnameController.text,
// //         // "username": "naturo",
// //         // "pin": "123456",
// //         // "profilePicture": "",
// //         // "msisdn": "07041234567",
// //         // "accountType": "SERVICE_PROVIDER",
// //         // "category": {
// //         //   "categoryName":
// //         //       _selectedUser == "USER" ? "USER" : businessNameController.text,
// //         // },
// //         // "address": {
// //         //   "addressLine1": "",
// //         //   "addressLine2": "",
// //         // },
// //         // "additionalDetails": "",
// //         // "balance": 0,
// // //

// //         "firstName": firstNameController.text,
// //         "lastName": lastNameController.text,
// //         "phoneNumber": phomeController.text,
// //         "country": _country,
// //         "email": emailAddressController.text,
// //         "password": passwordController.text,
// //         "accountType": "SERVICE_PROVIDER",

// // //
// //         // "firstName": "Naruto",
// //         // "lastName": "Uzumaki",
// //         // "phoneNumber": "9058689321",
// //         // "businessName": _businessNameController.text,
// //         // "country": _country,
// //         // "email": _emailAddressController.text,
// //         // "password": "ql@JmV4Kuobv"
// //       });
// //       if (res["status"] == 200) {
// //         _isRegistering = false;
// //         notifyListeners();
// //         var userBox = Hive.box('userBox');
// //         userBox.put('userId', res["data"]["id"]);
// //         userBox.put('fullName',
// //             "${res["data"]["firstName"]} ${res["data"]["lastName"]}");
// //         userBox.put('phone', res["data"]["phoneNumber"]);
// //         userBox.put('email', res["data"]["email"]);
// //         AppUtils.go(const VerifyEmailScreen());
// //         AppState.setUserId(res["data"]["id"]);
// //         AppState.setFullName(
// //             "${res["data"]["firstName"]} ${res["data"]["lastName"]}");
// //         AppState.setPhone(res["data"]["phoneNumber"]);
// //         AppState.setEmail(res["data"]["email"]);
// //         PlatformDialog.showModal(title: 'Alert', body: res["message"]);
// //       } else {
// //         _isRegistering = false;
// //         notifyListeners();
// //         PlatformDialog.showModal(
// //             title: 'Alert',
// //             body: res["message"] ?? "An error occred while signing up");
// //       }
// //     } catch (e) {
// //       print(e);
// //       _isRegistering = false;
// //       notifyListeners();
// //       PlatformDialog.showModal(title: 'Alert', body: "An error occured");
// //     }
//   }

  // final bool _isVerifyingOtp = false;
  // bool get isVerifyingOtp => _isVerifyingOtp;
  // verifyOtp() async {
  //   AppUtils.go(const SignupSuccessScreen());

  //   // try {
  //   //   if (_isVerifyingOtp) {
  //   //     return;
  //   //   }
  //   //   _isVerifyingOtp = true;
  //   //   notifyListeners();

  //   //   var res = await ApiService.post(path: "/account/validate", data: {
  //   //     "email": emailAddressController.text,
  //   //     "token": "${box1.text}${box2.text}${box3.text}${box4.text}",
  //   //   });
  //   //   if (res["status"] == 200) {
  //   //     var userBox = Hive.box('userBox');
  //   //     userBox.put('token', res["data"]["jwtoken"]["accessToken"]);
  //   //     _isVerifyingOtp = false;
  //   //     notifyListeners();
  //   //     AppUtils.go(const SignupSuccessScreen());
  //   //   } else {
  //   //     _isVerifyingOtp = false;
  //   //     notifyListeners();
  //   //     PlatformDialog.showModal(
  //   //       title: 'Alert',
  //   //       body: res["error"] ?? res["message"],
  //   //     );
  //   //   }
  //   // } catch (e) {
  //   //   print(e);
  //   //   _isVerifyingOtp = false;
  //   //   notifyListeners();
  //   //   PlatformDialog.showModal(title: 'Alert', body: "An error occured");
  //   // }
  // }
}
