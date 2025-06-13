// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/models/FeedModel.dart';
import 'package:pent_space/models/app_state_model.dart';
import 'package:pent_space/screens/explore/answers/answers_widget.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_widget.dart';
import 'package:pent_space/screens/home/widgets/feeds_widget.dart';
import 'package:pent_space/screens/messages/chat_screen.dart';
import 'package:pent_space/screens/profile/profile_menu/profile_menu_screen.dart';
import 'package:pent_space/screens/profile/profile_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../models/EnquiryModel.dart';
import 'package:pent_space/utils/helpers.dart';
class UserProfileScreen extends ConsumerWidget {
  AppStateModel userdata;
  FeedModel? feeddata;
  UserProfileScreen({Key? key, required this.userdata, this.feeddata})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileChangeProfider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppPallet.textColor,
            width: double.infinity,
            child: SafeArea(
              bottom: false,
              child: StreamBuilder<DocumentSnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      // feeddata?.user.userId ?? userdata.userId
                      .doc(feeddata?.user.userId ?? userdata.userId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    var documentData = snapshot.data?.data();
                    AppStateModel newdata = AppStateModel.fromJson(
                        snapshot.data?.data() as Map<String, dynamic>);
                    print(newdata.friendRequests);

                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              vertical: 2.4.h, horizontal: 4.8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  AppUtils.goBack();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 2.4.w),
                              Text(
                                'Personal Profile',
                                style: TextStyle(
                                  color: AppPallet.whiteTextColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  AppUtils.go(const ProfileMenuScreen());
                                },
                                child: Icon(
                                  Icons.menu,
                                  size: 17.sp,
                                  color: AppPallet.whiteTextColor,
                                ),
                              )
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 24.w,
                                          height: 24.w,
                                          decoration: BoxDecoration(
                                            color:
                                                AppPallet.greyBackgroundColor,
                                            border: Border.all(
                                              width: 0.2.w,
                                              color: AppPallet.greyTextColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(3.w),
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
                                                cleanUrl(userdata.image == ""
                                                    ? '$globalimage'
                                                    : userdata.image),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 2.w)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${userdata.firstName.isEmpty ? userdata.brandName : userdata.firstName} ${userdata.lastName}',
                                              style: TextStyle(
                                                color: AppPallet.textColor,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 2.w),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${newdata.friendRequests.length} Connects',
                                                  style: TextStyle(
                                                    color: AppPallet.textColor,
                                                    fontSize: 9.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 2.w)),
                                                newdata.userId ==
                                                        globalUserData.userId
                                                    ? Container()
                                                    : GestureDetector(
                                                        onTap: () {
                                                          // print(
                                                          //   feeddata!.user,
                                                          // );
                                                          AppUtils.go(
                                                              ChatScreen(
                                                            reciveruser:
                                                                userdata,
                                                          ));
                                                        },
                                                        child: Container(
                                                          height: 5.7.w,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 1.w,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.2.w,
                                                                color: AppPallet
                                                                    .blackTextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1.w),
                                                          ),
                                                          child: Icon(
                                                            Icons.mail,
                                                            color: AppPallet
                                                                .blackTextColor,
                                                            size: 14.sp,
                                                          ),
                                                        ),
                                                      ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 2.w)),

                                                newdata.userId ==
                                                        globalUserData.userId
                                                    ? Container()
                                                    : GestureDetector(
                                                        onTap: () async {
                                                          if (!newdata
                                                              .friendRequests
                                                              .contains(
                                                                  globalUserData
                                                                      .userId)) {
                                                            print(
                                                                "Sending friend request...");
                                                            newdata
                                                                .friendRequests
                                                                .add(globalUserData
                                                                    .userId);
                                                            notifier
                                                                .sendFriendRequest(
                                                                    newdata
                                                                        .userId,
                                                                    newdata
                                                                        .toJson());
                                                          } else if (newdata
                                                              .friendRequests
                                                              .contains(
                                                                  globalUserData
                                                                      .userId)) {
                                                            print(
                                                                "Canceling friend request...");
                                                            newdata
                                                                .friendRequests
                                                                .remove(
                                                                    globalUserData
                                                                        .userId);
                                                            notifier
                                                                .sendFriendRequest(
                                                                    newdata
                                                                        .userId,
                                                                    newdata
                                                                        .toJson());
                                                          }

                                                          print(
                                                              "${userdata.userId} ${globalUserData.userId.toString()}");
                                                        },
                                                        child: Container(
                                                          height: 5.7.w,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 1.w,
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.2.w,
                                                                color: AppPallet
                                                                    .blackTextColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1.w),
                                                          ),
                                                          child: Text(
                                                            newdata.friendRequests
                                                                    .contains(
                                                                        globalUserData
                                                                            .userId)
                                                                ? "Conected"
                                                                : 'Connect',
                                                            // "",
                                                            style: TextStyle(
                                                              color: AppPallet
                                                                  .textColor,
                                                              fontSize: 9.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                // GestureDetector(
                                                //   onTap: () {
                                                //     // Implement approved logic here
                                                //     print(
                                                //         "Friend request approved for user ${newdata.userId}");
                                                //   },
                                                //   child: Container(
                                                //     height: 5.7.w,
                                                //     padding:
                                                //         EdgeInsets.symmetric(
                                                //       horizontal: 1.w,
                                                //     ),
                                                //     margin: EdgeInsets.only(
                                                //         left: 1.w),
                                                //     alignment: Alignment.center,
                                                //     decoration: BoxDecoration(
                                                //       border: Border.all(
                                                //           width: 0.2.w,
                                                //           color: AppPallet
                                                //               .blackTextColor),
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //               1.w),
                                                //     ),
                                                //     child: Text(
                                                //       "Approved",
                                                //       style: TextStyle(
                                                //         color:
                                                //             AppPallet.textColor,
                                                //         fontSize: 9.sp,
                                                //         fontWeight:
                                                //             FontWeight.w500,
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                // GestureDetector(
                                                //   onTap: () {
                                                //     // Implement cancel logic here
                                                //     print(
                                                //         "Friend request canceled for user ${newdata.userId}");
                                                //     globalUserData
                                                //         .friendRequests
                                                //         .remove(newdata.userId);
                                                //     notifier.sendFriendRequest(
                                                //         globalUserData.userId,
                                                //         globalUserData
                                                //             .toJson());
                                                //     // Add any additional logic needed
                                                //   },
                                                //   child: Container(
                                                //     height: 5.7.w,
                                                //     padding:
                                                //         EdgeInsets.symmetric(
                                                //       horizontal: 1.w,
                                                //     ),
                                                //     margin: EdgeInsets.only(
                                                //         left: 1.w),
                                                //     alignment: Alignment.center,
                                                //     decoration: BoxDecoration(
                                                //       border: Border.all(
                                                //           width: 0.2.w,
                                                //           color: AppPallet
                                                //               .blackTextColor),
                                                //       borderRadius:
                                                //           BorderRadius.circular(
                                                //               1.w),
                                                //     ),
                                                //     child: Text(
                                                //       "Cancel",
                                                //       style: TextStyle(
                                                //         color:
                                                //             AppPallet.textColor,
                                                //         fontSize: 9.sp,
                                                //         fontWeight:
                                                //             FontWeight.w500,
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
                              ))
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.5.w),
                  child: Column(
                    children: [
                      // Text(
                      //   'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna',
                      //   style: TextStyle(
                      //     color: AppPallet.textColor,
                      //     fontSize: 10.sp,
                      //     fontWeight: FontWeight.w300,
                      //   ),
                      // ),
                      Padding(padding: EdgeInsets.only(top: 1.h)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              WebsafeSvg.asset(dateOfBirthVector, width: 4.w),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date of Birth',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.1.w)),
                                  Text(
                                    '${userdata.dateOfBirth}',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 29.w,
                            child: Row(
                              children: [
                                WebsafeSvg.asset(profileMaritalStatusVector,
                                    width: 4.w),
                                Padding(padding: EdgeInsets.only(right: 2.w)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Marital Staus',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 0.1.w)),
                                    Text(
                                      '${userdata.maritalStatus}',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 1.5.h)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              WebsafeSvg.asset(profileGenderVector, width: 4.w),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gender',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.1.w)),
                                  Text(
                                    '${userdata.gender}',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 29.w,
                            child: Row(
                              children: [
                                WebsafeSvg.asset(profileProfessionVector,
                                    width: 4.w),
                                Padding(padding: EdgeInsets.only(right: 2.w)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Profession',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 0.1.w)),
                                    Text(
                                      '${userdata.profession}',
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 1.5.h)),
                      Row(
                        children: [
                          WebsafeSvg.asset(profileSchoolVector, width: 4.w),
                          Padding(padding: EdgeInsets.only(right: 2.w)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'School Attended',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 0.1.w)),
                              Text(
                                '${userdata.schoolAttended}',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 1.5.h)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          WebsafeSvg.asset(profilePhoneVector, width: 3.w),
                          Padding(padding: EdgeInsets.only(right: 2.w)),
                          Text(
                            '+ ${userdata.phone}',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 2.w)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: WebsafeSvg.asset(
                                profileVerifiedVector,
                                width: 4.5.w,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 2.h)),

                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 5.5.w),
                //   child: Container(
                //     width: double.infinity,
                //     height: 4.5.h,
                //     padding:
                //         EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.w),
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFCFD3D9),
                //       borderRadius: BorderRadius.circular(1.w),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         GestureDetector(
                //           onTap: () {
                //             notifier.setCurrentTab('feeds');
                //           },
                //           child: Container(
                //             height: double.infinity,
                //             alignment: Alignment.center,
                //             padding: EdgeInsets.symmetric(horizontal: 3.w),
                //             decoration: BoxDecoration(
                //               color: notifier.currentTab == 'feeds'
                //                   ? AppPallet.whiteBackground
                //                   : AppPallet.transparent,
                //               borderRadius: BorderRadius.circular(1.w),
                //             ),
                //             child: Text(
                //               'Feeds',
                //               style: TextStyle(
                //                 color: notifier.currentTab == 'feeds'
                //                     ? AppPallet.textColor
                //                     : AppPallet.greyTextColor,
                //                 fontSize: 9.sp,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //           ),
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             notifier.setCurrentTab('interactions');
                //           },
                //           child: Container(
                //             height: double.infinity,
                //             alignment: Alignment.center,
                //             padding: EdgeInsets.symmetric(horizontal: 3.w),
                //             decoration: BoxDecoration(
                //               color: notifier.currentTab == 'interactions'
                //                   ? AppPallet.whiteBackground
                //                   : AppPallet.transparent,
                //               borderRadius: BorderRadius.circular(1.w),
                //             ),
                //             child: Text(
                //               'Interactions',
                //               style: TextStyle(
                //                 color: notifier.currentTab == 'interactions'
                //                     ? AppPallet.textColor
                //                     : AppPallet.greyTextColor,
                //                 fontSize: 9.sp,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //           ),
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             notifier.setCurrentTab('croudFunding');
                //           },
                //           child: Container(
                //             height: double.infinity,
                //             alignment: Alignment.center,
                //             padding: EdgeInsets.symmetric(horizontal: 3.w),
                //             decoration: BoxDecoration(
                //               color: notifier.currentTab == 'croudFunding'
                //                   ? AppPallet.whiteBackground
                //                   : AppPallet.transparent,
                //               borderRadius: BorderRadius.circular(1.w),
                //             ),
                //             child: Text(
                //               'Crowdfunding',
                //               style: TextStyle(
                //                 color: notifier.currentTab == 'croudFunding'
                //                     ? AppPallet.textColor
                //                     : AppPallet.greyTextColor,
                //                 fontSize: 9.sp,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Padding(padding: EdgeInsets.only(top: 2.h)),
                // const ProfileFeeds(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileFeeds extends ConsumerWidget {
  const ProfileFeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileChangeProfider);

    if (notifier.currentTab == "feeds") {
      return Column(
        children: [
          ...[1, 2, 3, 4, 5, 6].map((item) {
            return FeedsWidget();
          }).toList(),
        ],
      );
    } else if (notifier.currentTab == "croudFunding") {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.8.w),
        child: Column(
          children: [
            ...[1, 2, 3, 4, 5, 6].map((item) {
              return CrowdFundingWidget(
                data: {
                  "title": "Bone Fracture Surgery",
                  "description": "1000",
                  "amountContributed": "1000",
                  "amountExpected": "2000",
                  "endDate": "20 Oct",
                  "account": {"fullName": "John"}
                },
              );
            }).toList(),
          ],
        ),
      );
    } else {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('enquiries').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final questions = snapshot.data?.docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return EnquiryModel.fromJson(data);
              }).toList() ??
              [];

          return Column(
            children: questions.map((question) {
              return QuestionWidget();
            }).toList(),
          );
        },
      );
    }
  }
}
