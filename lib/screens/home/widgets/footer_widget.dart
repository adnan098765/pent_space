import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/app_const.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';

import 'package:pent_space/screens/home/create_enquiry/create_enquiry_screen.dart';
import 'package:pent_space/screens/home/create_post/create_post_screen.dart';
import 'package:pent_space/screens/home/home_notifier.dart';

import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../view_models/getallfeeds/get_allfeeds_view_model.dart';
import '../create_crowd_fund/create_crowd_fund_screen.dart';
import '../create_services/create_services.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(HomeController());
    final allfeedController = Get.put(AllFeedsController());

    const bottomPadding = 0; //MediaQuery.of(context).padding.bottom;

    return SizedBox(
      width: 100.w,
      height: 9.h + bottomPadding,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Container(
              padding:
                  EdgeInsets.only(top: 0.5.h, bottom: 2.8.h + bottomPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppPallet.whiteBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.w),
                  topRight: Radius.circular(3.w),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.w, 0.w),
                    color: AppPallet.lightGreyColor,
                    spreadRadius: -2.w,
                    blurRadius: 4.w,
                  )
                ],
              ),
              child: Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildMenuButton(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.black54,
                      ),
                      text: 'HOME',
                      isSelected: homecontroller.currentScreen.value == "home",
                      onTap: () {
                        allfeedController.getAllFeeds();
                        homecontroller.setCurrentScreen("home");
                      },
                    ),
                    buildMenuButton(
                      icon:
                          WebsafeSvg.asset(exploreMenuIconVector, height: 2.h),
                      text: 'EXPLORE',
                      isSelected:
                          homecontroller.currentScreen.value == "explore",
                      onTap: () {
                        homecontroller.setCurrentScreen("explore");
                        // Get.to(() => ExploreScreen());
                      },
                    ),
                    buildMenuButton(
                      icon: WebsafeSvg.asset(createMenuIconVector, height: 2.h),
                      text: 'CREATE',
                      isSelected:
                          homecontroller.currentScreen.value == "create",
                      onTap: () {
                        _openCreate(context);
                      },
                    ),
                    buildMenuButton(
                      icon:
                          WebsafeSvg.asset(messageMenuIconVector, height: 2.h),
                      text: 'MESSAGES',
                      isSelected:
                          homecontroller.currentScreen.value == "messages",
                      onTap: () {
                        homecontroller.setCurrentScreen("messages");
                      },
                    ),
                    buildMenuButton(
                      icon:
                          WebsafeSvg.asset(profileMenuIconVector, height: 2.h),
                      text: 'PROFILE',
                      isSelected:
                          homecontroller.currentScreen.value == "profile",
                      onTap: () {
                        homecontroller.setCurrentScreen("profile");
                        // Get.to(() => ProfileScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton({
    required Widget icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            icon,
            Padding(padding: EdgeInsets.only(top: 0.6.h)),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.black : AppPallet.greyTextColor,
                fontSize: isSelected ? 9.5.sp : 8.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCreate(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return CreateModal();
      },
    );
  }
}

class CreateModal extends StatelessWidget {
  CreateModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 20.h,
      decoration: BoxDecoration(
          color: AppPallet.whiteBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.w),
            topRight: Radius.circular(4.w),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2.w),
              color: AppPallet.lightBorderColor,
              blurRadius: 3.w,
              spreadRadius: -1.5.w,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
        child: Column(
          children: [
            Container(
              height: 0.5.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: const Color(0xFF707070),
                borderRadius: BorderRadius.circular(0.3.h),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
            Center(
              child: Text(
                'Create New',
                style: TextStyle(
                  color: AppPallet.textColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // AppUtils.goReplace(CreatePostScreen());
                    Get.to(() => CreatePostScreen());
                  },
                  child: Container(
                    height: 7.6.h,
                    width: 21.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC8CACC),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WebsafeSvg.asset(
                          createFeedsVector,
                          height: 2.3.h,
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.8.h)),
                        Text(
                          'Feed',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppUtils.goReplace(CreateEnquiryScreen());
                  },
                  child: Container(
                    height: 7.6.h,
                    width: 21.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFC8CACC),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WebsafeSvg.asset(
                          createEnquiryVector,
                          height: 2.3.h,
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.8.h)),
                        Text(
                          'Ask Question',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Uncomment if needed
                // GestureDetector(
                //   onTap: () {
                //     AppUtils.goReplace(CreateCrowdFundScreen());
                //   },
                //   child: Container(
                //     height: 7.6.h,
                //     width: 21.w,
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFC8CACC),
                //       borderRadius: BorderRadius.circular(2.w),
                //     ),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         WebsafeSvg.asset(
                //           createCrowdFundVector,
                //           height: 2.3.h,
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 0.8.h)),
                //         Text(
                //           'Crowdfund',
                //           style: TextStyle(
                //             color: AppPallet.textColor,
                //             fontSize: 9.sp,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                if (UserRole == "BUSINESS") ...[
                  GestureDetector(
                    onTap: () {
                      AppUtils.goReplace(CreateServices());
                    },
                    child: Container(
                      height: 7.6.h,
                      width: 21.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC8CACC),
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WebsafeSvg.asset(
                            createCrowdFundVector,
                            height: 2.3.h,
                          ),
                          Padding(padding: EdgeInsets.only(top: 0.8.h)),
                          Text(
                            'Create Service',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
