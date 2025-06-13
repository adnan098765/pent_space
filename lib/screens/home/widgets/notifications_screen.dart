import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/view_models/notifications_view_model/notifications_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:pent_space/utils/helpers.dart';
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final notificationVM = Get.put(NotificationViewModel());
  @override
  void initState() {
    notificationVM.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Notification',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4.w)
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => notificationVM.loading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: notificationVM.AllNotifications.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _QuestionItem(
                            data: notificationVM.AllNotifications[index],
                          );
                        }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _QuestionItem extends StatelessWidget {
  final data;
  const _QuestionItem({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.4.w, color: AppPallet.inputBorderColor),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.4.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 10.w,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: AppPallet.greyBackgroundColor,
                        borderRadius: BorderRadius.circular(5.w),
                        image: DecorationImage(
                          image: NetworkImage(
                            cleanUrl('${data['senders'] == null ? globalimage : data['senders']['profile_picture']}'),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 2.w)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Text(
                              //   'Aftermath Therapist',
                              //   style: TextStyle(
                              //     color: AppPallet.textColor,
                              //     fontSize: 10.sp,
                              //     fontWeight: FontWeight.w600,
                              //   ),
                              // ),
                              Padding(
                                  padding:
                                      EdgeInsets.only(right: 2.4.w, top: 10)),
                              Expanded(
                                child: Text(
                                  '${data['message']}',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 0.3.h)),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${formatTimestamp(DateTime.parse(data['createdAt']))}',
                              style: TextStyle(
                                color: AppPallet.lightTextColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
