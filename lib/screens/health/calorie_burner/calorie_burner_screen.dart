import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/calorie_burner/calorie_burner_notifier.dart';
import 'package:pent_space/screens/health/health_manager_screen.dart';
import 'package:pent_space/screens/health/workout/select_level_screen.dart';
import 'package:pent_space/screens/home/home_screen.dart';
import 'package:pent_space/screens/home/widgets/notifications_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CalorieBurnerScreen extends ConsumerWidget {
  const CalorieBurnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(calorieBurnerChangeProvider);
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppPallet.textColor,
                    // border: Border.all(width: 0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.8.w),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HealthManagerScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: WebsafeSvg.asset(healthMenuBackIcon,
                                  width: 16.sp),
                            ),
                            GestureDetector(
                              onTap: () {
                                notifier.setMealListModal(true);
                              },
                              child: Text(
                                'Meals',
                                style: TextStyle(
                                  color: AppPallet.whiteTextColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '321',
                                  style: TextStyle(
                                    color: AppPallet.whiteTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  'Eaten',
                                  style: TextStyle(
                                    color: AppPallet.whiteTextColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5.w,
                                  color: const Color(0xFF505765),
                                ),
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '1048',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  Text(
                                    'Remaining',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '98',
                                  style: TextStyle(
                                    color: AppPallet.whiteTextColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  'Burned',
                                  style: TextStyle(
                                    color: AppPallet.whiteTextColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 3.h)),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Carbs',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.5.h)),
                                  Container(
                                    height: 1.5.w,
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF505765),
                                      borderRadius: BorderRadius.circular(1.w),
                                    ),
                                    child: Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: AppPallet.whiteBackground,
                                        borderRadius:
                                            BorderRadius.circular(1.w),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.8.h)),
                                  Text(
                                    '124/342g',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Fat',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.5.h)),
                                  Container(
                                    height: 1.5.w,
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF505765),
                                      borderRadius: BorderRadius.circular(1.w),
                                    ),
                                    child: Container(
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: AppPallet.whiteBackground,
                                        borderRadius:
                                            BorderRadius.circular(1.w),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.8.h)),
                                  Text(
                                    '124/342g',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Protein',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.5.h)),
                                  Container(
                                    height: 1.5.w,
                                    width: 100,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF505765),
                                      borderRadius: BorderRadius.circular(1.w),
                                    ),
                                    child: Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: AppPallet.whiteBackground,
                                        borderRadius:
                                            BorderRadius.circular(1.w),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.8.h)),
                                  Text(
                                    '124/342g',
                                    style: TextStyle(
                                      color: AppPallet.whiteTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.h)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.chevron_left,
                        color: AppPallet.textColor,
                        size: 19.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Today, June 23',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 0.3.w)),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppPallet.textColor,
                            size: 17.sp,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: AppPallet.textColor,
                        size: 19.sp,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.h)),
                Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 1.h),
                    children: [
                      ...[1, 2, 3, 4, 5, 6, 7, 8].map((e) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.5.h),
                          margin: EdgeInsets.only(bottom: 4.h),
                          decoration: BoxDecoration(
                            color: const Color(0x44D67E7C),
                            borderRadius: BorderRadius.circular(1.w),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  WebsafeSvg.asset(breakfastVector, width: 8.w),
                                  Text(
                                    'Breakfast',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 1.w)),
                                  Icon(
                                    Icons.edit,
                                    color: const Color(0x44212121),
                                    size: 12.sp,
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 0.3.h)),
                              Divider(
                                  thickness: 0.1.w, color: AppPallet.textColor),
                              Padding(padding: EdgeInsets.only(top: 0.3.h)),
                              Row(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Fried Egg and Bread',
                                        style: TextStyle(
                                          color: AppPallet.textColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 1.w)),
                                      Icon(
                                        Icons.edit,
                                        color: const Color(0x44212121),
                                        size: 9.sp,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    '32cal',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                    ),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.5.h)),
                              Row(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Fried Egg and Bread',
                                        style: TextStyle(
                                          color: AppPallet.textColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 1.w)),
                                      Icon(
                                        Icons.edit,
                                        color: const Color(0x44212121),
                                        size: 9.sp,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    '32cal',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 9.sp,
                                    ),
                                  )
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Add',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 1.w)),
                                  Icon(
                                    Icons.edit,
                                    color: const Color(0xFF212121),
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Visibility(
              visible: notifier.showMealList,
              child: Container(
                color: const Color(0x66000000),
                padding: EdgeInsets.all(4.8.w),
                child: SafeArea(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: AppPallet.whiteBackground,
                      borderRadius: BorderRadius.circular(3.w),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 1.h),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFFEA5544),
                                width: 0.2.w,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFFEA5544),
                                width: 0.2.w,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppPallet.textColor,
                                width: 0.2.w,
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Expanded(
                            child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            for (var i = 1; i < 30; i++)
                              GestureDetector(
                                onTap: () {
                                  notifier.setMealListModal(false);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.h),
                                  child: Row(
                                    children: [
                                      WebsafeSvg.asset(burgerVector,
                                          width: 7.w),
                                      Padding(
                                          padding:
                                              EdgeInsets.only(right: 2.4.w)),
                                      Expanded(
                                        child: Text(
                                          'Burger',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: '32',
                                          style: TextStyle(
                                              color: AppPallet.textColor,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                          children: [
                                            TextSpan(
                                              text: 'kcal',
                                              style: TextStyle(
                                                color: AppPallet.textColor,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        )),
                        GestureDetector(
                          onTap: () {
                            notifier.setMealListModal(false);
                            notifier.setAddMealListModal(true);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 6.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEA5544),
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'ADD MEAL',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Visibility(
              visible: notifier.showAddMealList,
              child: Container(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: AppPallet.whiteBackground,
                        borderRadius: BorderRadius.circular(3.w),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 0),
                            color: const Color(0xFFcccccc),
                            blurRadius: 9.w,
                            spreadRadius: -2.w,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 20.w,
                            height: 15.w,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: WebsafeSvg.asset(burgerVector,
                                      width: 18.w),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.edit,
                                    color: AppPallet.textColor,
                                    size: 13.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2.h)),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter Meal',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.w, vertical: 1.h),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFFEA5544),
                                  width: 0.2.w,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: const Color(0xFFEA5544),
                                  width: 0.4.w,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppPallet.textColor,
                                  width: 0.2.w,
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 4.h)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 25.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        style: TextStyle(fontSize: 10.sp),
                                        decoration: InputDecoration(
                                          hintText: '',
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0.w, vertical: 1.h),
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: const Color(0xFFEA5544),
                                              width: 0.2.w,
                                            ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: const Color(0xFFEA5544),
                                              width: 0.4.w,
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppPallet.textColor,
                                              width: 0.2.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 0.8.w)),
                                    Text(
                                      'Kcal',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w300,
                                        height: 0.1.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  notifier.setAddMealListModal(false);
                                },
                                child: Container(
                                  width: 10.w,
                                  height: 10.w,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFEA5544),
                                      borderRadius: BorderRadius.circular(5.w)),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.check,
                                    color: AppPallet.whiteTextColor,
                                    size: 20.sp,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
