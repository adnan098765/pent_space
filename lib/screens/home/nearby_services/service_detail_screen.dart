// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/utils/helpers.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import '../../../view_models/getallfeeds/get_allfeeds_view_model.dart';
import '../../messages/chat_screen.dart';

class ServicesDetails extends StatefulWidget {
  final servicedetails;
  const ServicesDetails({Key? key, this.servicedetails}) : super(key: key);

  @override
  _ServicesDetailsState createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  String currentTab = 'feeds';
  final getUserData = Get.put(GetUserDataController());
  final allfeedController = Get.put(AllFeedsController());

  @override
  void initState() {
    allfeedController.getMyFeeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppPallet.textColor,
          width: double.infinity,
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 353,
                  // alignment: Alignment.center,
                  // padding:
                  //     EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: () {
                            AppUtils.goBack();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Service Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppPallet.whiteTextColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
                SizedBox(
                  height: 26.w,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          children: [
                            Container(
                              height: 10.w,
                              color: AppPallet.textColor,
                              width: double.infinity,
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                color: AppPallet.whiteBackground,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.8.w,
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // if (globalUserData.image != "")
                                  //   Container(
                                  //     width: 24.w,
                                  //     height: 24.w,
                                  //     decoration: BoxDecoration(
                                  //       color: AppPallet.greyBackgroundColor,
                                  //       border: Border.all(
                                  //         width: 0.2.w,
                                  //         color: AppPallet.greyTextColor,
                                  //       ),
                                  //       borderRadius:
                                  //           BorderRadius.circular(3.w),
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //           color: const Color(0xFFcccccc),
                                  //           offset: Offset(0.w, 3.w),
                                  //           spreadRadius: -5.w,
                                  //           blurRadius: 4.w,
                                  //         )
                                  //       ],
                                  //       image: DecorationImage(
                                  //         image: NetworkImage(
                                  //           globalUserData.image,
                                  //         ),
                                  //         fit: BoxFit.cover,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // if (globalUserData.image == "")
                                  Container(
                                    width: 24.w,
                                    height: 24.w,
                                    decoration: BoxDecoration(
                                      color: AppPallet.greyBackgroundColor,
                                      border: Border.all(
                                        width: 0.2.w,
                                        color: AppPallet.greyTextColor,
                                      ),
                                      borderRadius: BorderRadius.circular(3.w),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFFcccccc),
                                          offset: Offset(0.w, 3.w),
                                          spreadRadius: -5.w,
                                          blurRadius: 4.w,
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          cleanUrl('${widget.servicedetails['business_image']}'),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 2.w)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${widget.servicedetails['service_name']}',
                                        style: TextStyle(
                                          color: AppPallet.textColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2.w),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'chat',
                                            style: TextStyle(
                                              color: AppPallet.textColor,
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 2.w)),
                                          InkWell(
                                            onTap: () {
                                              Get.to(() => ChatScreen(
                                                    reciverid:
                                                        widget.servicedetails[
                                                            'business_id'],
                                                    recivername:
                                                        widget.servicedetails[
                                                            'business_name'],
                                                    reciverprofile:
                                                        widget.servicedetails[
                                                            'business_image'],
                                                  isblocked: 0,
                                                  iamblocked: 0
                                                  ));
                                            },
                                            child: Container(
                                              height: 5.7.w,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 1.w,
                                              ),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 0.2.w,
                                                    color: AppPallet
                                                        .blackTextColor),
                                                borderRadius:
                                                    BorderRadius.circular(1.w),
                                              ),
                                              child: Icon(
                                                Icons.mail,
                                                color: AppPallet.blackTextColor,
                                                size: 14.sp,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 2.w)),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     // AppUtils.go(
                                          //     //     EditProfileScreen());
                                          //   },
                                          //   child: Container(
                                          //     height: 5.7.w,
                                          //     padding: EdgeInsets.symmetric(
                                          //       horizontal: 1.w,
                                          //     ),
                                          //     alignment: Alignment.center,
                                          //     decoration: BoxDecoration(
                                          //       border: Border.all(
                                          //           width: 0.2.w,
                                          //           color: AppPallet
                                          //               .blackTextColor),
                                          //       borderRadius:
                                          //           BorderRadius.circular(1.w),
                                          //     ),
                                          //     child: Text(
                                          //       'Connect',
                                          //       style: TextStyle(
                                          //         color: AppPallet.textColor,
                                          //         fontSize: 9.sp,
                                          //         fontWeight: FontWeight.w500,
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.w)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 1.5.h)),
                    Text(
                      '${widget.servicedetails['description']}',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        WebsafeSvg.asset(profilePhoneVector, width: 4.w),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.1.w)),
                            Container(
                              width: 80.w,
                              child: Text(
                                '${widget.servicedetails['phone']}',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Divider(),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: AppPallet.blackTextColor,
                          size: 14.sp,
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.1.w)),
                            Container(
                              width: 80.w,
                              child: Text(
                                '${widget.servicedetails['email']}',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Divider(),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Row(
                      children: [
                        WebsafeSvg.asset(profileGenderVector, width: 4.w),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.1.w)),
                            Container(
                              width: 80.w,
                              child: Text(
                                '${widget.servicedetails['country']}',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Divider(),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: AppPallet.blackTextColor,
                          size: 14.sp,
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.1.w)),
                            Container(
                              width: 80.w,
                              child: Text(
                                'Yesy',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 2.h)),
              // Container(
              //   height: 5.h,
              //   padding: EdgeInsets.symmetric(horizontal: 5.5.w),
              //   alignment: Alignment.center,
              //   color: AppPallet.greyBackgroundColor,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 50),
              //     child: ListView(
              //       scrollDirection: Axis.horizontal,
              //       children: [
              //         GestureDetector(
              //           onTap: () {
              //             setState(() {
              //               currentTab = 'feeds';
              //             });
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //               vertical: 1.h,
              //               horizontal: 2.w,
              //             ),
              //             alignment: Alignment.center,
              //             decoration: BoxDecoration(
              //               color: currentTab == 'feeds'
              //                   ? AppPallet.textColor
              //                   : Colors.transparent,
              //               borderRadius: BorderRadius.circular(1.2.w),
              //             ),
              //             child: Text(
              //               'Feeds',
              //               style: TextStyle(
              //                 color: currentTab == 'feeds'
              //                     ? AppPallet.whiteTextColor
              //                     : AppPallet.textColor,
              //                 fontSize: 10.sp,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(padding: EdgeInsets.only(left: 1.w)),
              //         GestureDetector(
              //           onTap: () {
              //             setState(() {
              //               currentTab = 'questions';
              //             });
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //               vertical: 1.h,
              //               horizontal: 2.w,
              //             ),
              //             alignment: Alignment.center,
              //             decoration: BoxDecoration(
              //               color: currentTab == 'questions'
              //                   ? AppPallet.textColor
              //                   : Colors.transparent,
              //               borderRadius: BorderRadius.circular(1.2.w),
              //             ),
              //             child: Text(
              //               'Questions',
              //               style: TextStyle(
              //                 color: currentTab == 'questions'
              //                     ? AppPallet.whiteTextColor
              //                     : AppPallet.textColor,
              //                 fontSize: 10.sp,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(padding: EdgeInsets.only(left: 1.w)),
              //         GestureDetector(
              //           onTap: () {
              //             setState(() {
              //               currentTab = 'crowdfunding';
              //             });
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //               vertical: 1.h,
              //               horizontal: 2.w,
              //             ),
              //             alignment: Alignment.center,
              //             decoration: BoxDecoration(
              //               color: currentTab == 'crowdfunding'
              //                   ? AppPallet.textColor
              //                   : Colors.transparent,
              //               borderRadius: BorderRadius.circular(1.2.w),
              //             ),
              //             child: Text(
              //               'Crowdfunding',
              //               style: TextStyle(
              //                 color: currentTab == 'crowdfunding'
              //                     ? AppPallet.whiteTextColor
              //                     : AppPallet.textColor,
              //                 fontSize: 10.sp,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(padding: EdgeInsets.only(top: 2.h)),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 5.5.w),
              //   child: Column(
              //     children: [
              //       Visibility(
              //         visible: currentTab == 'feeds',
              //         child: Obx(
              //           () => allfeedController.loading.value
              //               ? Center(
              //                   child: CircularProgressIndicator(),
              //                 )
              //               : Column(
              //                   children: [
              //                     ListView.builder(
              //                       physics: ScrollPhysics(),
              //                       shrinkWrap: true,
              //                       itemCount:
              //                           allfeedController.MyFeeds.length,
              //                       itemBuilder: ((context, index) {
              //                         return Padding(
              //                           padding: const EdgeInsets.all(8.0),
              //                           child: FeedsWidget(
              //                             AllFeeds: allfeedController
              //                                 .MyFeeds[index],
              //                           ),
              //                         );
              //                       }),
              //                     ),
              //                     SizedBox(
              //                       height: 60,
              //                     )
              //                   ],
              //                 ),
              //         ),
              //       ),
              //       Visibility(
              //         visible: currentTab == 'questions',
              //         child: Column(
              //           children: [
              //             // AnswersWidget(),
              //           ],
              //         ),
              //       ),
              //       Visibility(
              //         visible: currentTab == 'crowdfunding',
              //         child: Column(
              //           children: [
              //             CrowdFundingWidget(),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ],
    );
  }
}
