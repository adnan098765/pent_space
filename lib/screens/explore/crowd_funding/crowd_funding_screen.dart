import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_donation_screen.dart';
import 'package:pent_space/screens/home/user_details_screen.dart';
import 'package:pent_space/screens/home/widgets/notifications_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:pent_space/utils/helpers.dart';

class CrowdFundingScreen extends StatelessWidget {
  final dynamic data;
  const CrowdFundingScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
            color: AppPallet.textColor,
            child: SafeArea(
              bottom: false,
              child: Row(
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
                  Padding(padding: EdgeInsets.only(right: 4.8.w)),
                  Expanded(
                    child: Text(
                      'PentSpace',
                      style: TextStyle(
                        color: AppPallet.whiteTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppUtils.go(const NotificationsScreen());
                    },
                    child: SizedBox(
                      height: 3.h,
                      width: 7.w,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.notifications,
                                color: AppPallet.whiteTextColor,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0.w,
                            right: 0.5.w,
                            child: Container(
                              width: 2.5.w,
                              height: 2.5.w,
                              decoration: BoxDecoration(
                                color: AppPallet.redTextColor,
                                borderRadius: BorderRadius.circular(1.25.w),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppPallet.greyBackgroundColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          cleanUrl(data['crowd_funding_image']),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 38.h)),
                      Container(
                        decoration: BoxDecoration(
                          color: AppPallet.whiteBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.w),
                            topRight: Radius.circular(3.w),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Divider(
                                height: 0.2.w,
                                color: AppPallet.lightTextColor,
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.8.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Raised so far',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 0.3.h)),
                                        Row(
                                          children: [
                                            Text(
                                              '\$${data["raised_so_far"] == null ? 0 : data["raised_so_far"]}',
                                              style: TextStyle(
                                                color: AppPallet.textColor,
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: 2.w)),
                                            // Text(
                                            //   '50%',
                                            //   style: TextStyle(
                                            //     color: const Color(0xFF797E87),
                                            //     fontSize: 9.sp,
                                            //     fontWeight: FontWeight.w400,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Donation',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 0.3.h)),
                                        Text(
                                          '\$${data["amount"]} USD',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontSize: 9.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.5.h)),
                              Container(
                                width: double.infinity,
                                height: 1.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE9E9F7),
                                  borderRadius: BorderRadius.circular(0.5.h),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 1.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: AppPallet.secondaryColor,
                                    borderRadius: BorderRadius.circular(0.5.h),
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.5.h)),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.4.w),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 4.5.w,
                                      width: 4.5.w,
                                      decoration: BoxDecoration(
                                        color: AppPallet.greyBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(2.25.w),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            cleanUrl('${data['profile_picture']}'),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 1.2.w),
                                    ),
                                    Text(
                                      '${data["business_name"] != null ? data["business_name"] : data['full_name']}',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(left: 1.h)),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => UserDetailsScreen(
                                              servicedetails: data,
                                            ));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 2.w,
                                          vertical: 0.5.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFDFE0E2),
                                          borderRadius:
                                              BorderRadius.circular(1.w),
                                        ),
                                        child: Text(
                                          'View Profile',
                                          style: TextStyle(
                                            color: AppPallet.textColor,
                                            fontSize: 6.sp,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                        padding: EdgeInsets.only(right: 1.w)),
                                    WebsafeSvg.asset(
                                      crowdFundingClockVector,
                                      width: 3.w,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 1.w)),
                                    Text(
                                      '${data["hours_left"]} Hours Left',
                                      style: TextStyle(
                                        color: AppPallet.secondaryColor,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.5.h)),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.4.w),
                                child: Text(
                                  '${data["title"]}',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 1.h)),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.4.w),
                                child: Text(
                                  '${data["description"]}',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 0.17.h,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 3.h)),
                              Divider(
                                height: 0.2.w,
                                color: AppPallet.lightTextColor,
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.4.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Container(
                                    //   height: 5.h,
                                    //   padding: EdgeInsets.symmetric(
                                    //       horizontal: 7.4.w),
                                    //   decoration: BoxDecoration(
                                    //     color: AppPallet.textColor,
                                    //     borderRadius:
                                    //         BorderRadius.circular(2.5.h),
                                    //   ),
                                    //   child: Row(
                                    //     children: [
                                    //       Text(
                                    //         'Share',
                                    //         style: TextStyle(
                                    //           color: AppPallet.whiteTextColor,
                                    //           fontSize: 12.sp,
                                    //           fontWeight: FontWeight.w600,
                                    //         ),
                                    //       ),
                                    //       Padding(
                                    //         padding:
                                    //             EdgeInsets.only(right: 2.4.w),
                                    //       ),
                                    //       Icon(
                                    //         Icons.ios_share,
                                    //         color: AppPallet.whiteTextColor,
                                    //         size: 14.sp,
                                    //       )
                                    //     ],
                                    //   ),
                                    // ),
                                    // const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        AppUtils.go(
                                          CrowdFundingDonationScreen(
                                              data: data),
                                        );
                                      },
                                      child: Container(
                                        height: 5.h,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7.4.w),
                                        decoration: BoxDecoration(
                                          color: AppPallet.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(2.5.h),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Donate',
                                              style: TextStyle(
                                                color: AppPallet.whiteTextColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 2.4.w),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                WebsafeSvg.asset(
                                                  crowdFundingDonateVector,
                                                  width: 5.w,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 1.w,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.h)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
