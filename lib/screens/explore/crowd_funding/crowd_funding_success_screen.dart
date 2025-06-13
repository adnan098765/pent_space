import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_success_screen.dart';
import 'package:pent_space/screens/home/home_screen.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CrowdFundingSuccessScreen extends ConsumerWidget {
  const CrowdFundingSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileMenuChangeProvider);
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: AppPallet.textColor,
            padding: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 4.8.w),
            child: SafeArea(
              bottom: false,
              child: Text(
                'Successful',
                style: TextStyle(
                  color: AppPallet.whiteTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 1.h)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppPallet.whiteBackground,
                      borderRadius: BorderRadius.circular(2.w),
                      boxShadow: [
                        BoxShadow(
                          color: AppPallet.inputBorderColor,
                          offset: const Offset(0, 0),
                          blurRadius: 6.w,
                          spreadRadius: 0.w,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 3.h)),
                        WebsafeSvg.asset(
                          crowdFundingDonateVector,
                          width: 20.w,
                          color: AppPallet.textColor,
                        ),
                        Padding(padding: EdgeInsets.only(top: 4.h)),
                        Text(
                          'Thank you for\ndonating',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.h)),
                        GestureDetector(
                          onTap: () {
                            AppUtils.goBack();
                            AppUtils.goBack();
                            AppUtils.goBack();
                          },
                          child: Center(
                            child: SafeArea(
                              top: false,
                              child: Container(
                                height: 5.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppPallet.buttonColor,
                                  borderRadius: BorderRadius.circular(1.w),
                                ),
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    color: AppPallet.whiteTextColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15.h)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
