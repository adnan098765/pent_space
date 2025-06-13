import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/female_health_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:websafe_svg/websafe_svg.dart';

class NewPeriodRecord extends ConsumerWidget {
  const NewPeriodRecord({Key? key}) : super(key: key);

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
                    'New Record',
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
            child: Container(
              color: const Color(0xFFEEEEEE),
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
                          // calendarFormat: CalendarFormat.month,
                          headerVisible: false,
                          headerStyle: const HeaderStyle(
                            titleCentered: true,
                            formatButtonVisible: false,
                            headerPadding: EdgeInsets.symmetric(vertical: 0),
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
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                          child: Wrap(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 11.sp,
                                color: const Color(0xFFEA5544),
                              ),
                              Padding(padding: EdgeInsets.only(right: 1.w)),
                              Text(
                                'Period',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.sp,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Icon(
                                Icons.circle,
                                size: 11.sp,
                                color: const Color(0xFFF08C81),
                              ),
                              Padding(padding: EdgeInsets.only(right: 1.w)),
                              Text(
                                'Predicted Period',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.sp,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Icon(
                                Icons.circle,
                                size: 11.sp,
                                color: const Color(0xFF6C63FF),
                              ),
                              Padding(padding: EdgeInsets.only(right: 1.w)),
                              Text(
                                'Fertile',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.sp,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Icon(
                                Icons.hexagon,
                                size: 11.sp,
                                color: const Color(0xFF6C63FF),
                              ),
                              Padding(padding: EdgeInsets.only(right: 1.w)),
                              Text(
                                'Ovulation',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h))
                      ],
                    ),
                  ),
                  Container(
                    height: 2.h,
                    color: const Color(0xFFDBDBDB),
                  ),
                  Container(
                    color: const Color(0xFFEEEEEE),
                    margin: EdgeInsets.only(top: 2.h),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                            children: [
                              WebsafeSvg.asset(symptomsIcon, width: 5.5.w),
                              Padding(padding: EdgeInsets.only(right: 2.4.w)),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.5.h),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.05.w,
                                        color: AppPallet.textColor,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Symptoms',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ),
                                      WebsafeSvg.asset(rightChevron,
                                          width: 3.8.w),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                            children: [
                              WebsafeSvg.asset(habitIcon, width: 5.5.w),
                              Padding(padding: EdgeInsets.only(right: 2.4.w)),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.5.h),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.05.w,
                                        color: AppPallet.textColor,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Habit',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ),
                                      WebsafeSvg.asset(rightChevron,
                                          width: 3.8.w),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                            children: [
                              WebsafeSvg.asset(moodIcon, width: 5.5.w),
                              Padding(padding: EdgeInsets.only(right: 2.4.w)),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.5.h),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.05.w,
                                        color: AppPallet.textColor,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Mood',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ),
                                      WebsafeSvg.asset(rightChevron,
                                          width: 3.8.w),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                            children: [
                              WebsafeSvg.asset(weightIcon, width: 4.5.w),
                              Padding(padding: EdgeInsets.only(right: 3.w)),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.5.h),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.05.w,
                                        color: AppPallet.textColor,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Weight',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ),
                                      WebsafeSvg.asset(rightChevron,
                                          width: 3.8.w),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                            children: [
                              WebsafeSvg.asset(temperatureIcon, width: 5.5.w),
                              Padding(padding: EdgeInsets.only(right: 2.4.w)),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.5.h),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.05.w,
                                        color: AppPallet.textColor,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Temperature',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ),
                                      WebsafeSvg.asset(rightChevron,
                                          width: 3.8.w),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                          margin: EdgeInsets.only(bottom: 1.h),
                          child: Row(
                            children: [
                              WebsafeSvg.asset(noteIcon, width: 5.5.w),
                              Padding(padding: EdgeInsets.only(right: 2.4.w)),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 1.5.h),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.05.w,
                                        color: AppPallet.textColor,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Note',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ),
                                      WebsafeSvg.asset(rightChevron,
                                          width: 3.8.w),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
