import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/pregnancy_tracker_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PregnancyWeeklyChangesScreen extends ConsumerWidget {
  const PregnancyWeeklyChangesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(pregnancyTraskerChangeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Column(
        children: [
          Container(
            width: 100.w,
            color: AppPallet.textColor,
            padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
            alignment: Alignment.centerLeft,
            child: SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppUtils.goBack();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 16.sp,
                      color: AppPallet.whiteTextColor,
                    ),
                  ),
                  Text(
                    'Weekly Changes',
                    style: TextStyle(
                      color: AppPallet.whiteTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 0.02.h)),
          Container(
            color: AppPallet.textColor,
            height: 4.h,
            width: 100.w,
            alignment: Alignment.center,
            child: ListView(
              padding: EdgeInsets.only(left: 4.8.w),
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 1; i < 10; i++)
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        notifier.setCurrentPregnancyWeek(i);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 4.8.w),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: notifier.currentPregnancyWeek == i
                                  ? const Color(0xFFEA5544)
                                  : AppPallet.transparent,
                              width: 0.4.w,
                            ),
                          ),
                        ),
                        child: Text(
                          '$i Week${i > 1 ? 's' : ''}',
                          style: TextStyle(
                            color: AppPallet.whiteTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 2.4.w, vertical: 1.h),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.4.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppPallet.whiteBackground,
                    borderRadius: BorderRadius.circular(0.5.w),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          WebsafeSvg.asset(smallBabyHeadVector, width: 6.w),
                          Padding(padding: EdgeInsets.only(right: 2.4.w)),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 0.5.h),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppPallet.textColor,
                                    width: 0.1.w,
                                  ),
                                ),
                              ),
                              child: Text(
                                'Overall of fetal baby this week',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 1.h)),
                      Text(
                        "This week, the baby's hands and feet are forming, but they are webbed, like those of little ducky, and it will be a few more weeks before the webbing disappears. The brain is growing more complex in structure as the profile becomes more refined. The outlines of the baby's facial features is showing by now.",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          height: 0.18.h,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.h)),
                notifier.currentPregnancyWeek.isOdd
                    ? Container()
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.4.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppPallet.whiteBackground,
                          borderRadius: BorderRadius.circular(0.5.w),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                WebsafeSvg.asset(pregnancyWeeklyDigestVector,
                                    height: 6.w),
                                Padding(padding: EdgeInsets.only(right: 2.4.w)),
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: AppPallet.textColor,
                                          width: 0.1.w,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'Weekly digest of expectant mother',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 1.h)),
                            Text(
                              "Your uterus is gradually growing, but the baby bumps is not yet noticeable. You may suffer from morning sickness, frequent urination, drowsiness, heartburn, and other early signs of pregnancy, and your mood swings due to the hormonal changes. All of these are normal and will be greatly relieved after you enter the 2nd trimester of pregnancy. Hang in there; you can do this!.",
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 11.sp,
                                height: 0.18.h,
                              ),
                            )
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
