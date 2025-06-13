// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/crowd_funding/crowd_funding_widget.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:pent_space/screens/profile/promotion/promotion_payment_method.dart';
import 'package:pent_space/screens/profile/transactions/transactions_screen.dart';
import 'package:pent_space/screens/settings/settings_screen.dart';
import 'package:sizer/sizer.dart';

class PromotionBudget extends ConsumerWidget {
  const PromotionBudget({Key? key}) : super(key: key);

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
      String dropdownValue = '₦7000 Nigerian Naira';
      RangeValues _currentRangeValues = const RangeValues(20, 55);
      return Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          children: [
            Center(
              child: Text(
                'Budget and Duration',
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 1.h)),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  'Choose when this ads will end',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 0.08.w,
                    color: AppPallet.lightTextColor,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Daily Budget',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 2.w)),
                  Icon(
                    Icons.info,
                    size: 12.sp,
                    color: const Color(0xFF5F6164),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 1.h)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(right: 2.w)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9.w),
                  child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.8.w,
                      ),
                      height: 4.5.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.1.w,
                          color: AppPallet.textColor,
                        ),
                        borderRadius: BorderRadius.circular(1.w),
                      ),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: AppPallet.textColor,
                          size: 24.sp,
                        ),
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          '₦7000 Nigerian Naira',
                          'Nigeria',
                          'Ghana',
                          'South Africa'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
                ),
                Padding(padding: EdgeInsets.only(top: 1.h)),
                Container(
                  padding: EdgeInsets.only(left: 9.w, right: 9.w, bottom: 3.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.08.w,
                        color: AppPallet.lightTextColor,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info,
                        size: 11.sp,
                        color: const Color(0xFF5F6164),
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      Text(
                        'Actual amount spent daily may vary\nEstimated 4 - 24 likes per day',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.h)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    children: [
                      Text(
                        'Duration',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      Icon(
                        Icons.info,
                        size: 12.sp,
                        color: const Color(0xFF5F6164),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.h)),
                Container(
                  margin: EdgeInsets.only(left: 9.w, right: 9.w, top: 1.h),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.4.w,
                        color: const Color(0xFF707070),
                      ),
                      borderRadius: BorderRadius.circular(1.w)),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            notifier.setDuration('7');
                          },
                          child: Container(
                            height: 4.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: notifier.duration == '7'
                                  ? const Color(0xFF707070)
                                  : AppPallet.transparent,
                            ),
                            child: Text(
                              '7 days',
                              style: TextStyle(
                                color: notifier.duration == '7'
                                    ? AppPallet.whiteTextColor
                                    : AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            notifier.setDuration('14');
                          },
                          child: Container(
                            height: 4.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: notifier.duration == '14'
                                  ? const Color(0xFF707070)
                                  : AppPallet.transparent,
                              border: Border(
                                left: BorderSide(
                                  color: const Color(0xFF707070),
                                  width: 0.4.w,
                                ),
                                right: BorderSide(
                                  color: const Color(0xFF707070),
                                  width: 0.4.w,
                                ),
                              ),
                            ),
                            child: Text(
                              '14 days',
                              style: TextStyle(
                                color: notifier.duration == '14'
                                    ? AppPallet.whiteTextColor
                                    : AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            notifier.setDuration('28');
                          },
                          child: Container(
                            height: 4.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: notifier.duration == '28'
                                  ? const Color(0xFF707070)
                                  : AppPallet.transparent,
                            ),
                            child: Text(
                              '28 days',
                              style: TextStyle(
                                color: notifier.duration == '28'
                                    ? AppPallet.whiteTextColor
                                    : AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 9.w, right: 9.w, bottom: 3.h, top: 2.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.08.w,
                        color: AppPallet.lightTextColor,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Run this ad until',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.w, vertical: 0.4.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppPallet.lightTextColor,
                            width: 0.2.w,
                          ),
                          borderRadius: BorderRadius.circular(0.4.w),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: AppPallet.textColor,
                              size: 10.sp,
                            ),
                            Padding(padding: EdgeInsets.only(right: 1.w)),
                            Text(
                              'April 6, 2022',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
                Center(
                  child: Container(
                    width: 80.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAD3CF),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Text(
                      'You will spend a total of ₦15,000. This ad will run for 14days, ending on Jun 15, 2022',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
                Divider(
                  height: 0.2.w,
                  color: AppPallet.lightTextColor,
                ),
                Padding(padding: EdgeInsets.only(top: 6.h)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: GestureDetector(
                    onTap: () {
                      AppUtils.go(const PromotionPaymentMethod());
                    },
                    child: Center(
                      child: Container(
                        width: 28.w,
                        height: 5.h,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'NEXT',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 2.w)),
                            Icon(
                              Icons.chevron_right,
                              size: 17.sp,
                              color: AppPallet.whiteTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }
}
