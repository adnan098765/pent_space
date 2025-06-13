import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_screen.dart';
import 'package:pent_space/screens/home/models/crowd_fund_model.dart';
import 'package:sizer/sizer.dart';

class TrendingCrowdFundingWidget extends StatelessWidget {
  final dynamic data;
  const TrendingCrowdFundingWidget({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Hello"+data);
    return GestureDetector(
      onTap: () {
        AppUtils.go(CrowdFundingScreen(data: data));
      },
      child: Container(
        width: 64.w,
        margin: EdgeInsets.only(right: 3.8.w, bottom: 2.h, left: 1.w),
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
        child: Column(
          children: [
            Container(
              height: 18.h,
              decoration: BoxDecoration(
                color: AppPallet.greyBackgroundColor,
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1457342813143-a1ae27448a82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.4.w, vertical: 1.5.h),
              child: Column(
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
                  Padding(padding: EdgeInsets.only(top: 0.4.h)),
                  Text(
                    '${data["description"]}',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 1.h)),
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
                  Padding(padding: EdgeInsets.only(top: 0.5.h)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Raised!',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 0.2.h)),
                          Text(
                            '\$${data["amountContributed"]}',
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
                            'Hours Left',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 0.2.h)),
                          Text(
                            '${data["endDate"]}',
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
                            'Amount...',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 0.2.h)),
                          Text(
                            '\$${data["amountExpected"]}',
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
          ],
        ),
      ),
    );
  }
}
