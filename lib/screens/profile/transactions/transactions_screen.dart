import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/transactions/banking/bank_cards_screen.dart';
import 'package:pent_space/screens/profile/transactions/topup/add_funds_screen.dart';
import 'package:pent_space/screens/profile/transactions/withdrawal/withdraw_funds_screen.dart';
import 'package:pent_space/screens/settings/settings_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class TransactionScreen extends ConsumerWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                          AppUtils.go(const SettingsScreen());
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
                              color: const Color(0xFFF19733),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppUtils.go(const AddFundsScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppPallet.textColor,
                              borderRadius: BorderRadius.circular(6.w),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20.sp,
                              color: AppPallet.whiteTextColor,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 0.8.h)),
                          Text(
                            'Add Funds',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppUtils.go(const WithdrawFundsScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppPallet.textColor,
                              borderRadius: BorderRadius.circular(6.w),
                            ),
                            child: WebsafeSvg.asset(
                              profileSendVector,
                              width: 6.w,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 0.8.h)),
                          Text(
                            'Withdrawal',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppUtils.go(const BankCardsScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppPallet.textColor,
                              borderRadius: BorderRadius.circular(6.w),
                            ),
                            child: WebsafeSvg.asset(
                              profileCardVector,
                              width: 6.w,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 0.8.h)),
                          Text(
                            'Bank',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 4.8.w, top: 1.h, right: 4.8.w),
                  margin: EdgeInsets.only(top: 2.h),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 0.1.w, color: AppPallet.lightBorderColor),
                    ),
                  ),
                  child: Text(
                    'Transactions',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ...[1, 2, 3, 4, 5, 6].map((item) {
                  return const TransactionCard();
                }).toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
      child: Row(
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppPallet.textColor,
              borderRadius: BorderRadius.circular(4.w),
            ),
            child: WebsafeSvg.asset(
              profileSendVector,
              width: 4.w,
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 3.w)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Money Received',
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 0.5.h)),
                Text(
                  '11:56PM',
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '+12,000.00',
            style: TextStyle(
              color: AppPallet.textColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
