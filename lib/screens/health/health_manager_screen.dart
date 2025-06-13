import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/calorie_burner/calorie_burner_screen.dart';
import 'package:pent_space/screens/health/female_health/select_goal_screen.dart';
import 'package:pent_space/screens/health/workout/select_level_screen.dart';
import 'package:pent_space/screens/home/home_screen.dart';
import 'package:pent_space/screens/home/widgets/notifications_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:pent_space/utils/helpers.dart';
class HealthManagerScreen extends StatelessWidget {
  const HealthManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppPallet.textColor,
              // border: Border.all(width: 0),
            ),
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.8.w),
            child: SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Icon(
                      Icons.home,
                      color: AppPallet.whiteTextColor,
                      size: 17.sp,
                    ),
                  ),
                  Text(
                    'Health Manager',
                    style: TextStyle(
                      color: AppPallet.whiteTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppUtils.go(
                        const NotificationsScreen(),
                      );
                    },
                    child: SizedBox(
                      height: 3.h,
                      width: 7.w,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.notifications,
                                color: AppPallet.whiteTextColor,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0.w,
                            right: 0.5.w,
                            child: Container(
                              width: 2.5.w,
                              height: 2.5.w,
                              decoration: BoxDecoration(
                                color: AppPallet.redTextColor,
                                borderRadius: BorderRadius.circular(1.25.w),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: AppPallet.textColor,
                    border: Border.all(
                      width: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 100.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: AppPallet.textColor,
                            border: Border.all(
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 1.h),
                            decoration: BoxDecoration(
                              color: AppPallet.whiteBackground,
                              borderRadius: BorderRadius.circular(3.w),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFcccccc),
                                  offset: Offset(0, 1.w),
                                  blurRadius: 3.w,
                                  spreadRadius: -1.w,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Welcome Jane,',
                                        style: TextStyle(
                                          color: AppPallet.textColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.sp,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(top: 0.05.h)),
                                      Text(
                                        'Good Morning',
                                        style: TextStyle(
                                          color: AppPallet.textColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 12.w,
                                  height: 12.w,
                                  decoration: BoxDecoration(
                                    color: AppPallet.greyTextColor,
                                    borderRadius: BorderRadius.circular(6.w),
                                    image:  DecorationImage(
                                      image: NetworkImage(
                                        cleanUrl('https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2030&q=80'),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 3.h)),
                      Text(
                        'What would you like to focus today?',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 3.h)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                AppUtils.go(const SelectLevelScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.8.w,
                                  vertical: 1.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFCAC8C4),
                                  borderRadius: BorderRadius.circular(3.w),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 13.w,
                                      height: 13.w,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(healthWorkoutImg),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 0.5.h)),
                                    Text(
                                      'Workout',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 4.8.w)),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                AppUtils.go(const CalorieBurnerScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.8.w,
                                  vertical: 1.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFCAC8C4),
                                  borderRadius: BorderRadius.circular(3.w),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 13.w,
                                      height: 13.w,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(healthCalorieImg),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 0.5.h)),
                                    Text(
                                      'Calorie Counter',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 4.8.w)),
                      GestureDetector(
                        onTap: () {
                          AppUtils.go(const SelectGoalScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.8.w,
                            vertical: 2.5.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFCAC8C4),
                            borderRadius: BorderRadius.circular(3.w),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 14.w,
                                height: 14.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(healthPeriodImg),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 2.4.w)),
                              Column(
                                children: [
                                  Text(
                                    'Female Health Tracker',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.5.h)),
                                  Text(
                                    'Track your period and pregnancy',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
