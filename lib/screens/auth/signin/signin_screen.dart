// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pent_space/core/const/colors.dart';
// import 'package:pent_space/core/utils/app_utils.dart';
// import 'package:pent_space/screens/auth/forgot_password/forgot_password_screen.dart';
// import 'package:pent_space/screens/auth/signin/signin_notifier.dart';
// import 'package:pent_space/screens/auth/signup/signup_screen.dart';
// import 'package:pent_space/widgets/input_widget.dart';
// import 'package:pent_space/widgets/loader.dart';
// import 'package:sizer/sizer.dart';

// class SigninScreen extends ConsumerWidget {
//   const SigninScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final notifier = ref.watch(signinChangeProvider);
//     return Scaffold(
//       backgroundColor: AppPallet.whiteBackground,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 4.8.w),
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView(
//                   padding: EdgeInsets.zero,
//                   children: [
//                     Padding(padding: EdgeInsets.only(top: 6.h)),
//                     Center(
//                       child: Text(
//                         "Sign In Now",
//                         style: TextStyle(
//                           color: AppPallet.textColor,
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 2.h)),
//                     Text(
//                       "Please enter your information below in order to login to your account.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: AppPallet.lightTextColor,
//                         fontSize: 11.sp,
//                         height: 0.17.h,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 4.h)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 4.w),
//                       child: Column(
//                         children: [
//                           InputWidget(
//                             controller: notifier.emailAddressController,
//                             icon: Icon(
//                               Icons.email_outlined,
//                               color: AppPallet.textColor,
//                               size: 15.sp,
//                             ),
//                             label: 'Email Address',
//                             hint: 'Johnsmith@gmail.com',
//                           ),
//                           Padding(padding: EdgeInsets.only(top: 1.h)),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Password',
//                                 style: TextStyle(
//                                   color: AppPallet.lightTextColor,
//                                   fontSize: 11.sp,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   AppUtils.go(const ForgotPasswordScreen());
//                                 },
//                                 child: Text(
//                                   'Forgot Password?',
//                                   style: TextStyle(
//                                     color: AppPallet.textColor,
//                                     fontSize: 10.sp,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           Padding(padding: EdgeInsets.only(top: 0.8.h)),
//                           InputWidget(
//                             controller: notifier.passwordController,
//                             icon: Icon(
//                               Icons.lock_outline,
//                               color: AppPallet.textColor,
//                               size: 15.sp,
//                             ),
//                             hint: 'Enter password',
//                             obscure: !notifier.showpassword,
//                             trailingIcon: GestureDetector(
//                               onTap: () {
//                                 notifier.toggleShowPassword();
//                               },
//                               child: Icon(
//                                 !notifier.showpassword
//                                     ? Icons.visibility
//                                     : Icons.visibility_off_outlined,
//                                 color: AppPallet.lightTextColor,
//                                 size: 14.sp,
//                               ),
//                             ),
//                           ),
//                           Padding(padding: EdgeInsets.only(top: 4.h)),
//                           GestureDetector(
//                             onTap: () {
//                               // AppUtils.go(const HomeScreen());

//                               notifier.login();
//                             },
//                             child: Container(
//                               width: double.infinity,
//                               height: 5.5.h,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 color: AppPallet.textColor,
//                                 borderRadius: BorderRadius.circular(1.5.w),
//                               ),
//                               child: notifier.isLogining
//                                   ? const Loader()
//                                   : Text(
//                                       'Sign In',
//                                       style: TextStyle(
//                                         color: AppPallet.whiteTextColor,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.w400,
//                                       ),
//                                     ),
//                             ),
//                           ),
//                           Padding(padding: EdgeInsets.only(top: 2.h)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   AppUtils.go(const SignupScreen());
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Have an account already?',
//                       style: TextStyle(
//                         color: AppPallet.lightTextColor,
//                         fontSize: 11.sp,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     Padding(padding: EdgeInsets.only(right: 2.w)),
//                     Text(
//                       'Create Now',
//                       style: TextStyle(
//                         color: AppPallet.textColor,
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(padding: EdgeInsets.only(top: 2.h)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
