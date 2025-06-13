import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/settings/about_settings_screen.dart';
import 'package:pent_space/screens/settings/change_password_screen.dart';
import 'package:pent_space/screens/settings/delete_account_screen.dart';
import 'package:pent_space/screens/settings/notifications_settings_screen.dart';
import 'package:pent_space/screens/settings/settings_faq_screen.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    'Settings',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: AppPallet.textColor,
                    size: 12.sp,
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
            Padding(
              padding:
                  EdgeInsets.only(left: 4.8.w, right: 4.8.w, bottom: 0.5.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Account Settings",
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Divider(height: 0.2.w, color: AppPallet.greyBackgroundColor),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  SettingsItem(
                    icon: Icons.info_outline,
                    title: 'Notifications',
                    screen: NotificationsSettingsScreen(),
                  ),
                  SettingsItem(
                    icon: Icons.shield_moon_outlined,
                    title: 'Change Password',
                    screen: ChangePasswordScreen(),
                  ),
                  SettingsItem(
                    icon: Icons.credit_card_outlined,
                    title: 'Delete Account',
                    screen: DeleteAccountScreen(),
                  ),
                  SettingsItem(
                    icon: Icons.campaign_outlined,
                    title: 'About Pentspace',
                    screen: AboutSettingsScreen(),
                  ),
                  SettingsItem(
                    icon: Icons.campaign_outlined,
                    title: 'FAQ',
                    screen: SettingsFaqScreen(),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
            GestureDetector(
              onTap: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SigninScreen()),
                //   (route) => false,
                // );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppPallet.whiteBackground,
                  boxShadow: [
                    BoxShadow(
                      color: AppPallet.lightTextColor,
                      offset: Offset(0, 0.1.w),
                      blurRadius: 1.w,
                      spreadRadius: -1.w,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.campaign_outlined,
                      color: AppPallet.textColor,
                      size: 15.sp,
                    ),
                    Padding(padding: EdgeInsets.only(right: 2.4.w)),
                    Text(
                      'Log out',
                      style: TextStyle(
                        color: AppPallet.redTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
          ],
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget? screen;
  const SettingsItem({Key? key, this.icon, this.screen, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppUtils.go(screen!);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: AppPallet.whiteBackground,
          border: Border(
            bottom: BorderSide(
              width: 0.2.w,
              color: AppPallet.greyBackgroundColor,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppPallet.textColor,
              size: 16.sp,
            ),
            Padding(padding: EdgeInsets.only(right: 4.w)),
            Expanded(
              child: Text(
                '$title',
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppPallet.textColor,
              size: 13.sp,
            )
          ],
        ),
      ),
    );
  }
}
