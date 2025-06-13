import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/auth/signin/signin_screen.dart';
import 'package:pent_space/screens/settings/settings_notifier.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordScreen extends ConsumerWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(settingsChangeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppUtils.goBack();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppPallet.textColor,
                      size: 13.sp,
                    ),
                  ),
                  Text(
                    'Change Password',
                    style: TextStyle(
                      color: AppPallet.textColor,
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
            Padding(padding: EdgeInsets.only(top: 2.h)),
            Divider(height: 0.2.w, color: AppPallet.lightTextColor),
            Padding(padding: EdgeInsets.only(top: 1.h)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 0),
                children: <Widget>[
                  const InputField(
                    label: 'Current',
                    hint: 'Enter your current password',
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  const InputField(
                    label: 'New',
                    hint: 'Enter new password',
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  const InputField(
                    label: 'Re-type new',
                    hint: 'Enter your current password',
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Text(
                    'Never disclose your PentSpace password to anyone',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Forgot your password? ',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 9.sp,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer(),
                          text: 'RECOVER',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.h)),
                  Center(
                    child: Container(
                      height: 5.h,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppPallet.textColor,
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          color: AppPallet.whiteTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String? hint;
  final String? label;
  const InputField({Key? key, this.hint, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: '$label',
            style: TextStyle(
              color: const Color(0xFF7381A5),
              fontWeight: FontWeight.w500,
              fontSize: 11.sp,
            ),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: AppPallet.redTextColor),
              ),
            ],
          ),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: '$hint',
            fillColor: AppPallet.transparent,
            hintStyle: TextStyle(
                fontSize: 10.sp,
                color: AppPallet.lightTextColor,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 1.h,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 0.2,
                color: AppPallet.lightTextColor,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 0.2,
                color: AppPallet.lightTextColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 0.2,
                color: AppPallet.lightTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
