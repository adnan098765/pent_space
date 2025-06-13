// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/auth/signup/signup_screen.dart';
import 'package:pent_space/view_models/controller/login/login_view_model.dart';
import 'package:pent_space/widgets/loader.dart';
import 'package:sizer/sizer.dart';
import '../../../core/const/colors.dart';
import '../../../widgets/input_widget.dart';
import '../forgot_password/forgot_password_screen.dart';

class UserSignIn extends StatefulWidget {
  const UserSignIn({Key? key}) : super(key: key);

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final loginupVm = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 6.h)),
                    Center(
                      child: Text(
                        "Sign In Now",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(
                      "Please enter your information below in order to login to your account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 11.sp,
                        height: 0.17.h,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        children: [
                          InputWidget(
                            controller: loginupVm.emailController.value,
                            icon: Icon(
                              Icons.email_outlined,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Email Address',
                            hint: 'Johnsmith@gmail.com',
                          ),
                          Padding(padding: EdgeInsets.only(top: 1.h)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: AppPallet.lightTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => ForgotPasswordScreen());
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 0.8.h)),
                          InputWidget(
                            controller: loginupVm.passwordController.value,
                            icon: Icon(
                              Icons.lock_outline,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            hint: 'Enter password',
                            trailingIcon: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.visibility_off_outlined,
                                color: AppPallet.lightTextColor,
                                size: 14.sp,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 4.h)),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                // AppUtils.go(const HomeScreen());
                                loginupVm.Login();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 5.5.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppPallet.textColor,
                                  borderRadius: BorderRadius.circular(1.5.w),
                                ),
                                child: loginupVm.loading.value
                                    ? Loader()
                                    : Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2.h)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // AppUtils.go(const SignupScreen());
                  Get.to(() => SignupScreen());
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
                      'Create Now',
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
