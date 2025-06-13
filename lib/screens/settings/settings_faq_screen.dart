import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/settings/ask_questions_faq.dart';
import 'package:pent_space/screens/settings/crowd_funding_faq.dart';
import 'package:pent_space/screens/settings/promotions_faq.dart';
import 'package:pent_space/screens/settings/report_faq.dart';
import 'package:sizer/sizer.dart';

class SettingsFaqScreen extends StatelessWidget {
  const SettingsFaqScreen({Key? key}) : super(key: key);

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
                    'FAQ',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4.w)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
            Divider(height: 0.2.w, color: AppPallet.greyBackgroundColor),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  SettingsItem(
                    icon: Icons.info_outline,
                    title: 'Ask Questions',
                    screen: AskQuestionsFaq(),
                  ),
                  SettingsItem(
                    icon: Icons.shield_moon_outlined,
                    title: 'Promotions',
                    screen: PromotionsFaq(),
                  ),
                  SettingsItem(
                    icon: Icons.credit_card_outlined,
                    title: 'How to leave feedback or illegal activity',
                    screen: ReportFaq(),
                  ),
                  SettingsItem(
                    icon: Icons.campaign_outlined,
                    title: 'Crowdfunding',
                    screen: CrowdFundingFaq(),
                  ),
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
