import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/home/home_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SignupSuccessScreen extends StatelessWidget {
  const SignupSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 2.h)),
              Center(
                child: Text(
                  'Registration Successful',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15.h)),
              WebsafeSvg.asset(checkMarkVector, height: 20.h),
              Padding(padding: EdgeInsets.only(top: 15.h)),
              GestureDetector(
                onTap: () {
                  AppUtils.go(const HomeScreen());
                },
                child: Center(
                  child: Container(
                    width: 70.w,
                    height: 5.5.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppPallet.textColor,
                      borderRadius: BorderRadius.circular(1.5.w),
                    ),
                    child: Text(
                      'PROCEED',
                      style: TextStyle(
                        color: AppPallet.whiteTextColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 2.h)),
            ],
          ),
        ),
      ),
    );
  }
}
