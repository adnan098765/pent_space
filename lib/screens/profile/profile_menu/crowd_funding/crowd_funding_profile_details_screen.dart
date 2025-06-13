import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_donation_screen.dart';
import 'package:pent_space/screens/home/widgets/notifications_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class CrowdFundingProfileDetailsScreen extends StatelessWidget {
  const CrowdFundingProfileDetailsScreen({Key? key}) : super(key: key);

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
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVkaWNpbmV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
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
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.4.w),
                                child: Text(
                                  'Help Amy, Bone Fracture Surgery',
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
                                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 0.17.h,
                                  ),
                                ),
                              ),
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
                                              '\$292.487',
                                              style: TextStyle(
                                                color: AppPallet.textColor,
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    right: 2.w)),
                                            Text(
                                              '50%',
                                              style: TextStyle(
                                                color: const Color(0xFF797E87),
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
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
                                          '\$1,000USD',
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
                                    Padding(
                                      padding: EdgeInsets.only(right: 1.2.w),
                                    ),
                                    Text(
                                      '07 Jan. 2020',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const Spacer(),
                                    WebsafeSvg.asset(
                                      crowdFundingClockVector,
                                      width: 2.8.w,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 1.w)),
                                    Text(
                                      '17 Hours Left',
                                      style: TextStyle(
                                        color: AppPallet.secondaryColor,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Text(
                                  "Donation History",
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 0.8.h)),
                              Divider(
                                height: 0.2.w,
                                color: AppPallet.lightTextColor,
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              ...[1, 2, 3, 4].map((item) {
                                return DonationItem(
                                  isFirstItem: item == 1 ? true : false,
                                  isLastItem: item == 4 ? true : false,
                                );
                              }).toList(),
                              Center(
                                child: Container(
                                  width: 7.w,
                                  height: 7.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppPallet.greyTextColor,
                                    borderRadius: BorderRadius.circular(3.5.w),
                                  ),
                                  child: WebsafeSvg.asset(
                                    crowdFundingDonateVector,
                                    width: 3.8.w,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 3.h)),
                              Center(
                                child: Text(
                                  "Transaction ID: 492K1LP2",
                                  style: TextStyle(
                                    color: AppPallet.greyTextColor,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              )
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

class DonationItem extends StatelessWidget {
  final double percentage;
  final bool isFirstItem;
  final bool isLastItem;
  const DonationItem({
    Key? key,
    this.percentage = 100,
    this.isFirstItem = false,
    this.isLastItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: percentage,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "07 Jan, '20",
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 0.3.h)),
              Text(
                '10:20AM',
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Container(
              width: 40,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // isFirstItem
                  //     ? Container()
                  //     : Positioned(
                  //         top: -3.h,
                  //         left: 0,
                  //         child: Container(
                  //           width: 40,
                  //           // color: AppPallet.primaryColor,
                  //           child: Center(
                  //             child: Container(
                  //               height: percentage,
                  //               color: AppPallet.secondaryColor,
                  //               width: 0.4.w,
                  //               transform:
                  //                   Matrix4.translationValues(0.0, -0.5.h, 0.0),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  Positioned.fill(
                    child: Center(
                      child: Container(
                        height: percentage,
                        color: isLastItem
                            ? AppPallet.greyTextColor
                            : AppPallet.secondaryColor,
                        width: 0.4.w,
                        transform: Matrix4.translationValues(0.0, 1.h, 0.0),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    width: 40,
                    child: Icon(
                      Icons.favorite,
                      color: AppPallet.secondaryColor,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Text(
                "07 Jan, '20",
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 0.3.h)),
              Text(
                '10:20AM',
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
