import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_notifier.dart';
import 'package:pent_space/screens/profile/transactions/banking/add_card_success_screen.dart';
import 'package:pent_space/screens/profile/transactions/withdrawal/withdrawal_success_screen.dart';
import 'package:pent_space/screens/settings/settings_screen.dart';
import 'package:pent_space/widgets/input_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class AddNewCardScreen extends ConsumerWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

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
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
              children: [
                Center(
                  child: Text(
                    'Add New Card',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10.h)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppPallet.whiteBackground,
                    borderRadius: BorderRadius.circular(2.w),
                    boxShadow: [
                      BoxShadow(
                        color: AppPallet.inputBorderColor,
                        offset: const Offset(0, 0),
                        blurRadius: 6.w,
                        spreadRadius: 0.w,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD NUMBER",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 1.h)),
                      Container(
                        height: 5.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.2.w,
                            color: AppPallet.textColor,
                          ),
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                        child: Row(
                          children: [
                            WebsafeSvg.asset(
                              profileCardVector,
                              width: 6.w,
                              color: AppPallet.textColor,
                            ),
                            Padding(padding: EdgeInsets.only(right: 4.w)),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: AppPallet.transparent,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: '1276 8495 7264 523',
                                  hintStyle: TextStyle(
                                    color: AppPallet.greyTextColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 2.h)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "EXPIRY",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Container(
                                height: 5.h,
                                width: 40.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.2.w,
                                    color: AppPallet.textColor,
                                  ),
                                  borderRadius: BorderRadius.circular(1.w),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: AppPallet.transparent,
                                          contentPadding: EdgeInsets.zero,
                                          hintText: 'MM',
                                          hintStyle: TextStyle(
                                            color: AppPallet.greyTextColor,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 4.w, left: 4.w),
                                      child: Text(
                                        "/",
                                        style: TextStyle(
                                          color: AppPallet.textColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: AppPallet.transparent,
                                          contentPadding: EdgeInsets.zero,
                                          hintText: 'YYYY',
                                          hintStyle: TextStyle(
                                            color: AppPallet.greyTextColor,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Container(
                                height: 5.h,
                                width: 20.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 1.h),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.2.w,
                                    color: AppPallet.textColor,
                                  ),
                                  borderRadius: BorderRadius.circular(1.w),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          fillColor: AppPallet.transparent,
                                          contentPadding: EdgeInsets.zero,
                                          hintText: 'cvv',
                                          hintStyle: TextStyle(
                                            color: AppPallet.greyTextColor,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 1.w),
                                      child: Icon(
                                        Icons.help,
                                        color: AppPallet.textColor,
                                        size: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 7.h)),
                GestureDetector(
                  onTap: () {
                    AppUtils.goReplace(const AddCardSuccessScreen());
                  },
                  child: Container(
                    height: 5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppPallet.textColor,
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        color: AppPallet.whiteTextColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
