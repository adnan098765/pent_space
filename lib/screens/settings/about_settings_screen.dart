import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/settings/settings_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class AboutSettingsScreen extends ConsumerWidget {
  const AboutSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(settingsChangeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Column(
        children: [
          Container(
            color: AppPallet.textColor,
            padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
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
                      color: AppPallet.whiteTextColor,
                      size: 13.sp,
                    ),
                  ),
                  Text(
                    'About PentSpace',
                    style: TextStyle(
                      color: AppPallet.whiteTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  )
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WebsafeSvg.asset(logoSvg, height: 13.w),
                      Padding(padding: EdgeInsets.only(top: 1.h)),
                      Text(
                        "PentSpace",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Version: 1.0\n',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      height: 0.16.h,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Do you have any questions or suggestions?\n\n',
                      ),
                      const TextSpan(
                        text: 'Contact us (support@pentspace.com)\n\n\n\n',
                        style: TextStyle(
                          color: Color(0xFF26B49E),
                        ),
                      ),
                      const TextSpan(
                        text: 'By using PentSpace app you agree with\n',
                      ),
                      TextSpan(
                        text: 'Terms and Conditions of Use\n\n\n',
                        style: TextStyle(
                          color: AppPallet.redTextColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy\n\n',
                        style: TextStyle(
                          color: AppPallet.redTextColor,
                        ),
                      ),
                      const TextSpan(text: 'Stay safe with PentSpace\n\n'),
                      TextSpan(
                        text: 'Read our Safety tips',
                        style: TextStyle(
                          color: AppPallet.redTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
        ],
      ),
    );
  }
}
