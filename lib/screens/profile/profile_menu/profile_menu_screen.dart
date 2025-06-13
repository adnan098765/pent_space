import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/crowd_funding/crowd_funding_widget.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:pent_space/screens/profile/promotion/promotion_screen.dart.dart';
import 'package:pent_space/screens/profile/transactions/transactions_screen.dart';
import 'package:pent_space/screens/settings/settings_screen.dart';
import 'package:sizer/sizer.dart';

class ProfileMenuScreen extends ConsumerWidget {
  const ProfileMenuScreen({Key? key}) : super(key: key);

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
                    width: 80.w,
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
                          onTap: () {
                            AppUtils.go(const TransactionScreen());
                          },
                          child: Container(
                            height: 4.h,
                            padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppPallet.whiteBackground,
                              borderRadius: BorderRadius.circular(2.h),
                            ),
                            child: Text(
                              'Manage',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  AppUtils.go(const PromotionScreen());
                },
                child: Container(
                  width: 54.w,
                  height: 6.h,
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppPallet.textColor,
                    borderRadius: BorderRadius.circular(1.w),
                    boxShadow: [
                      BoxShadow(
                        color: AppPallet.greyTextColor,
                        offset: Offset(0, 1.w),
                        blurRadius: 4.w,
                        spreadRadius: -2.w,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: AppPallet.whiteTextColor,
                        size: 18.sp,
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      Text(
                        'Start Promotion',
                        style: TextStyle(
                          color: AppPallet.whiteTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
