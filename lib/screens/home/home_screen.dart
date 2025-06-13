// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/view_models/notifications_view_model/notifications_view_model.dart';
import 'package:sizer/sizer.dart';
import '../../core/const/colors.dart';
import '../../core/utils/app_utils.dart';
import '../../view_models/getallfeeds/get_allfeeds_view_model.dart';
import '../../view_models/toogle_feeds_view_model/toogle_feeds.dart';
import '../auth/signup/signup_screen.dart';
import '../explore/explore_screen.dart';
import '../messages/messages_screen.dart';
import '../profile/profile_screen.dart';
import 'home_notifier.dart';
import 'widgets/feeds_widget.dart';
import 'widgets/footer_widget.dart';
import 'widgets/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final feedController = Get.put(FeedController());
  final allfeedController = Get.put(AllFeedsController());
  final homecontroller = Get.put(HomeController());
  final notificationVM = Get.put(NotificationViewModel());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      allfeedController.getAllFeeds();
    });

    super.initState();
  }

  Future<void> _refreshFeeds() async {
    await allfeedController.getAllFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: AppPallet.lightBackgroundColor,
        body: Obx(
          () => Stack(
            children: [
              homecontroller.currentScreen == "explore"
                  ? ExploreScreen()
                  : homecontroller.currentScreen == "messages"
                      ? const MessagesScreen()
                      : homecontroller.currentScreen == "profile"
                          ? ProfileScreen()
                          : homecontroller.currentScreen == "home"
                              ? Column(
                                  children: [
                                    Container(
                                      color: AppPallet.textColor,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 2.5.h, horizontal: 4.8.w),
                                      child: SafeArea(
                                        bottom: false,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     // AppUtils.go(
                                            //     //   const HealthManagerScreen(),
                                            //     // );
                                            //   },
                                            //   child: WebsafeSvg.asset(
                                            //     healthMenuIcon,
                                            //     color: AppPallet.whiteTextColor,
                                            //     width: 6.w,
                                            //   ),
                                            // ),
                                            InkWell(
                                              onTap: () {
                                                Get.offAll(
                                                    () => SignupScreen());
                                              },
                                              child: Text(
                                                'PentSpace',
                                                style: TextStyle(
                                                  color:
                                                      AppPallet.whiteTextColor,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),

                                            Obx(
                                              () => GestureDetector(
                                                onTap: () {
                                                  notificationVM
                                                      .messageCount.value = 0;
                                                  AppUtils.go(
                                                    const NotificationsScreen(),
                                                  );
                                                },
                                                child: SizedBox(
                                                  height: 3.h,
                                                  width: 7.w,
                                                  child: Stack(
                                                    children: [
                                                      Positioned.fill(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Icon(
                                                            Icons.notifications,
                                                            color: AppPallet
                                                                .whiteTextColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0.w,
                                                        right: 0.5.w,
                                                        child: Container(
                                                          width: 2.8.w,
                                                          height: 2.8.w,
                                                          child: Center(
                                                              child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0.1),
                                                            child: Text(
                                                              notificationVM
                                                                  .messageCount
                                                                  .value
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 8,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppPallet
                                                                .redTextColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        1.25.w),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 2.h)),
                                    Container(
                                      width: 80.w,
                                      height: 6.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.2.w,
                                          color: AppPallet.textColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(1.w),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                // notifier.toggleFeeds(true);
                                                feedController
                                                    .toggleFeeds(true);
                                              },
                                              child: Obx(
                                                () => Container(
                                                  color: feedController
                                                          .showFeeds.value
                                                      ? AppPallet.textColor
                                                      : AppPallet.transparent,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Feeds',
                                                    style: TextStyle(
                                                      color: feedController
                                                              .showFeeds.value
                                                          ? AppPallet
                                                              .whiteTextColor
                                                          : AppPallet.textColor,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                feedController
                                                    .toggleFeeds(false);
                                              },
                                              child: Obx(
                                                () => Container(
                                                  color: feedController
                                                          .showFeeds.value
                                                      ? AppPallet.transparent
                                                      : AppPallet.textColor,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Services',
                                                    style: TextStyle(
                                                      color: !feedController
                                                              .showFeeds.value
                                                          ? AppPallet
                                                              .whiteTextColor
                                                          : AppPallet.textColor,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 2.h)),
                                    if (feedController.showFeeds.value ==
                                        true) ...[
                                      Expanded(
                                        child: Obx(
                                          () => allfeedController.loading.value
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : RefreshIndicator(
                                                  onRefresh: _refreshFeeds,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        ListView.builder(
                                                            physics:
                                                                ScrollPhysics(),
                                                            itemCount:
                                                                allfeedController
                                                                    .AllFeeds
                                                                    .length,
                                                            shrinkWrap: true,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        15),
                                                                child:
                                                                    FeedsWidget(
                                                                  AllFeeds:
                                                                      allfeedController
                                                                              .AllFeeds[
                                                                          index],
                                                                ),
                                                              );
                                                            }),
                                                        SizedBox(
                                                          height: 100,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                        ),
                                      )
                                    ]
                                    // else ...[
                                    //   Expanded(
                                    //       child: ListView.builder(
                                    //           itemCount: 10,
                                    //           itemBuilder: (context, index) {
                                    //             return Padding(
                                    //               padding:
                                    //                   const EdgeInsets.all(8.0),
                                    //               child: Container(
                                    //                 height: 100,
                                    //                 width: 100,
                                    //                 color: Colors.blue,
                                    //               ),
                                    //             );
                                    //           }))
                                    // ]
                                  ],
                                )
                              : Container(),
              const Positioned(bottom: 0, left: 0, child: FooterWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
