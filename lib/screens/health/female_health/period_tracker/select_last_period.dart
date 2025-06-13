import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/female_health_notifier.dart';
import 'package:pent_space/screens/health/female_health/period_tracker/period_prediction_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SelectLastPeriod extends ConsumerWidget {
  const SelectLastPeriod({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: GestureDetector(
                    onTap: () {
                      AppUtils.goBack();
                    },
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child:
                            WebsafeSvg.asset(healthMenuBackIcon, width: 16.sp)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 4.h)),
                Text(
                  'Select the first day of your last period',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallet.whiteTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(padding: EdgeInsets.only(top: 0.1.h)),
                TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: notifier.focusedDay,
                  // calendarFormat: CalendarFormat.month,
                  headerVisible: false,
                  daysOfWeekHeight: 6.h,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    decoration: BoxDecoration(color: AppPallet.textColor),
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
                Padding(padding: EdgeInsets.only(top: 2.h)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              AppUtils.go(const PeriodPredictionScreen());
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
