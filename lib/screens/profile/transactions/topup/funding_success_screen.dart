import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:pent_space/screens/settings/settings_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class FundingSuccessScreen extends ConsumerWidget {
  const FundingSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileMenuChangeProvider);
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppPallet.textColor,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 4.8.w),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppPallet.whiteTextColor,
                          size: 14.sp,
                        ),
                      ),
                      Text(
                        'Binary Pharmaceuticals',
                        style: TextStyle(
                          color: AppPallet.whiteTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppUtils.go(const SettingsScreen());
                        },
                        child: Icon(
                          Icons.settings,
                          color: AppPallet.whiteTextColor,
                          size: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.h)),
                  Container(
                    width: 55.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF424955),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '₦ 752,000',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        GestureDetector(
                          child: Text(
                            'Hide',
                            style: TextStyle(
                              color: const Color(0xFFF19733),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
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
          Padding(padding: EdgeInsets.only(top: 1.h)),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
              children: [
                Center(
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 24.sp,
                    color: AppPallet.textColor,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
                WebsafeSvg.asset(checkMarkVector, height: 16.h),
                Padding(padding: EdgeInsets.only(top: 7.h)),
                Center(
                  child: Text(
                    'FUNDS ADDED',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.h)),
                Center(
                  child: Text(
                    'TRANSACTION ID 743GHDSD8',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: GestureDetector(
              onTap: () {
                AppUtils.goBack();
              },
              child: SafeArea(
                top: false,
                child: Container(
                  height: 5.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppPallet.textColor,
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                  child: Text(
                    "OKAY",
                    style: TextStyle(
                      color: AppPallet.whiteTextColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
        ],
      ),
    );
  }
}
