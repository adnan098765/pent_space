import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/notifiers/app_notifier.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/screens/auth/signup/signup_notifier.dart';
import 'package:sizer/sizer.dart';

class VerifyEmailScreen extends ConsumerWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupChangeProvider);
    String dropdownValue = 'Nigeria';
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
                        "OTP Code",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(
                      "Please enter the one-time passcode sent \n to email: ${AppState.email}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 11.sp,
                        height: 0.17.h,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Center(
                      child: SizedBox(
                        width: 70.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 1; i <= 6; i++)
                              InputBox(
                                currentBox: i,
                                controller: getBoxController(i, notifier),
                                focusNode: getFocusNode(i, notifier),
                                switchBox: (value) {
                                  if (value.isNotEmpty && i < 7) {
                                    getFocusNode(i + 1, notifier)
                                        .requestFocus();
                                  } else if (value.isEmpty && i > 1) {
                                    getFocusNode(i - 1, notifier)
                                        .requestFocus();
                                  }
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    GestureDetector(
                      onTap: () {
                        // notifier.verifyOtp();
                      },
                      child: Center(
                        child: Container(
                          width: 70.w,
                          height: 5.5.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppPallet.textColor,
                            borderRadius: BorderRadius.circular(1.5.w),
                          ),
                          child: notifier.isVerifyingOtp
                              ? CupertinoActivityIndicator(
                                  color: AppPallet.whiteTextColor)
                              : Text(
                                  'Confirm',
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
                    GestureDetector(
                      onTap: () {
                        // notifier.resendOtp();
                      },
                      child: Center(
                        child: Container(
                          width: 70.w,
                          height: 5.5.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppPallet.whiteBackground,
                            borderRadius: BorderRadius.circular(1.5.w),
                          ),
                          child: Text(
                            'Resend',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextEditingController getBoxController(int index, SignupNotifier notifier) {
    switch (index) {
      case 1:
        return notifier.box1;
      case 2:
        return notifier.box2;
      case 3:
        return notifier.box3;
      case 4:
        return notifier.box4;
      case 5:
        return notifier.box5;
      case 6:
        return notifier.box6;
      // case 7:
      //   return notifier.box7;
      default:
        throw Exception('Invalid box index: $index');
    }
  }

  FocusNode getFocusNode(int index, SignupNotifier notifier) {
    switch (index) {
      case 1:
        return notifier.myFocusNode1;
      case 2:
        return notifier.myFocusNode2;
      case 3:
        return notifier.myFocusNode3;
      case 4:
        return notifier.myFocusNode4;
      case 5:
        return notifier.myFocusNode5;
      case 6:
        return notifier.myFocusNode6;
      // case 7:
      //   return notifier.myFocusNode7;
      default:
        throw Exception('Invalid box index: $index');
    }
  }
}

class InputBox extends StatelessWidget {
  final currentBox;
  final bool enabled;
  final focusNode;
  final TextEditingController? controller;
  final Function? switchBox;
  const InputBox({
    Key? key,
    this.currentBox,
    this.enabled = true,
    this.focusNode,
    this.controller,
    this.switchBox,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.w,
      height: 10.w,
      decoration: BoxDecoration(
          border: Border.all(color: AppPallet.lightTextColor, width: 0.2.w),
          borderRadius: BorderRadius.circular(2.w)),
      padding: EdgeInsets.symmetric(horizontal: 0.w),
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        autofocus: true,
        enabled: enabled,
        focusNode: focusNode,
        onChanged: (value) => switchBox!(value),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w800,
          color: AppPallet.textColor,
        ),
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(vertical: 0.w),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
