// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/app_const.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/auth/signin/signin_screen.dart';
import 'package:pent_space/screens/auth/signup/signup_notifier.dart';
import 'package:sizer/sizer.dart';

import '../signin/user_signin_screen.dart';
import 'user_signup.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupChangeProvider);
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 19.sp,
                        color: AppPallet.textColor,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Text(
                      "Welcome to PentSpace",
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(
                      "Are you looking for service or you provide service?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.h)),
                    GestureDetector(
                      onTap: () {
                        UserRole = 'BUSINESS';
                        print('User Role ${UserRole}');
                        Get.to(() => UserSignupScreen());
                        //notifier.setSelectedUser("SERVICE_PROVIDER");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 4.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.w),
                          border: Border.all(
                            width: 0.2.w,
                            color: notifier.selectedUser == "SERVICE_PROVIDER"
                                ? AppPallet.textColor
                                : AppPallet.lightBorderColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            // WebsafeSvg.asset(healthServiceVector, width: 9.w),
                            // Padding(padding: EdgeInsets.only(right: 4.w)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "I am a service provider",
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 1.h)),
                                  Text(
                                    "I provide services like carpentry",
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 4.w,
                              height: 4.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color:
                                    notifier.selectedUser == "SERVICE_PROVIDER"
                                        ? AppPallet.textColor
                                        : AppPallet.whiteBackground,
                                borderRadius: BorderRadius.circular(4.w),
                                border: Border.all(
                                  width: 0.2.w,
                                  color: notifier.selectedUser ==
                                          "SERVICE_PROVIDER"
                                      ? AppPallet.textColor
                                      : AppPallet.lightBorderColor,
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 9.sp,
                                color: AppPallet.whiteTextColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 3.h)),
                    GestureDetector(
                      onTap: () {
                        UserRole = 'USER';
                        print('User Role ${UserRole}');
                        // notifier.setSelectedUser("USER");
                        Get.to(() => UserSignupScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 4.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.w),
                          border: Border.all(
                            width: 0.2.w,
                            color: notifier.selectedUser == "USER"
                                ? AppPallet.textColor
                                : AppPallet.lightBorderColor,
                          ),
                        ),
                        child: Row(
                          children: [
                            // Image.asset(
                            //   healthProviderImg,
                            //   width: 8.w,
                            // ),
                            // Padding(padding: EdgeInsets.only(right: 4.w)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "I am a service user",
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 1.h)),
                                  Text(
                                    "I am in search of services",
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 4.w,
                              height: 4.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: notifier.selectedUser == "USER"
                                    ? AppPallet.textColor
                                    : AppPallet.whiteBackground,
                                borderRadius: BorderRadius.circular(4.w),
                                border: Border.all(
                                  width: 0.2.w,
                                  color: notifier.selectedUser == "USER"
                                      ? AppPallet.textColor
                                      : AppPallet.lightBorderColor,
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 9.sp,
                                color: AppPallet.whiteTextColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => UserSignIn());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have an account already?',
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 2.w)),
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 2.h)),
            ],
          ),
        ),
      ),
    );
  }
}
