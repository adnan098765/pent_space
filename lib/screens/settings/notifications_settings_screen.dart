import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/settings/settings_notifier.dart';
import 'package:sizer/sizer.dart';

class NotificationsSettingsScreen extends ConsumerWidget {
  const NotificationsSettingsScreen({Key? key}) : super(key: key);

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
                    'Notifications',
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
            Padding(
              padding:
                  EdgeInsets.only(left: 4.8.w, right: 4.8.w, bottom: 0.5.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Toggle Notifications",
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
                children: [
                  SettingsItem(
                    title: 'New Message',
                    subTitle: 'Someone sends you a new chat message',
                    value: notifier.newMessage,
                    onChange: notifier.toggleNewMessage,
                  ),
                  SettingsItem(
                    title: 'Feed Comments',
                    subTitle: 'Someone comment on your feed post',
                    value: notifier.feedsComments,
                    onChange: notifier.toggleFeedsComments,
                  ),
                  SettingsItem(
                    title: 'New Answer',
                    subTitle: 'Someone replied your enquiry',
                    value: notifier.newAnswer,
                    onChange: notifier.toggleNewAnswer,
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
  final String? subTitle;
  final bool value;
  final Function? onChange;
  const SettingsItem(
      {Key? key, this.subTitle, this.value = false, this.title, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$subTitle',
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
            child: FittedBox(
              child: Switch.adaptive(
                thumbColor: MaterialStateProperty.all<Color>(
                  AppPallet.textColor,
                ),
                trackColor: MaterialStateProperty.all<Color>(
                  AppPallet.greyBackgroundColor,
                ),
                inactiveThumbColor: AppPallet.textColor,
                inactiveTrackColor: AppPallet.greyBackgroundColor,
                activeColor: AppPallet.lightPrimaryColor,
                activeTrackColor: AppPallet.secondaryColor,
                value: value,
                onChanged: (bool value) {
                  onChange!();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
