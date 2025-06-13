import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/pregnancy_tracker_screen.dart';
import 'package:pent_space/screens/health/workout/select_weight_screen.dart';
import 'package:pent_space/screens/health/workout/workout_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SelectCycleLengthScreen extends ConsumerWidget {
  const SelectCycleLengthScreen({Key? key}) : super(key: key);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppUtils.goBack();
                    },
                    child: WebsafeSvg.asset(healthMenuBackIcon, width: 16.sp),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select your cycle length',
                      style: TextStyle(
                        color: AppPallet.whiteTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
          Expanded(
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: 16),
              children: <Widget>[
                for (var i = 14; i < 40; i++)
                  Text(
                    "$i days",
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  )
              ],
              onSelectedItemChanged: (value) {},
              itemExtent: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.8.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    AppUtils.goBack();
                  },
                  child: Container(
                    width: 30.w,
                    height: 5.5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7381A5),
                      borderRadius: BorderRadius.circular(1.5.w),
                    ),
                    child: Text(
                      'BACK',
                      style: TextStyle(
                        color: AppPallet.whiteTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 5.w)),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      AppUtils.go(const PregnancyTrackerScreen());
                    },
                    child: Container(
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
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
        ],
      ),
    );
  }
}
