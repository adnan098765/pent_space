import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/workout/select_age_screen.dart';
import 'package:pent_space/screens/health/workout/workout_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SelectLevelScreen extends ConsumerWidget {
  const SelectLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(workoutChangeProvider);
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                  child: Row(
                    children: [
                      Container(
                        width: 4.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                          color: AppPallet.textColor,
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 0.4.w,
                          color: AppPallet.textColor,
                        ),
                      ),
                      Container(
                        width: 4.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                          color: AppPallet.whiteBackground,
                          border: Border.all(
                            width: 0.4.w,
                            color: AppPallet.textColor,
                          ),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 0.4.w,
                          color: AppPallet.textColor,
                        ),
                      ),
                      Container(
                        width: 4.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                          color: AppPallet.whiteBackground,
                          border: Border.all(
                            width: 0.4.w,
                            color: AppPallet.textColor,
                          ),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
                Text(
                  'Select your Level',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
                GestureDetector(
                  onTap: () {
                    notifier.setUserLevel("1");
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
                        Padding(padding: EdgeInsets.only(right: 4.w)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lazy Bone",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Text(
                                "I am just starting up my exercises ",
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
                            color: notifier.userLevel == "1"
                                ? AppPallet.textColor
                                : AppPallet.whiteBackground,
                            borderRadius: BorderRadius.circular(4.w),
                            border: Border.all(
                              width: 0.2.w,
                              color: notifier.userLevel == "1"
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
                Padding(padding: EdgeInsets.only(top: 4.h)),
                GestureDetector(
                  onTap: () {
                    notifier.setUserLevel("2");
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
                        Padding(padding: EdgeInsets.only(right: 4.w)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mid- Level",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Text(
                                "I have not been consistent with exercising  ",
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
                            color: notifier.userLevel == "2"
                                ? AppPallet.textColor
                                : AppPallet.whiteBackground,
                            borderRadius: BorderRadius.circular(4.w),
                            border: Border.all(
                              width: 0.2.w,
                              color: notifier.userLevel == "2"
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
                Padding(padding: EdgeInsets.only(top: 4.h)),
                GestureDetector(
                  onTap: () {
                    notifier.setUserLevel("3");
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
                        Padding(padding: EdgeInsets.only(right: 4.w)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gym Rat",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Text(
                                "I hit the gym on a daily basis",
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
                            color: notifier.userLevel == "3"
                                ? AppPallet.textColor
                                : AppPallet.whiteBackground,
                            borderRadius: BorderRadius.circular(4.w),
                            border: Border.all(
                              width: 0.2.w,
                              color: notifier.userLevel == "3"
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
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              AppUtils.go(const SelectAgeScreen());
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
                'SELECT',
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
