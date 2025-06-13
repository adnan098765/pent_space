// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:pent_space/core/notifiers/app_notifier.dart';
// import 'package:pent_space/core/services/api_service.dart';
// import 'package:pent_space/core/utils/app_utils.dart';
// import 'package:pent_space/core/utils/navigation_service.dart';
// import 'package:pent_space/screens/home/home_screen.dart';
// import 'package:pent_space/widgets/platformDialog.dart';

// import '../../../Services/firebaseServices.dart';
// import '../../../models/app_state_model.dart';

// final signinChangeProvider = ChangeNotifierProvider((ref) {
//   return SigninNotifier();
// });

// class SigninNotifier extends ChangeNotifier {
//   late final TextEditingController _emailAddressController =
//       TextEditingController(text: '');
//   late final TextEditingController _passwordController =
//       TextEditingController(text: '');
//   TextEditingController get emailAddressController => _emailAddressController;
//   TextEditingController get passwordController => _passwordController;

//   bool _showpassword = false;
//   bool get showpassword => _showpassword;

//   void toggleShowPassword() {
//     _showpassword = !_showpassword;
//     notifyListeners();
//   }

//   bool _isLogining = false;
//   bool get isLogining => _isLogining;
//   login() async {
//     try {
//       if (_isLogining) {
//         return;
//       }
//       _isLogining = true;
//       notifyListeners();

//       // Use the AuthService to sign in with email and password
//       FirebaseService firebaseService = FirebaseService();

//       AppStateModel? appStateModel =
//           await firebaseService.signInWithEmailAndPassword(
//               email: emailAddressController.text.trim().toString(),
//               password: _passwordController.text.trim().toString());

//       if (appStateModel != null) {
//         globalUserData = appStateModel;
//         _isLogining = false;
//         notifyListeners();

//         // Update user data in Hive or other state management solution if needed

//         print("Login successful!");
//         print("User Email: ${appStateModel.email}");
//         print("User Data: $appStateModel");

//         // AppUtils.go(const HomeScreen());
//         Navigator.pushAndRemoveUntil(
//           NavigationService.instance.getContext(),
//           MaterialPageRoute(
//             builder: (context) => const HomeScreen(),
//           ),
//           (route) => false,
//         );
//       } else {
//         _isLogining = false;
//         notifyListeners();
//         // PlatformDialog.showModal(title: 'Alert', body: 'Login failed.');
//       }
//     } on FirebaseException catch (e) {
//       _isLogining = false;
//       notifyListeners();
//       print("Error during login: $e");
//       PlatformDialog.showModal(title: 'Alert', body: '${e.message}.');
//     } catch (e) {
//       _isLogining = false;
//       notifyListeners();
//       print("Error during login: $e");
//       PlatformDialog.showModal(
//           title: 'Alert', body: 'An error occurred during login.');
//     }
//   }

//   // login() async {
//   //   Navigator.pushAndRemoveUntil(
//   //     NavigationService.instance.getContext(),
//   //     MaterialPageRoute(
//   //       builder: (context) => const HomeScreen(),
//   //     ),
//   //     (route) => false,
//   //   );
//   //   // try {
//   //   //   if (_isLogining) {
//   //   //     return;
//   //   //   }
//   //   //   _isLogining = true;
//   //   //   notifyListeners();

//   //   //   var res = await ApiService.post(path: "/account/login", data: {
//   //   //     "email": _emailAddressController.text,
//   //   //     "password": _passwordController.text
//   //   //   });
//   //   //   if (res["status"] == 200) {
//   //   //     _isLogining = false;
//   //   //     notifyListeners();
//   //   //     var userBox = Hive.box('userBox');
//   //   //     userBox.put('userId', res["data"]["id"]);
//   //   //     userBox.put('token', res["data"]["token"]["accessToken"]);
//   //   //     userBox.put('phone', res["data"]["phoneNumber"]);
//   //   //     userBox.put('email', res["data"]["email"]);

//   //   //     userBox.put('fullName',
//   //   //         "${res["data"]["firstName"]} ${res["data"]["lastName"]}");

//   //   //     AppState.setUserId(res["data"]["id"]);
//   //   //     AppState.setFullName(
//   //   //         "${res["data"]["firstName"]} ${res["data"]["lastName"]}");
//   //   //     AppState.setPhone(res["data"]["phoneNumber"]);
//   //   //     AppState.setEmail(res["data"]["email"]);
//   //   //     AppUtils.go(const HomeScreen());
//   //   //     Navigator.pushAndRemoveUntil(
//   //   //       NavigationService.instance.getContext(),
//   //   //       MaterialPageRoute(
//   //   //         builder: (context) => const HomeScreen(),
//   //   //       ),
//   //   //       (route) => false,
//   //   //     );
//   //   //   } else {
//   //   //     _isLogining = false;
//   //   //     notifyListeners();
//   //   //     PlatformDialog.showModal(title: 'Alert', body: res["message"]);
//   //   //   }
//   //   // } catch (e) {
//   //   //   _isLogining = false;
//   //   //   notifyListeners();
//   //   // }
//   // }
// }
