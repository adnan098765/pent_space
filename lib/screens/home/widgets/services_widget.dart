// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:sizer/sizer.dart';

import '../nearby_services/service_detail_screen.dart';
import 'package:pent_space/utils/helpers.dart';

class ServicesWidget extends StatelessWidget {
  final serviceData;
  // AppStateModel servicedata;
  // FeedModel? feeddata;
  ServicesWidget({Key? key, this.serviceData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppUtils.go(UserProfileScreen(
        //   userdata: servicedata,
        //   feeddata: feeddata,
        // ));

        Get.to(() => ServicesDetails(
              servicedetails: serviceData,
            ));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppPallet.whiteBackground,
          borderRadius: BorderRadius.circular(1.w),
          boxShadow: [
            BoxShadow(
              color: AppPallet.greyTextColor,
              offset: Offset(0, 2.w),
              blurRadius: 4.w,
              spreadRadius: -2.w,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 14.h,
              decoration: BoxDecoration(
                color: AppPallet.greyBackgroundColor,
                image: DecorationImage(
                  image: NetworkImage(
                    cleanUrl(serviceData['service_image']),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          color: AppPallet.lightGreyColor,
                          borderRadius: BorderRadius.circular(3.w),
                          image: DecorationImage(
                            image: NetworkImage(cleanUrl(serviceData['business_image'])),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${serviceData['service_name']}',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.3.h)),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 9.sp,
                                  color: AppPallet.textColor,
                                ),
                                Text(
                                  '${serviceData['country']}',
                                  style: TextStyle(
                                    color: AppPallet.lightTextColor,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Padding(padding: EdgeInsets.only(top: 0.5.h)),

                  // Row(
                  //   children: [
                  //     Icon(
                  //       Icons.star,
                  //       color: AppPallet.textColor,
                  //       size: 12.sp,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       color: AppPallet.textColor,
                  //       size: 12.sp,
                  //     ),
                  //     Icon(
                  //       Icons.star,
                  //       color: AppPallet.textColor,
                  //       size: 12.sp,
                  //     ),
                  //     Icon(
                  //       Icons.star_half_sharp,
                  //       color: AppPallet.textColor,
                  //       size: 12.sp,
                  //     ),
                  //     // Icon(
                  //     //   Icons.star_outline,
                  //     //   color: AppPallet.textColor,
                  //     //   size: 12.sp,
                  //     // ),
                  //     // const Spacer(),
                  //     // Container(
                  //     //   height: 2.6.h,
                  //     //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                  //     //   alignment: Alignment.center,
                  //     //   decoration: BoxDecoration(
                  //     //     color: AppPallet.textColor,
                  //     //     borderRadius: BorderRadius.circular(1.3.h),
                  //     //   ),
                  //     //   child: Text(
                  //     //     'Follow',
                  //     //     style: TextStyle(
                  //     //       color: AppPallet.whiteTextColor,
                  //     //       fontSize: 8.sp,
                  //     //       fontWeight: FontWeight.w400,
                  //     //       fontStyle: FontStyle.italic,
                  //     //     ),
                  //     //   ),
                  //     // )
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

mixin servicedata {}
