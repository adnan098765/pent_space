import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_menu/crowd_funding/crowd_funding_profile_details_screen.dart';
import 'package:sizer/sizer.dart';

class CrowdFundingWidget extends StatelessWidget {
  const CrowdFundingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppUtils.go(const CrowdFundingProfileDetailsScreen());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppPallet.whiteBackground,
          boxShadow: [
            BoxShadow(
              color: AppPallet.greyTextColor,
              offset: Offset(0, 1.w),
              blurRadius: 4.w,
              spreadRadius: -4.w,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30.w,
              width: 30.w,
              decoration: BoxDecoration(
                color: AppPallet.greyBackgroundColor,
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2338&q=80',
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
                        Expanded(
                          child: Text(
                            'Pregnancy Survival Donation',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        Text(
                          '17hours left',
                          style: TextStyle(
                            color: AppPallet.redTextColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
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
                              '\$3,000',
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
                              'In progress'.toUpperCase(),
                              style: TextStyle(
                                color: AppPallet.redTextColor,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
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
                              '\$9,000',
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
