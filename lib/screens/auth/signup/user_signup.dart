// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/widgets/input_widget.dart';
import 'package:pent_space/widgets/loader.dart';
import 'package:sizer/sizer.dart';
import '../../../view_models/controller/signupcontroller/signup_view_model.dart';
import '../signin/user_signin_screen.dart';

class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({Key? key}) : super(key: key);

  @override
  State<UserSignupScreen> createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {
  final signupVm = Get.put(SignUpViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 2.h)),
              GestureDetector(
                onTap: () {
                  NavigationService.instance.goback();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 19.sp,
                    color: AppPallet.textColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(
                      "Please enter your information below in order to create your account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 11.sp,
                        height: 0.17.h,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputWidget(
                            controller: signupVm.emailController.value,
                            icon: Icon(
                              Icons.email_outlined,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Email Address',
                            hint: 'Johnsmith@gmail.com',
                            //controller: notifier.emailAddressController,
                          ),
                          InputWidget(
                            controller: signupVm.passwordController.value,
                            obscure: true,
                            icon: Icon(
                              Icons.lock_outline,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Password',
                            hint: 'Enter password',
                            //controller: notifier.passwordController,
                            // obscure: !notifier.showPassword,
                            trailingIcon: InkWell(
                              onTap: () {
                                //notifier.toggleShowPassword();
                              },
                              child: Icon(
                                Icons.visibility_off_outlined,
                                color: AppPallet.lightTextColor,
                                size: 14.sp,
                              ),
                            ),
                          ),
                          InputWidget(
                            controller:
                                signupVm.confirmpasswordController.value,
                            obscure: true,
                            icon: Icon(
                              Icons.lock_outline,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Confirm Password',
                            hint: 'Confirm password',
                            //obscure: !notifier.showConfirmPassword,
                            //controller: notifier.confirmPasswordController,
                            trailingIcon: InkWell(
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
                                signupVm.validations();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 5.5.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppPallet.textColor,
                                  borderRadius: BorderRadius.circular(1.5.w),
                                ),
                                child: signupVm.loading.value
                                    ? Loader()
                                    : Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2.h)),
                          GestureDetector(
                            onTap: () {
                              // AppUtils.go(const SigninScreen());
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
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
