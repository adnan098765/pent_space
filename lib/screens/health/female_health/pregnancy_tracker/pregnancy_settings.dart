import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/pregnancy_tracker_screen.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/pregnancy_tracker_notifier.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/select_last_period_first_day_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PregnancySettings extends ConsumerWidget {
  const PregnancySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(pregnancyTraskerChangeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 100.w,
                    color: AppPallet.textColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
                    child: SafeArea(
                      bottom: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              AppUtils.goBack();
                            },
                            child: WebsafeSvg.asset(healthMenuBackIcon,
                                width: 16.sp),
                          ),
                          Padding(padding: EdgeInsets.only(top: 8.h))
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    margin: EdgeInsets.only(top: 11.h),
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.8.w, vertical: 2.h),
                      children: [
                        Text(
                          'Pregnancy Settings',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppPallet.whiteTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppPallet.whiteBackground,
                            borderRadius: BorderRadius.circular(3.w),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1.h),
                                color: const Color(0xFFcccccc),
                                blurRadius: 1.w,
                                spreadRadius: -2.w,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Due Date',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  notifier.selectDate(context);
                                },
                                child: Container(
                                  height: 5.5.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.8.w),
                                  margin: EdgeInsets.only(top: 1.h),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFCBCED6),
                                    borderRadius: BorderRadius.circular(6.h),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        notifier.hasSelectedDate
                                            ? notifier.selectedDate
                                            : 'Select',
                                        style: TextStyle(
                                          color: notifier.hasSelectedDate
                                              ? AppPallet.textColor
                                              : AppPallet.whiteTextColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        size: 16.sp,
                                        color: AppPallet.whiteTextColor,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 4.h)),
                              InkWell(
                                onTap: () {
                                  AppUtils.go(
                                      const SelectLastPeriodFirstDayScreen());
                                },
                                child: Text(
                                  "I don't know my due date",
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 4.h)),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              if (notifier.hasSelectedDate) {
                                AppUtils.go(const PregnancyTrackerScreen());
                              }
                            },
                            child: Container(
                              width: 80.w,
                              height: 5.5.h,
                              decoration: BoxDecoration(
                                color: notifier.hasSelectedDate
                                    ? AppPallet.textColor
                                    : const Color(0xFF7381A5),
                                borderRadius: BorderRadius.circular(2.w),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'START',
                                style: TextStyle(
                                  color: AppPallet.whiteTextColor,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 1.h),
              child: Text(
                'The psychological information you provide will Be used for pregnancy record and analysis',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
