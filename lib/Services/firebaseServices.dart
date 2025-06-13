// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// import '../core/utils/app_utils.dart';
// import '../models/app_state_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
// import 'dart:typed_data';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:uuid/uuid.dart';

// import '../screens/auth/signin/signin_screen.dart';
// import '../widgets/platformDialog.dart';

// class StorageMethods {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   // adding image to firebase storage
//   Future<String> uploadImageToStorage(
//       String childName, Uint8List file, bool isPost) async {
//     // creating location to our firebase storage
//     try {
//       Reference ref =
//           _storage.ref().child(childName).child(_auth.currentUser!.uid);
//       if (isPost) {
//         String id = const Uuid().v1();
//         ref = ref.child(id);
//       }

//       // putting in uint8list format -> Upload task like a future but not future
//       UploadTask uploadTask = ref.putData(file);

//       TaskSnapshot snapshot = await uploadTask;
//       String downloadUrl = await snapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print(e.toString());
//     }
//     return "Error";
//   }
// }

// class FirebaseService {
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   late String _verificationId;

//   String get verificationId => _verificationId;
//   // Sign up with email and password
//   Future<void> setData(String collection,
//       {String? doc, required Map<String, dynamic> data}) async {
//     try {
//       if (doc != null) {
//         await _firestore.collection(collection).doc(doc).set(data);
//       } else {
//         await _firestore.collection(collection).add(data);
//       }
//       print('Data set successfully.');
//     } catch (e) {
//       print('Error setting data: $e');
//       // Handle the error as needed, e.g., show an alert or log it
//     }
//   }

//   Future<Map<String, dynamic>?> getData(String collection, String doc) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await _firestore.collection(collection).doc(doc).get();

//       if (snapshot.exists) {
//         return snapshot.data();
//       } else {
//         print('Document does not exist.');
//         return null;
//       }
//     } catch (e) {
//       print('Error getting data: $e');
//       // Handle the error as needed, e.g., show an alert or log it
//       return null;
//     }
//   }

//   Future<List<Map<String, dynamic>>> getAllData(String collection) async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//           await FirebaseFirestore.instance.collection(collection).get();

//       return querySnapshot.docs.map((doc) => doc.data()).toList();
//     } catch (e) {
//       print('Error getting data: $e');
//       // Handle the error as needed, e.g., show an alert or log it
//       return [];
//     }
//   }

//   updatedata(data, uid, {String collection = 'users'}) async {
//     try {
//       // EasyLoading.show();

//       await _firestore.collection("$collection").doc(uid).update(data);
//       // await _firestore
//       //     .collection("enquiries")
//       //     .where("uid", isEqualTo: uid)
//       //     .(dataa);
//       // print(d);

//       // EasyLoading.showSuccess("Sucessull update");
//     } catch (e) {
//       EasyLoading.dismiss();
//       print(e);
//     }
//   }

//   Future<AppStateModel?> signUpWithEmailAndPassword2(
//       {required String brandname,
//       required String email,
//       required Uint8List? image,
//       required String password,
//       required String firskeyword,
//       required String thirdkeyword,
//       required String seckeyword,
//       required String phone,
//       required String avatar,
//       required String country,
//       required bool userBoolean}) async {
//     try {
//       UserCredential authResult = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       print("User created successfully!");

//       String photoUrl = "";
//       if (image != null) {
//         EasyLoading.show();
//         photoUrl = await StorageMethods()
//             .uploadImageToStorage('profilePics', image, false);
//         print("Photo URL: $photoUrl");
//         User? user = authResult.user;

