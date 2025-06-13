import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/view_models/controller/forgetpassword/forget_pass_view_model.dart';
import 'package:pent_space/widgets/input_widget.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                        "Change Password",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(
                      "Please enter a new password in order to reset your account.",
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
                          Padding(padding: EdgeInsets.only(top: 2.h)),
                          InputWidget(
                            controller:
                                forgetpasswordVM.passwordController.value,
                            icon: Icon(
                              Icons.lock_outline,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Password',
                            hint: 'Enter password',
                            obscure: true,
                            trailingIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: AppPallet.lightTextColor,
                              size: 14.sp,
                            ),
                          ),
                          InputWidget(
                            icon: Icon(
                              Icons.lock_outline,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Confirm Password',
                            hint: 'Confirm password',
                            obscure: true,
                            trailingIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: AppPallet.lightTextColor,
                              size: 14.sp,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 4.h)),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                // _notifier.verifyOtpResetPassword();

                                forgetpasswordVM.ResetPasswordd();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 5.5.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppPallet.textColor,
                                  borderRadius: BorderRadius.circular(1.5.w),
                                ),
                                child: forgetpasswordVM.loading.value
                                    ? CupertinoActivityIndicator(
                                        color: AppPallet.whiteTextColor,
                                      )
                                    : Text(
                                        'Update Password',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ),
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
