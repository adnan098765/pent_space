import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:pent_space/screens/profile/transactions/withdrawal/initiate_withdrawal_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WithdrawFundsScreen extends ConsumerWidget {
  const WithdrawFundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileMenuChangeProvider);
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppPallet.textColor,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 4.8.w),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppPallet.whiteTextColor,
                          size: 14.sp,
                        ),
                      ),
                      Text(
                        'Binary Pharmaceuticals',
                        style: TextStyle(
                          color: AppPallet.whiteTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.settings,
                          color: AppPallet.whiteTextColor,
                          size: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 3.h)),
                  Container(
                    width: 55.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFF424955),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '₦ 752,000',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        GestureDetector(
                          child: Text(
                            'Hide',
                            style: TextStyle(
                              color: Color(0xFFF19733),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 1.h)),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
              children: [
                Center(
                  child: Text(
                    '₦${notifier.inpputAmount}',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 0.5.h)),
                Center(
                  child: Text(
                    'Available balance ₦752,000.00',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Wrap(
                  runAlignment: WrapAlignment.end,
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...["1", "2", "3", "4", "5", "6", "7", "8", "9"].map(
                      (item) {
                        return InkWell(
                          onTap: () {
                            notifier.addAmount(item);
                          },
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            width: 33.33.w,
                            height: 12.h,
                            alignment: Alignment.center,
                            child: Text(
                              item,
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    InkWell(
                      onTap: () {
                        notifier.addAmount('.');
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: 33.33.w,
                        height: 8.h,
                        alignment: Alignment.center,
                        child: Text(
                          '.',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        notifier.addAmount("0");
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        width: 33.33.w,
                        height: 8.h,
                        alignment: Alignment.center,
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        notifier.clearInput();
                      },
                      child: Container(
                        width: 33.33.w,
                        height: 8.h,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.backspace_outlined,
                          color: AppPallet.textColor,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      AppUtils.goReplace(const InitiateWithdrawal());
                    },
                    child: Container(
                      width: 80.w,
                      height: 5.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppPallet.textColor,
                          borderRadius: BorderRadius.circular(2.w)),
                      child: Text(
                        "Withdrawal",
                        style: TextStyle(
                          color: AppPallet.whiteTextColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
