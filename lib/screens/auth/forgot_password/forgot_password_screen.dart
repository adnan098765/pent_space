// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/view_models/controller/forgetpassword/forget_pass_view_model.dart';
import 'package:sizer/sizer.dart';
import '../../../core/const/colors.dart';
import '../../../widgets/input_widget.dart';
import 'reset_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgetpasswordVM = Get.put(ForgetPasswordViewModel());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
          child: Column(
            children: [
              SizedBox(height: 2.h),
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      children: [
                        SizedBox(height: 2.h),
                        Center(
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Please enter your information below in order to reset your password.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppPallet.lightTextColor,
                            fontSize: 11.sp,
                            height: 0.17.h,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputWidget(
                              controller:
                                  forgetpasswordVM.emailController.value,
                              icon: Icon(
                                Icons.email_outlined,
                                color: AppPallet.textColor,
                                size: 15.sp,
                              ),
                              label: 'Email Address',
                              hint: 'Johnsmith@gmail.com',
                            ),
                            SizedBox(height: 4.h),
                            _buildResetButton(),
                            SizedBox(height: 2.h),
                            _buildCancelButton(),
                          ],
                        ),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: () {
        forgetpasswordVM.ForgetPassword();
      },
      child: Container(
        width: double.infinity,
        height: 5.5.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppPallet.textColor,
          borderRadius: BorderRadius.circular(1.5.w),
        ),
        child:
            //  _notifier.isResetingPassword
            //     ? CupertinoActivityIndicator(
            //         color: AppPallet.whiteBackground,
            //       )
            //     :
            Text(
          'Reset Password',
          style: TextStyle(
            color: AppPallet.whiteTextColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.goback();
      },
      child: Container(
        width: double.infinity,
        height: 5.5.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppPallet.whiteBackground,
          borderRadius: BorderRadius.circular(1.5.w),
        ),
        child: Text(
          'Cancel',
          style: TextStyle(
            color: AppPallet.textColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
