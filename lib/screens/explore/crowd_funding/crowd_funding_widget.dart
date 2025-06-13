import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_screen.dart';
import 'package:pent_space/view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import 'package:sizer/sizer.dart';
import 'package:pent_space/utils/helpers.dart';
import '../../home/create_crowd_fund/create_crowd_fund_controller.dart';

class CrowdFundingWidget extends StatelessWidget {
  final dynamic data;
  CrowdFundingWidget({Key? key, this.data}) : super(key: key);

  final userdate = Get.put(GetUserDataController());
  final crowdfundController = Get.put(CrowdFundingViewModel());

  void _showDeleteDialog(BuildContext context, crowdfundingid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account?'),
          content: Text('Are you sure you want to delete this Account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                crowdfundController.DeleteCrowdFunding(crowdfundingid);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppUtils.go(CrowdFundingScreen(data: data));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppPallet.whiteBackground,
          borderRadius: BorderRadius.circular(3.w),
          boxShadow: [
            BoxShadow(
              color: AppPallet.greyTextColor,
              offset: Offset(0, 1.w),
              blurRadius: 4.w,
              spreadRadius: -3.w,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 15.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: AppPallet.greyBackgroundColor,
                borderRadius: BorderRadius.circular(3.w),
                image: DecorationImage(
                  image: NetworkImage(
                    cleanUrl('${data["crowd_funding_image"]}'),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data["title"]}',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (userdate.userdata.data!.id == data['user_id']) ...[
                          Spacer(),
                          InkWell(
                            onTap: () {
                              _showDeleteDialog(context, data['id']);
                            },
                            child: Icon(
                              Icons.delete,
                              color: AppPallet.redTextColor,
                              size: 16.sp,
                            ),
                          ),
                        ],
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Text(
                      '\$${data["amount"]}',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.5.h)),
                    Container(
                      width: double.infinity,
                      height: 0.6.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9E9F7),
                        borderRadius: BorderRadius.circular(0.3.h),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 0.6.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: AppPallet.secondaryColor,
                          borderRadius: BorderRadius.circular(0.3.h),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.5.h)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Raised',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 0.2.h)),
                            Text(
                              '\$${data["raised_so_far"] == null ? 0 : data["raised_so_far"]}',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: AppPallet.inputBorderColor,
                          height: 2.5.h,
                          width: 0.4.w,
                        ),
                        Column(
                          children: [
                            Text(
                              'Hours Left..',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 0.2.h)),
                            Text(
                              '${data["hours_left"]} hour',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: AppPallet.inputBorderColor,
                          height: 2.5.h,
                          width: 0.4.w,
                        ),
                        Column(
                          children: [
                            Text(
                              'Amount',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 0.2.h)),
                            Text(
                              '\$${data["amount"]}',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
