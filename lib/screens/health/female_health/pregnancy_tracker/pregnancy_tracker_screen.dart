import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/pregnancy_tracker_notifier.dart';
import 'package:pent_space/screens/health/female_health/pregnancy_tracker/pregnancy_weekly_changes_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PregnancyTrackerScreen extends ConsumerWidget {
  const PregnancyTrackerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(pregnancyTraskerChangeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  color: AppPallet.textColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
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
                          'Pregnancy Tracker',
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
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        color: const Color(0xFFFCFCFC),
                        child: Column(
                          children: [
                            TableCalendar(
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              focusedDay: notifier.focusedDay,
                              calendarFormat: CalendarFormat.week,
                              headerVisible: false,
                              headerStyle: const HeaderStyle(
                                titleCentered: true,
                                formatButtonVisible: false,
                                headerPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                              ),
                              daysOfWeekHeight: 6.h,
                              daysOfWeekStyle: DaysOfWeekStyle(
                                decoration:
                                    BoxDecoration(color: AppPallet.textColor),
                                weekdayStyle: TextStyle(
                                  color: AppPallet.whiteTextColor,
                                ),
                              ),
                              calendarStyle: CalendarStyle(
                                selectedDecoration: BoxDecoration(
                                  color: AppPallet.textColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              selectedDayPredicate: (day) {
                                return isSameDay(notifier.selectedDay, day);
                              },
                              onDaySelected: (selectedDay, focusedDay) {
                                notifier.onDaySelected(selectedDay, focusedDay);
                              },
                            ),
                            Padding(padding: EdgeInsets.only(top: 1.h)),
                            Container(
                              width: 70.w,
                              height: 70.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.2.w,
                                  color: AppPallet.textColor,
                                ),
                                gradient: RadialGradient(
                                  colors: [
                                    AppPallet.whiteBackground,
                                    const Color(0xFF52B8E8),
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 2.h)),
                                        Text(
                                          'Day 1',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: '96 ',
                                            style: TextStyle(
                                              color: AppPallet.textColor,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.sp,
                                            ),
                                            children: const [
                                              TextSpan(
                                                text: 'days to due date',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      width: 15.w,
                                      height: 15.w,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(fetusImg),
                                        fit: BoxFit.contain,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 2.h)),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            AppUtils.go(const PregnancyWeeklyChangesScreen());
                          },
                          child: Container(
                            width: 50.w,
                            height: 5.5.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF7381A5),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            child: Text(
                              'Weekly Changes',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 1.5.h)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Height ',
                              style: TextStyle(
                                color: const Color(0xFF7381A5),
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: '361mm',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 9.sp,
                                  ),
                                  children: [],
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Weight ',
                              style: TextStyle(
                                color: const Color(0xFF7381A5),
                                fontWeight: FontWeight.w600,
                                fontSize: 10.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: '860g',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 9.sp,
                                  ),
                                  children: [],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const BabyGrowthModal(),
          const MotherDailyChangeModal(),
        ],
      ),
    );
  }
}

class BabyGrowthModal extends ConsumerWidget {
  const BabyGrowthModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(pregnancyTraskerChangeProvider);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      top: notifier.showBabyGrowthModal
          ? MediaQuery.of(context).padding.top + 20
          : MediaQuery.of(context).size.height - 20.h,
      left: 0,
      child: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dy > 0) {
            notifier.setShowBabyGrowthModal(false);
          }

          // Swiping in left direction.
          if (details.delta.dy < 0) {
            notifier.setShowBabyGrowthModal(true);
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              20,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: const Color(0xFF7381A5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3.w),
              topRight: Radius.circular(3.w),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 1.5.w,
                top: 2.h,
                child: Container(
                  color: const Color(0xFFF7B239),
                  width: 0.5.w,
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      20,
                ),
              ),
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(-1.w, 0.0, 0.0),
                      child: Row(
                        children: [
                          WebsafeSvg.asset(babyHeadVector, width: 6.w),
                          Padding(padding: EdgeInsets.only(right: 2.4.w)),
                          Text(
                            "Baby's Daily Growth",
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.5.h)),
                    Expanded(
                        child: ListView(
                      padding: EdgeInsets.zero,
                      children: const [
                        BabyGrowthItem(),
                        BabyGrowthItem(),
                        BabyGrowthItem(),
                        BabyGrowthItem(),
                        BabyGrowthItem(),
                        BabyGrowthItem(),
                        BabyGrowthItem(),
                        BabyGrowthItem(),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MotherDailyChangeModal extends ConsumerWidget {
  const MotherDailyChangeModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(pregnancyTraskerChangeProvider);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      top: notifier.showMotherChangeModal
          ? MediaQuery.of(context).padding.top + 20
          : MediaQuery.of(context).size.height - 14.h,
      left: 0,
      child: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dy > 0) {
            notifier.setShowMotherChangeModal(false);
          }

          // Swiping in left direction.
          if (details.delta.dy < 0) {
            notifier.setShowMotherChangeModal(true);
          }
        },
        child: Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              20,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
          decoration: BoxDecoration(
              color: AppPallet.textColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.w),
                topRight: Radius.circular(3.w),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset.zero,
                  color: const Color(0xFFcccccc),
                  blurRadius: 9.w,
                  spreadRadius: -3.w,
                )
              ]),
          child: Stack(
            children: [
              Positioned(
                left: 1.5.w,
                top: 2.h,
                child: Container(
                  color: const Color(0xFFEA5544),
                  width: 0.5.w,
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      20,
                ),
              ),
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      transform: Matrix4.translationValues(-0.w, 0.0, 0.0),
                      child: Row(
                        children: [
                          WebsafeSvg.asset(pregnantMotherVector, height: 2.5.h),
                          Padding(padding: EdgeInsets.only(right: 2.4.w)),
                          Text(
                            "Mother's Daily Change",
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontSize: 11.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.5.h)),
                    Expanded(
                        child: ListView(
                      padding: EdgeInsets.zero,
                      children: const [
                        BabyGrowthItem(
                          isBaby: false,
                        ),
                        BabyGrowthItem(
                          isBaby: false,
                        ),
                        BabyGrowthItem(
                          isBaby: false,
                        ),
                        BabyGrowthItem(
                          isBaby: false,
                        ),
                        BabyGrowthItem(
                          isBaby: false,
                        ),
                        BabyGrowthItem(
                          isBaby: false,
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BabyGrowthItem extends StatelessWidget {
  final String? title;
  final String? body;
  final bool isBaby;
  const BabyGrowthItem({Key? key, this.title, this.body, this.isBaby = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.4.h),
            child: Icon(
              Icons.circle,
              color: isBaby ? const Color(0xFFF7B239) : const Color(0xFFEA5544),
              size: 9.sp,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 2.4.w)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Day 1',
                  style: TextStyle(
                    color: AppPallet.whiteTextColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.h)),
                Text(
                  'Mommy, technically speaking, I don’t exist yet, I am now living inside Daddy and you as the sperm and egg. You and Daddy need to work harder so that I can live in your womb soon.',
                  style: TextStyle(
                    color: AppPallet.whiteTextColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w300,
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
