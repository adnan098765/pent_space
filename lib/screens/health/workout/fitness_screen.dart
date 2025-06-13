import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/health_manager_screen.dart';
import 'package:pent_space/screens/health/workout/workout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.textColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppPallet.textColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.8.w),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HealthManagerScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child:
                            WebsafeSvg.asset(healthMenuBackIcon, width: 16.sp),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.settings_input_composite_outlined,
                          color: AppPallet.whiteTextColor,
                          size: 16.sp,
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Text(
                    'Daily Fitness',
                    style: TextStyle(
                      color: AppPallet.whiteTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.h)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Full Body',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.05.h)),
                            Text(
                              'Track',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          margin: EdgeInsets.symmetric(horizontal: 2.w),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppPallet.whiteTextColor,
                                width: 0.2.w,
                              ),
                              right: BorderSide(
                                color: AppPallet.whiteTextColor,
                                width: 0.2.w,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Lazy',
                                style: TextStyle(
                                  color: AppPallet.whiteTextColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 0.05.h)),
                              Text(
                                'Level',
                                style: TextStyle(
                                  color: AppPallet.whiteTextColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              '24',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.05.h)),
                            Text(
                              'Workouts',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 6.h,
            decoration: BoxDecoration(
              color: AppPallet.whiteBackground,
              border: Border(
                bottom: BorderSide(width: 0, color: AppPallet.whiteTextColor),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 100.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                      color: AppPallet.textColor,
                      border: Border.all(width: 0, color: AppPallet.textColor),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          AppUtils.go(const WorkoutScreen());
                        },
                        child: Container(
                          width: 80.w,
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFAF3F32),
                            borderRadius: BorderRadius.circular(3.w),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFcccccc),
                                offset: Offset(0, 1.5.w),
                                blurRadius: 1.w,
                                spreadRadius: -0.8.w,
                              )
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Start',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppPallet.whiteBackground,
              child: ListView(
                // physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
                children: [
                  ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map((item) {
                    return GestureDetector(
                      onTap: () {
                        AppUtils.go(const WorkoutScreen());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Row(
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAECF1),
                                borderRadius: BorderRadius.circular(3.w),
                                image: const DecorationImage(
                                  image: AssetImage(pushUpsImg),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 4.8.w)),
                            Expanded(
                                child: Container(
                              constraints: BoxConstraints(minHeight: 20.w),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: const Color(0xFF8798B5),
                                      width: 0.1.w),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Push-Ups',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 1.h)),
                                  Text(
                                    '30s',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 11.sp,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
