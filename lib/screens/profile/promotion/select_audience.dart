// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/crowd_funding/crowd_funding_widget.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:pent_space/screens/profile/promotion/promotion_budget.dart';
import 'package:pent_space/screens/profile/transactions/transactions_screen.dart';
import 'package:pent_space/screens/settings/settings_screen.dart';
import 'package:sizer/sizer.dart';

class SelectAudience extends ConsumerWidget {
  const SelectAudience({Key? key}) : super(key: key);

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
      String dropdownValue = 'United States';
      RangeValues _currentRangeValues = const RangeValues(20, 55);
      return Expanded(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          children: [
            Center(
              child: Text(
                'Select Campaign Feeds',
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
                  'Set a radius around your location and choose your audience’s age range, gender and special interests',
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
            Padding(padding: EdgeInsets.only(top: 1.h)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.08.w,
                    color: AppPallet.lightTextColor,
                  ),
                ),
              ),
              child: Text(
                'Targeted',
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 1.h)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'People you choose through targeting.',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(right: 8.w)),
                      Text(
                        'Location:',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      StatefulBuilder(
                          builder: (BuildContext context, setState) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                          ),
                          height: 3.5.h,
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
                              Icons.keyboard_arrow_down,
                              color: AppPallet.lightTextColor,
                              size: 18.sp,
                            ),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 0,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'United States',
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
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 1.h)),
                  StatefulBuilder(builder: (context, setState) {
                    return SizedBox(
                      width: 89.w,
                      child: RangeSlider(
                        values: _currentRangeValues,
                        max: 65,
                        activeColor: AppPallet.secondaryColor,
                        inactiveColor: AppPallet.lightBorderColor,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      'Preferred Gender:',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: 40.w,
                    margin: EdgeInsets.only(left: 8.w, top: 1.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.4.w,
                        color: AppPallet.lightTextColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              notifier.setPreferedGender('male');
                            },
                            child: Container(
                              height: 4.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: notifier.preferedGender == 'male'
                                    ? AppPallet.lightTextColor
                                    : AppPallet.transparent,
                              ),
                              child: Text(
                                'Male',
                                style: TextStyle(
                                  color: notifier.preferedGender == 'male'
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
                              notifier.setPreferedGender('any');
                            },
                            child: Container(
                              height: 4.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: notifier.preferedGender == 'any'
                                    ? AppPallet.lightTextColor
                                    : AppPallet.transparent,
                                border: Border(
                                  left: BorderSide(
                                    color: AppPallet.lightTextColor,
                                    width: 0.4.w,
                                  ),
                                  right: BorderSide(
                                    color: AppPallet.lightTextColor,
                                    width: 0.4.w,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Any',
                                style: TextStyle(
                                  color: notifier.preferedGender == 'any'
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
                              notifier.setPreferedGender('female');
                            },
                            child: Container(
                              height: 4.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: notifier.preferedGender == 'female'
                                    ? AppPallet.lightTextColor
                                    : AppPallet.transparent,
                              ),
                              child: Text(
                                'Female',
                                style: TextStyle(
                                  color: notifier.preferedGender == 'female'
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
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Exclude:',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        const ExcludItem(title: 'People connected with me'),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        const ExcludItem(title: 'People who has messaged me'),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        const ExcludItem(
                            title: 'People who has not messaged me'),
                        Padding(padding: EdgeInsets.only(top: 4.h)),
                        GestureDetector(
                          onTap: () {
                            AppUtils.go(const PromotionBudget());
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

class ExcludItem extends ConsumerWidget {
  final String? title;
  const ExcludItem({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileMenuChangeProvider);
    return GestureDetector(
      onTap: () {
        notifier.setExcludedItem(title);
      },
      child: Row(
        children: [
          Container(
            width: 3.3.w,
            height: 3.3.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: notifier.excludedItem == title
                  ? AppPallet.borderColor
                  : AppPallet.transparent,
              border: Border.all(width: 0.3.w, color: AppPallet.textColor),
            ),
            child: Icon(
              Icons.check,
              color: notifier.excludedItem == title
                  ? AppPallet.textColor
                  : AppPallet.transparent,
              size: 8.sp,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 2.4.w)),
          Text(
            '$title',
            style: TextStyle(
              color: AppPallet.textColor,
              fontSize: 10.sp,
              fontWeight: notifier.excludedItem == title
                  ? FontWeight.w500
                  : FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
