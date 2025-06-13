// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/crowd_funding/crowd_funding_widget.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:pent_space/screens/profile/promotion/promotion_dashboard_screen.dart';
import 'package:pent_space/screens/profile/promotion/select_audience.dart';
import 'package:pent_space/screens/profile/transactions/transactions_screen.dart';
import 'package:pent_space/screens/settings/settings_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PromotionPaymentMethod extends ConsumerWidget {
  const PromotionPaymentMethod({Key? key}) : super(key: key);

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
                              color: Color(0xFFF19733),
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
                children: [1, 2, 3, 4, 5, 6, 7].map(
                  (item) {
                    return const CrowdFundingWidget();
                  },
                ).toList(),
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
                  Center(
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 1.h)),
                  Center(
                    child: Text(
                      'Choose your billing method',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 6.h)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.4.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppPallet.whiteBackground,
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Use Balance',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 1.h)),
                                  RichText(
                                    text: TextSpan(
                                        text: '752,000',
                                        style: TextStyle(
                                          color: AppPallet.redTextColor,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'NGN',
                                            style: TextStyle(
                                              color: AppPallet.redTextColor,
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                notifier.setPaymentMethod('balance');
                              },
                              child: Container(
                                width: 3.5.w,
                                height: 3.5.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: notifier.paymentMethod == "balance"
                                      ? AppPallet.lightBorderColor
                                      : AppPallet.transparent,
                                  borderRadius: BorderRadius.circular(0.5.w),
                                  border: Border.all(
                                    width: 0.2.w,
                                    color: AppPallet.textColor,
                                  ),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 8.sp,
                                  color: notifier.paymentMethod == "balance"
                                      ? AppPallet.textColor
                                      : AppPallet.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Divider(
                          thickness: 0.1.w,
                          color: AppPallet.lightBorderColor,
                        ),
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                        Text(
                          'PREVIOUS CARD',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.5.h)),
                        Row(
                          children: [
                            WebsafeSvg.asset(
                              profileCardVector,
                              width: 6.w,
                              color: AppPallet.textColor,
                            ),
                            Padding(padding: EdgeInsets.only(right: 2.w)),
                            ...[1, 2, 3, 4].map((e) {
                              return Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: AppPallet.textColor,
                                    size: 4.sp,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(right: 0.4.w)),
                                ],
                              );
                            }).toList(),
                            Padding(padding: EdgeInsets.only(right: 1.5.w)),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    '7355',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 8.w)),
                                  Text(
                                    '12/23',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                notifier.setPaymentMethod('current_card');
                              },
                              child: Container(
                                width: 3.5.w,
                                height: 3.5.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      notifier.paymentMethod == "current_card"
                                          ? AppPallet.lightBorderColor
                                          : AppPallet.transparent,
                                  borderRadius: BorderRadius.circular(0.5.w),
                                  border: Border.all(
                                    width: 0.2.w,
                                    color: AppPallet.textColor,
                                  ),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 8.sp,
                                  color:
                                      notifier.paymentMethod == "current_card"
                                          ? AppPallet.textColor
                                          : AppPallet.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Divider(
                          thickness: 0.1.w,
                          color: AppPallet.lightBorderColor,
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DEBIT CARD',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 1.h)),
                                  Text(
                                    'Pay using Mastercard, Visa or Verve card',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                notifier.setPaymentMethod('debit_card');
                              },
                              child: Container(
                                width: 3.5.w,
                                height: 3.5.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: notifier.paymentMethod == "debit_card"
                                      ? AppPallet.lightBorderColor
                                      : AppPallet.transparent,
                                  borderRadius: BorderRadius.circular(0.5.w),
                                  border: Border.all(
                                    width: 0.2.w,
                                    color: AppPallet.textColor,
                                  ),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 8.sp,
                                  color: notifier.paymentMethod == "debit_card"
                                      ? AppPallet.textColor
                                      : AppPallet.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.h)),
                ],
              ),
            ),
            Divider(color: AppPallet.lightTextColor, height: 0.1.w),
            Padding(padding: EdgeInsets.only(top: 2.h)),
            GestureDetector(
              onTap: () {
                AppUtils.go(const PromotionDashboardScreen());
              },
              child: Center(
                child: SafeArea(
                  top: false,
                  child: Container(
                    width: 28.w,
                    height: 5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppPallet.textColor,
                      borderRadius: BorderRadius.circular(1.w),
                      boxShadow: [
                        BoxShadow(
                          color: AppPallet.greyTextColor,
                          offset: const Offset(0, 0),
                          blurRadius: 2.w,
                          spreadRadius: -0.5.w,
                        )
                      ],
                    ),
                    child: Text(
                      'PROMOTE',
                      style: TextStyle(
                        color: AppPallet.whiteTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
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
}
