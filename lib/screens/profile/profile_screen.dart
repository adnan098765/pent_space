// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/models/FeedModel.dart';
import 'package:pent_space/screens/explore/answers/answers_widget.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_widget.dart';
import 'package:pent_space/screens/home/widgets/feeds_widget.dart';
import 'package:pent_space/screens/profile/profile_notifier.dart';
import 'package:pent_space/view_models/edit_profile_view_model/edit_profile_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../models/EnquiryModel.dart';
import '../../models/app_state_model.dart';
import '../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import '../../view_models/controller/login/login_view_model.dart';
import '../../view_models/getallfeeds/get_allfeeds_view_model.dart';
import '../home/create_crowd_fund/create_crowd_fund_controller.dart';
import '../home/create_enquiry/create_enquirt_controller.dart';
import '../onboarding/onboarding_screen.dart';
import 'edit_profile_screen.dart';
import 'package:pent_space/utils/helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String currentTab = 'feeds';
  final getUserData = Get.put(GetUserDataController());
  final allfeedController = Get.put(AllFeedsController());
  final loginVM = Get.put(LoginViewModel());
  final editprofileVM = Get.put(EditProfileController());
  final crowdfundingVM = Get.put((CrowdFundingViewModel()));

  final questionVM = Get.put(PostEnquiryViewModel());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      allfeedController.getMyFeeds();
    });

    super.initState();
  }

  void _showDeleteDialog(BuildContext context) {
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
                loginVM.DeleteAccount(); // Dismiss the dialog
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppPallet.textColor,
          width: double.infinity,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 4.8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('authtoken');
                          // await FirebaseAuth.instance.signOut();

                          // // Clear globalUserData

                          // globalUserData.clearUserData();
                          AppUtils.go(const OnBoardingScreen());
                          loginVM.LogOut();

                          // Add your logout logic here
                          // For example, show a confirmation dialog and log the user out
                        },
                        child: Icon(
                          Icons.exit_to_app,
                          size: 17.sp,
                          color: AppPallet.whiteTextColor,
                        ),
                      ),
                      Text(
                        'Personal Profile',
                        style: TextStyle(
                          color: AppPallet.whiteTextColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Container(),
                      InkWell(
                        onTap: () {
                          _showDeleteDialog(context);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
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
                                          cleanUrl('${getUserData.userdata.data?.profilePicture}'),
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
                                        '${getUserData.userdata.data?.userName}',
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
                                          // Text(
                                          //   '1,342 Connects',
                                          //   style: TextStyle(
                                          //     color: AppPallet.textColor,
                                          //     fontSize: 9.sp,
                                          //     fontWeight: FontWeight.w500,
                                          //   ),
                                          // ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 30.w)),
                                          GestureDetector(
                                            onTap: () {
                                              AppUtils.go(EditProfileScreen());
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
                                              child: Text(
                                                'Edit Profile',
                                                style: TextStyle(
                                                  color: AppPallet.textColor,
                                                  fontSize: 9.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                Text(
                                  getUserData.userdata.data!.email.toString(),
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
                              Icon(
                                Icons.date_range,
                                color: AppPallet.blackTextColor,
                                size: 14.sp,
                              ),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DOB',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.1.w)),
                                  Text(
                                    getUserData.userdata.data!.dateOfBirth?.split('T')[0]??"N/A",
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
                                  'Country',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 0.1.w)),
                                Text(
                                  getUserData.userdata.data!.country.toString(),
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
                                  Text(
                                    getUserData.userdata.data!.phone.toString(),
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
                            Icon(
                              Icons.map_outlined,
                              color: AppPallet.blackTextColor,
                              size: 14.sp,
                            ),
                            Padding(padding: EdgeInsets.only(right: 2.w)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'State',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 0.1.w)),
                                Text(
                                  (getUserData.userdata.data!.address!.split('/').length > 1)
                                      ? getUserData.userdata.data!.address!.split('/')[1]
                                      : 'N/A',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 29.w,
                          child: Row(
                            children: [
                              Icon(
                                Icons.pin_drop_rounded,
                                color: AppPallet.blackTextColor,
                                size: 14.sp,
                              ),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'City',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.1.w)),
                                  Text(
                                    (getUserData.userdata.data!.address!.split('/').length > 2)
                                        ? getUserData.userdata.data!.address!.split('/')[2]
                                        : 'N/A',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
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
                        Icon(
                          Icons.maps_home_work_sharp,
                          color: AppPallet.blackTextColor,
                          size: 14.sp,
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Street',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 0.1.w)),
                            Text(
                              (getUserData.userdata.data!.address!.split('/').length > 0)
                                  ? getUserData.userdata.data!.address!.split('/')[0]
                                  : 'N/A',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 2.h)),
              Container(
                height: 5.h,
                padding: EdgeInsets.symmetric(horizontal: 5.5.w),
                alignment: Alignment.center,
                color: AppPallet.greyBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            currentTab = 'feeds';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 2.w,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: currentTab == 'feeds'
                                ? AppPallet.textColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(1.2.w),
                          ),
                          child: Text(
                            'Feeds',
                            style: TextStyle(
                              color: currentTab == 'feeds'
                                  ? AppPallet.whiteTextColor
                                  : AppPallet.textColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 1.w)),
                      GestureDetector(
                        onTap: () {
                          questionVM.getMyEnquiries();
                          setState(() {
                            currentTab = 'questions';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 2.w,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: currentTab == 'questions'
                                ? AppPallet.textColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(1.2.w),
                          ),
                          child: Text(
                            'Questions',
                            style: TextStyle(
                              color: currentTab == 'questions'
                                  ? AppPallet.whiteTextColor
                                  : AppPallet.textColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.only(left: 1.w)),
                      // GestureDetector(
                      //   onTap: () {
                      //     crowdfundingVM.getMyCrowdFundings();
                      //     setState(() {
                      //       currentTab = 'crowdfunding';
                      //     });
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(
                      //       vertical: 1.h,
                      //       horizontal: 2.w,
                      //     ),
                      //     alignment: Alignment.center,
                      //     decoration: BoxDecoration(
                      //       color: currentTab == 'crowdfunding'
                      //           ? AppPallet.textColor
                      //           : Colors.transparent,
                      //       borderRadius: BorderRadius.circular(1.2.w),
                      //     ),
                      //     child: Text(
                      //       'Crowdfunding',
                      //       style: TextStyle(
                      //         color: currentTab == 'crowdfunding'
                      //             ? AppPallet.whiteTextColor
                      //             : AppPallet.textColor,
                      //         fontSize: 10.sp,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 2.h)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.5.w),
                child: Column(
                  children: [
                    Visibility(
                      visible: currentTab == 'feeds',
                      child: Obx(
                        () => allfeedController.loading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Column(
                                children: [
                                  ListView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                        allfeedController.MyFeeds.value.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FeedsWidget(
                                          AllFeeds:
                                              allfeedController.MyFeeds[index],
                                        ),
                                      );
                                    }),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  )
                                ],
                              ),
                      ),
                    ),
                    Visibility(
                      visible: currentTab == 'questions',
                      child: Column(
                        children: [
                          Obx(
                            () => questionVM.loading.value
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: questionVM.MyQuestions.length,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: QuestionWidget(
                                            questions:
                                                questionVM.MyQuestions[index],
                                          ));
                                    }),
                                  ),
                          ),
                          SizedBox(
                            height: 60,
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: currentTab == 'crowdfunding',
                      child: Obx(
                        () => crowdfundingVM.loading.value
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:
                                    crowdfundingVM.myCrwodFundings.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CrowdFundingWidget(
                                        data: crowdfundingVM
                                            .myCrwodFundings[index],
                                      ));
                                }),
                              ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileFeeds extends ConsumerWidget {
  const ProfileFeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final notifier = ref.watch(createPostChangeProvider);
    final notifiers = ref.watch(profileChangeProfider);

    if (notifiers.currentTab == "feeds") {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('feeds')
            .where("user.id", isEqualTo: globalUserData.userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final questions = snapshot.data?.docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return FeedModel.fromJson(data);
              }).toList() ??
              [];

          return Column(
            children: questions.map((question) {
              return FeedsWidget();
              // return QuestionWidget(question: question);
            }).toList(),
          );
        },
      );
      // return Column(
      //   children: [
      //     ...notifier.feedList.map((item) {
      //       return FeedsWidget(feed: item);
      //     }).toList(),
      //   ],
      // );
    } else if (notifiers.currentTab == "croudFunding") {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.8.w),
        child: Column(
          children: [
            ...notifiers.crowdFundList.map((item) {
              return CrowdFundingWidget(data: item);
            }).toList(),
            Text("data")
          ],
        ),
      );
    } else {
      // return Container(
      //   color: Colors.red,
      //   height: 100,
      //   width: 100,
      // );
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('enquiries')
            .where("uid", isEqualTo: globalUserData.userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
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
              // return QuestionWidget(question: question);
            }).toList(),
          );
        },
      );

      // return Column(
      //   children: [
      //     ...[1, 2, 3, 4, 5, 6].map((item) {
      //       return const AnswersWidget();
      //     }).toList(),
      //   ],
      // );
    }
  }
}
