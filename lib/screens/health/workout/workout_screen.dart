import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:sizer/sizer.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppPallet.textColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.8.w),
            alignment: Alignment.centerLeft,
            child: SafeArea(
              bottom: false,
              child: GestureDetector(
                onTap: () {
                  AppUtils.goBack();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppPallet.whiteTextColor,
                  size: 15.sp,
                ),
              ),
            ),
          ),
          Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: AppPallet.whiteBackground,
              image: const DecorationImage(
                image: AssetImage(pushUpsImg),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
          Expanded(
            child: Container(
              color: AppPallet.whiteBackground,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
                children: [
                  Text(
                    'Sit-Ups',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(
                    color: const Color(0xFF8798B5),
                    thickness: 0.1.w,
                  ),
                  Text(
                    'Push-Ups',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 1.h)),
                  Text(
                    """
1. Lie on your back on a mat with knees bent and feet flat on the floor.

2. Cross your arms in front of your chest.

3.Crunch your ab muscles to lift your shoulders off the mat.

4. Hold for a second, then slowly come back down to starting position.  
""",
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8.h,
                    color: AppPallet.textColor,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            width: 30.w,
                            height: 8.h,
                            color: const Color(0xFFAF3F32),
                          ),
                        ),
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '00:03',
                                  style: TextStyle(
                                    color: AppPallet.whiteTextColor,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.pause,
                                  color: AppPallet.whiteTextColor,
                                  size: 20.sp,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: AppPallet.textColor,
                  height: 8.h,
                  width: 15.w,
                  margin: EdgeInsets.only(left: 0.5.w),
                  child: Icon(
                    Icons.last_page,
                    color: AppPallet.whiteTextColor,
                    size: 20.sp,
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
