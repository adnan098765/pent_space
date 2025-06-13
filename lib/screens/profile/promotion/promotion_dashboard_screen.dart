// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/crowd_funding/crowd_funding_widget.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:pent_space/screens/profile/promotion/promotion_chart.dart';
import 'package:pent_space/screens/settings/settings_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PromotionDashboardScreen extends ConsumerWidget {
  const PromotionDashboardScreen({Key? key}) : super(key: key);

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
                  Padding(padding: EdgeInsets.only(top: 1.5.h)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          notifier.setCurrentTab('crowdFunding');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.8.w,
                            vertical: 2.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5.w,
                                color: notifier.currentTab == "crowdFunding"
                                    ? AppPallet.whiteBackground
                                    : AppPallet.transparent,
                              ),
                            ),
                          ),
                          child: Text(
                            'Crowdfunding',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      GestureDetector(
                        onTap: () {
                          notifier.setCurrentTab('promote');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.8.w,
                            vertical: 2.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 0.5.w,
                                color: notifier.currentTab == "promote"
                                    ? AppPallet.whiteBackground
                                    : AppPallet.transparent,
                              ),
                            ),
                          ),
                          child: Text(
                            'Promote',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  if (notifier.currentTab == "crowdFunding")
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
                    )
                  else
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.w,
                              height: 23.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF424955),
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 2.w)),
                                  Text(
                                    'Action',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 40.w,
                              height: 23.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF424955),
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cost Per Action',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 1.w)),
                                      WebsafeSvg.asset(
                                        promoteDownStatsVector,
                                        height: 5.w,
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 2.w)),
                                  Text(
                                    '₦ 632.34',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.w)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40.w,
                              height: 23.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF424955),
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cost Per Click',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 1.w)),
                                      WebsafeSvg.asset(
                                        promoteUpStatsVector,
                                        height: 5.w,
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 2.w)),
                                  Text(
                                    '₦ 14,852.50',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 40.w,
                              height: 23.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFF424955),
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cost Per Click',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 1.w)),
                                      WebsafeSvg.asset(
                                        promoteDownStatsVector,
                                        height: 5.w,
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 2.w)),
                                  Text(
                                    '₦ 122.03',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 1.h)),
          const ProfileMenuBody(),
        ],
      ),
    );
  }
}

class ProfileMenuBody extends ConsumerWidget {
  const ProfileMenuBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileMenuChangeProvider);
    if (notifier.currentTab == "crowdFunding") {
      return Expanded(
        child: Column(
          children: [
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.4.w),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.1.w,
                    color: AppPallet.lightBorderColor,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
                children: [
                  ...[1, 2, 3, 4, 5, 6, 7].map(
                    (item) {
                      return const CrowdFundingWidget();
                    },
                  ).toList(),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 1.h)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                children: [
                  Container(
                    height: 25.h,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: AppPallet.whiteBackground,
                      borderRadius: BorderRadius.circular(2.w),
                      boxShadow: [
                        BoxShadow(
                          color: AppPallet.lightTextColor,
                          offset: Offset(0, 0.3.w),
                          blurRadius: 1.2.w,
                          spreadRadius: -1.w,
                        ),
                        BoxShadow(
                          color: AppPallet.lightTextColor,
                          offset: Offset(0, 1.w),
                          blurRadius: 2.w,
                          spreadRadius: -3.w,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                        Text(
                          'Daily Expenses',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 10.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.6.h)),
                        Row(
                          children: [
                            Text(
                              'Last 7 days',
                              style: TextStyle(
                                color: const Color(0xFF7381A5),
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 0.4.w)),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: const Color(0xFF7381A5),
                              size: 13.sp,
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                        const Expanded(child: PromotionChart()),
                      ],
                    ),
                  ),
                  ...[1, 2, 3, 4].map((item) {
                    return const PromotionWidget();
                  }).toList(),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      decoration: BoxDecoration(
        color: AppPallet.whiteBackground,
        borderRadius: BorderRadius.circular(2.w),
        boxShadow: [
          BoxShadow(
            color: AppPallet.lightTextColor,
            offset: Offset(0, 0.3.w),
            blurRadius: 1.2.w,
            spreadRadius: -1.w,
          ),
          BoxShadow(
            color: AppPallet.lightTextColor,
            offset: Offset(0, 0.1.w),
            blurRadius: 2.w,
            spreadRadius: -2.w,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.8.w),
            child: Text(
              'Action',
              style: TextStyle(
                color: AppPallet.textColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(
            height: 0.1.w,
            color: const Color(0xFF7c7c7c),
          ),
          Padding(padding: EdgeInsets.only(top: 1.h)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.8.w),
            child: Text(
              'Kidney and the heart is sick but the eyes can see clearly.',
              style: TextStyle(
                color: AppPallet.textColor,
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 1.h)),
          Container(
            height: 20.h,
            decoration: BoxDecoration(
              color: AppPallet.lightGreyColor,
              image: const DecorationImage(
                image: NetworkImage(
                    'https://images.theconversation.com/files/218472/original/file-20180510-34038-y5mmtc.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=675.0&fit=crop'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 1.h,
              horizontal: 4.w,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: AppPallet.lightRedTextColor,
                  size: 14.sp,
                ),
                Padding(padding: EdgeInsets.only(right: 1.w)),
                Text(
                  '2k',
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 4.w)),
                WebsafeSvg.asset(
                  messageIconVector,
                  width: 3.8.w,
                  color: AppPallet.textColor,
                ),
                Padding(padding: EdgeInsets.only(right: 1.w)),
                Text(
                  '33',
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.campaign_outlined,
                  color: AppPallet.blackTextColor,
                  size: 18.sp,
                ),
                Padding(padding: EdgeInsets.only(right: 2.w)),
                Icon(
                  Icons.share_outlined,
                  color: AppPallet.blackTextColor,
                  size: 16.sp,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