//         AppStateModel data = AppStateModel(
//           address: "",
//           firstName: "",
//           lastName: "",
//           email: email,
//           phone: phone,
//           avatar: "",
//           userId: user?.uid ?? "",
//           isOnline: true,
//           country: country,
//           token: "",
//           userBoolean: userBoolean,
//           brandName: brandname,
//           image: photoUrl,
//           categories: [""],
//           dateOfBirth: '13-Aug-2000',
//           gender: 'Male',
//           maritalStatus: 'Single',
//           profession: 'Engineer',
//           schoolAttended: 'xyz school',
//         );
//         EasyLoading.dismiss();
//         if (user != null) {
//           await _firestore.collection("users").doc(user.uid).set(data.toJson());
//           AppUtils.go(const SigninScreen());
//           return data;
//         }
//       }
//       print("User creation failed.");
//       return null;
//     } on FirebaseException catch (e) {
//       print("Error in sign up: ${e.message}");
//       PlatformDialog.showModal(
//         title: 'Alert',
//         body: "An error occurred while signing up ${e.message}",
//       );
//       return null;
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<AppStateModel?> signUpWithEmailAndPassword(
//       {String address = "",
//       required String brandname,
//       required String email,
//       required Uint8List? image,
//       required String password,
//       required String firstName,
//       required String lastName,
//       required String phone,
//       required String avatar,
//       required String country,
//       required bool userBoolean}) async {
//     try {
//       print(email);
//       print("Required Fields:");
//       print("  - firstName: $firstName");
//       print("  - lastName: $lastName");
//       print("  - email: $email");
//       print("  - phone: $phone");
//       print("  - avatar: $avatar");
//       print("  - isOnline: true");
//       print("  - country: $country");
//       print("  - token: ''");
//       print("  - userBoolean: $userBoolean");

//       UserCredential authResult = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       print("User created successfully!");

//       String photoUrl = "";
//       if (image != null) {
//         EasyLoading.show();
//         photoUrl = await StorageMethods()
//             .uploadImageToStorage('profilePics', image, false);
//         print("Photo URL: $photoUrl");
//         EasyLoading.dismiss();
//       }

//       User? user = authResult.user;
//       if (user != null) {
//         AppStateModel appStateModel = AppStateModel(
//           address: address,
//           firstName: firstName,
//           lastName: lastName,
//           email: email,
//           phone: phone,
//           avatar: avatar,
//           userId: user.uid,
//           isOnline: true,
//           country: country,
//           token: "",
//           userBoolean: userBoolean,
//           brandName: brandname,
//           image: photoUrl,
//           categories: [],
//           dateOfBirth: '13-Aug-2000',
//           gender: 'Male',
//           maritalStatus: 'Single',
//           profession: 'Engineer',
//           schoolAttended: 'xyz school',
//         );
//         await _firestore
//             .collection("users")
//             .doc(user.uid)
//             .set(appStateModel.toJson());

//         print("AppStateModel Fields:");
//         print("  - userId: ${appStateModel.userId}");
//         print("  - firstName: ${appStateModel.firstName}");
//         print("  - lastName: ${appStateModel.lastName}");
//         print("  - email: ${appStateModel.email}");
//         print("  - phone: ${appStateModel.phone}");
//         print("  - avatar: ${appStateModel.avatar}");
//         print("  - isOnline: ${appStateModel.isOnline}");
//         print("  - country: ${appStateModel.country}");
//         print("  - token: ${appStateModel.token}");
//         print("  - userBoolean: ${appStateModel.userBoolean}");
//         print("  - brandName: ${appStateModel.brandName}");
//         print("  - image: ${appStateModel.image}");
//         print("  - categories: ${appStateModel.categories}");

//         return appStateModel;
//       }

//       print("User creation failed.");
//       return null;
//     } on FirebaseException catch (e) {
//       print("Error in sign up: ${e.message}");
//       PlatformDialog.showModal(
//         title: 'Alert',
//         body: "An error occurred while signing up ${e.message}",
//       );
//       return null;
//     }
//   }

//   Future<AppStateModel?> signInWithEmailAndPassword({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       UserCredential authResult = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       User? user = authResult.user;
//       print(user);
//       if (user != null) {
//         DocumentSnapshot<Map<String, dynamic>> userData =
//             await _firestore.collection('users').doc(user.uid).get();

//         if (userData.exists) {
//           AppStateModel appStateModel =
//               AppStateModel.fromJson(userData.data()!);
//           return appStateModel;
//         } else {
//           print("User data not found.");
//           return null;
//         }
//       }

//       print("Sign-in failed.");
//       return null;
//     } on FirebaseException catch (e) {
//       print("Firebase Authentication Error: ${e.code}, ${e.message}");
//       PlatformDialog.showModal(title: 'Alert', body: '${e.message}.');

//       return null;
//     } catch (e) {
//       print("Error in sign in: $e");
//       PlatformDialog.showModal(title: 'Alert', body: '${e}.');

//       return null;
//     }
//   }

//   Future<bool> initiatePhoneVerification(String phoneNumber) async {
//     Completer<bool> verificationCompleter = Completer<bool>();

//     try {
//       await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await _auth.signInWithCredential(credential);
//           print("Verification completed successfully");
//           verificationCompleter.complete(true);
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           print("Verification failed: ${e.message}");
//           verificationCompleter.complete(false);
//         },
//         codeSent: (String verificationId, int? resendToken) {
//           print(
//               "Verification code sent to $phoneNumber with verificationId: $verificationId");
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {
//           print(
//               "Code auto-retrieval timeout with verificationId: $verificationId");
//         },
//         timeout: Duration(seconds: 60),
//       );
//     } catch (e) {
//       print("Error initiating phone verification: $e");
//       verificationCompleter.complete(false);
//     }

//     return verificationCompleter.future;
//   }

//   Future<bool> verifyOtp({required String phone, required String otp}) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId:
//             verificationId, // You need to obtain the verificationId during codeSent callback
//         smsCode: otp,
//       );

//       await _auth.signInWithCredential(credential);
//       print("OTP verification successful");
//       return true;
//     } catch (e) {
//       print("Error verifying OTP: $e");
//       return false;
//     }
//   }
//   // Other authentication-related methods can be added here
// }
