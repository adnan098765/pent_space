// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/settings/settings_notifier.dart';
import 'package:sizer/sizer.dart';

class DeleteAccountScreen extends ConsumerWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(settingsChangeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Column(
        children: [
          Container(
            color: AppPallet.textColor,
            padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
            child: SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppUtils.goBack();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppPallet.whiteTextColor,
                      size: 13.sp,
                    ),
                  ),
                  Text(
                    'Delete Account',
                    style: TextStyle(
                      color: AppPallet.whiteTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  )
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 7.h),
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 2.h)),
                Text(
                  'Account deactivation means to delete your account: \n\nYou will not be able to log in to your profile anymore and all your account history will be deleted without the possibility to restore',
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    height: 0.16.h,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
                Padding(padding: EdgeInsets.only(top: 4.h)),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      AppUtils.goToCustomRoute(const DeleteAccountPrompt());
                    },
                    child: Container(
                      height: 5.h,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppPallet.redTextColor,
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Text(
                        'Yes Delete',
                        style: TextStyle(
                          color: AppPallet.whiteTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
        ],
      ),
    );
  }
}

class DeleteAccountPrompt extends StatelessWidget {
  const DeleteAccountPrompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x66222222),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 75.w,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppPallet.whiteBackground,
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Column(
                children: [
                  Text(
                    'CONFIRM DELETE',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 11.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppUtils.goBack();
                        },
                        child: Container(
                            height: 4.5.h,
                            width: 25.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppPallet.textColor,
                              borderRadius: BorderRadius.circular(1.w),
                            ),
                            child: Text(
                              'CANCEL',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => const SigninScreen()),
                          //   (route) => false,
                          // );
                        },
                        child: Container(
                          height: 4.5.h,
                          width: 25.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppPallet.redTextColor,
                            borderRadius: BorderRadius.circular(1.w),
                          ),
                          child: Text(
                            'DELETE',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
