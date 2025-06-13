import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/screens/auth/signup/signup_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

final PageController? _pageViewController = PageController(initialPage: 0);

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageViewController,
                onPageChanged: (int int) {
                  setState(() {
                    _currentPage = int;
                  });
                },
                children: [
                  _pageOne(),
                  _pageTwo(),
                  const SignupScreen(),
                ],
              ),
            ),
            Visibility(
              visible: _currentPage < 2 ? true : false,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: _currentPage == 0 ? 10.w : 2.w,
                        height: 2.w,
                        decoration: BoxDecoration(
                          color: _currentPage == 0
                              ? AppPallet.primaryColor
                              : AppPallet.lightPrimaryColor,
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 1.w)),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: _currentPage == 1 ? 10.w : 2.w,
                        height: 2.w,
                        decoration: BoxDecoration(
                          color: _currentPage == 1
                              ? AppPallet.primaryColor
                              : AppPallet.lightPrimaryColor,
                          borderRadius: BorderRadius.circular(1.w),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 2.h))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pageOne() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 10.h)),
          Container(
            height: 40.h,
            alignment: Alignment.center,
            child: WebsafeSvg.asset(
              onboardingOneVector,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 4.h)),
          Text(
            'Connect with Service \n Providers Around You',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppPallet.textColor,
              fontSize: 13.sp,
              height: 0.15.h,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageTwo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(top: 10.h)),
          Container(
            height: 40.h,
            alignment: Alignment.center,
            child: WebsafeSvg.asset(onboardingTwoVector, width: 80.w),
          ),
          Padding(padding: EdgeInsets.only(top: 4.h)),
          Text(
            'Connect with the right people who need your services.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppPallet.textColor,
              fontSize: 13.sp,
              height: 0.15.h,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
