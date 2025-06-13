import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/female_health_notifier.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/pregnancy_settings.dart';
import 'package:pent_space/screens/health/female_health/period_tracker/select_last_period.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SelectGoalScreen extends ConsumerWidget {
  const SelectGoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(femaleHealthChangeProvider);
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Column(
        children: [
          Container(
            width: 100.w,
            color: AppPallet.textColor,
            padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
            alignment: Alignment.centerLeft,
            child: SafeArea(
              bottom: false,
              child: GestureDetector(
                onTap: () {
                  AppUtils.goBack();
                },
                child: WebsafeSvg.asset(healthMenuBackIcon, width: 16.sp),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
              children: [
                Padding(padding: EdgeInsets.only(top: 4.h)),
                Text(
                  'What is your goal…',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 6.h)),
                GestureDetector(
                  onTap: () {
                    notifier.setUserGoal("1");
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.w),
                      border: Border.all(
                        width: 0.3.w,
                        color: AppPallet.textColor,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(trackPeriodImg),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 4.w)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Track your Period",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Text(
                                "Track and predict your periods",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 4.w,
                          height: 4.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: notifier.userGoal == "1"
                                ? AppPallet.textColor
                                : AppPallet.whiteBackground,
                            borderRadius: BorderRadius.circular(4.w),
                            border: Border.all(
                              width: 0.2.w,
                              color: notifier.userGoal == "1"
                                  ? AppPallet.textColor
                                  : AppPallet.lightBorderColor,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 9.sp,
                            color: AppPallet.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 6.h)),
                GestureDetector(
                  onTap: () {
                    notifier.setUserGoal("2");
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.w),
                      border: Border.all(
                        width: 0.3.w,
                        color: AppPallet.textColor,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(trackPregnancyImg),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 4.w)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Track Pregnancy",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Text(
                                "I want to track my pregnancy progress",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 4.w,
                          height: 4.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: notifier.userGoal == "2"
                                ? AppPallet.textColor
                                : AppPallet.whiteBackground,
                            borderRadius: BorderRadius.circular(4.w),
                            border: Border.all(
                              width: 0.2.w,
                              color: notifier.userGoal == "2"
                                  ? AppPallet.textColor
                                  : AppPallet.lightBorderColor,
                            ),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 9.sp,
                            color: AppPallet.whiteTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (notifier.userGoal == "1") {
                AppUtils.go(const SelectLastPeriod());
              } else {
                AppUtils.go(const PregnancySettings());
              }
            },
            child: Container(
              width: 80.w,
              height: 5.5.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppPallet.textColor,
                borderRadius: BorderRadius.circular(1.5.w),
              ),
              child: Text(
                'OKAY',
                style: TextStyle(
                  color: AppPallet.whiteTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
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
