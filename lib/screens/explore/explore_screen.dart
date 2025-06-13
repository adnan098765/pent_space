// ignore_for_file: unused_local_variable, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/models/app_state_model.dart';
import 'package:pent_space/screens/explore/Search/SearchScreen.dart';
import 'package:pent_space/screens/explore/answers/answers_widget.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowd_funding_widget.dart';
import 'package:pent_space/screens/explore/explore_notifier.dart';
import 'package:pent_space/screens/home/widgets/feeds_widget.dart';
import 'package:pent_space/screens/home/widgets/services_widget.dart';
import 'package:sizer/sizer.dart';
import '../../view_models/getallfeeds/get_allfeeds_view_model.dart';
import '../home/create_crowd_fund/create_crowd_fund_controller.dart';
import '../home/create_enquiry/create_enquirt_controller.dart';

class ExploreScreen extends ConsumerWidget {
  final TextEditingController searchController = TextEditingController();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(exploreChangeProfider);
    return SizedBox(
      child: Column(
        children: [
          Container(
            color: AppPallet.textColor,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.8.w),
            child: SafeArea(
              bottom: false,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        AppUtils.go(Searchscreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.w,
                          horizontal: 4.w,
                        ),
                        // decoration: BoxDecoration(
                        //     color: AppPallet.whiteBackground,
                        //     borderRadius: BorderRadius.circular(1.w)),
                        // child: Row(
                        //   children: [
                        //     Expanded(
                        //       child: TextFormField(
                        //         enabled: false,
                        //         textInputAction:
                        //             TextInputAction.done, // Add this line
                        //         onChanged: (value) {
                        //           AnswerList(
                        //             searchQuery: value,
                        //           );
                        //         },
                        //         controller: searchController,
                        //         onFieldSubmitted: (value) {},
                        //         decoration: InputDecoration(
                        //           contentPadding: EdgeInsets.zero,
                        //           hintText: 'Search for Questions or keywords',
                        //           hintStyle: TextStyle(
                        //             color: AppPallet.greyTextColor,
                        //             fontSize: 10.sp,
                        //             fontWeight: FontWeight.w300,
                        //             fontStyle: FontStyle.italic,
                        //           ),
                        //           border: const OutlineInputBorder(
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           enabledBorder: const OutlineInputBorder(
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           focusedBorder: const OutlineInputBorder(
                        //             borderSide: BorderSide.none,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     Icon(
                        //       Icons.search,
                        //       size: 19.sp,
                        //       color: AppPallet.textColor,
                        //     )
                        //   ],
                        // ),
                      ),
                    ),
                  ),
                  // Padding(padding: EdgeInsets.only(right: 4.w)),
                  // Icon(
                  //   Icons.tune,
                  //   size: 18.sp,
                  //   color: AppPallet.whiteTextColor,
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            notifier.setCurrentTab("answers");
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 0.4.h),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: notifier.currentTab == "answers"
                                      ? AppPallet.redTextColor
                                      : AppPallet.borderInputColor,
                                  width: 0.4.w,
                                ),
                              ),
                            ),
                            child: Text(
                              'Questions',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: notifier.currentTab == "answers"
                                    ? AppPallet.textColor
                                    : AppPallet.borderInputColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     notifier.setCurrentTab("croud_funding");
                      //   },
                      //   child: Container(
                      //     padding: EdgeInsets.only(bottom: 0.4.h),
                      //     decoration: BoxDecoration(
                      //       border: Border(
                      //         bottom: BorderSide(
                      //           color: notifier.currentTab == "croud_funding"
                      //               ? AppPallet.redTextColor
                      //               : AppPallet.borderInputColor,
                      //           width: 0.4.w,
                      //         ),
                      //       ),
                      //     ),
                      //     child: Text(
                      //       ' Crowdfunding ',
                      //       style: TextStyle(
                      //         color: notifier.currentTab == "croud_funding"
                      //             ? AppPallet.textColor
                      //             : AppPallet.borderInputColor,
                      //         fontSize: 11.sp,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       notifier.setCurrentTab("services");
                      //     },
                      //     child: Container(
                      //       padding: EdgeInsets.only(bottom: 0.4.h),
                      //       decoration: BoxDecoration(
                      //         border: Border(
                      //           bottom: BorderSide(
                      //             color: notifier.currentTab == "services"
                      //                 ? AppPallet.redTextColor
                      //                 : AppPallet.borderInputColor,
                      //             width: 0.4.w,
                      //           ),
                      //         ),
                      //       ),
                      //       child: Text(
                      //         ' Services ',
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           color: notifier.currentTab == "services"
                      //               ? AppPallet.textColor
                      //               : AppPallet.borderInputColor,
                      //           fontSize: 11.sp,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            notifier.setCurrentTab("feeds");
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 0.4.h),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: notifier.currentTab == "feeds"
                                      ? AppPallet.redTextColor
                                      : AppPallet.borderInputColor,
                                  width: 0.4.w,
                                ),
                              ),
                            ),
                            child: Text(
                              'Feeds',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: notifier.currentTab == "feeds"
                                    ? AppPallet.textColor
                                    : AppPallet.borderInputColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: notifier.currentTab == "croud_funding"
                        ? const CrowdFundingList()
                        : notifier.currentTab == "services"
                            ? const SerivicesList()
                            : notifier.currentTab == "feeds"
                                ? const FeedsList()
                                : AnswerList(
                                    searchQuery: searchController.text,
                                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerList extends StatefulWidget {
  final String? searchQuery;

  const AnswerList({Key? key, this.searchQuery}) : super(key: key);

  @override
  State<AnswerList> createState() => _AnswerListState();
}

class _AnswerListState extends State<AnswerList> {
  final getAllQuestionsVM = Get.put(PostEnquiryViewModel());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllQuestionsVM.getEnquiry();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => getAllQuestionsVM.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: getAllQuestionsVM.AllQuestions.length,
              itemBuilder: (context, index) {
                return QuestionWidget(
                  questions: getAllQuestionsVM.AllQuestions[index],
                );
              }),
    );
  }
}

class CrowdFundingList extends StatefulWidget {
  const CrowdFundingList({Key? key}) : super(key: key);

  @override
  _CrowdFundingListState createState() => _CrowdFundingListState();
}

class _CrowdFundingListState extends State<CrowdFundingList> {
  final crowdfundController = Get.put(CrowdFundingViewModel());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      crowdfundController.getAllCrowdFundings();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 4.8.w, left: 4.8.w, bottom: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Trending Post',
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     Text(
              //       'See all',
              //       style: TextStyle(
              //         color: AppPallet.textColor,
              //         fontSize: 9.sp,
              //         fontWeight: FontWeight.w600,
              //         fontStyle: FontStyle.italic,
              //       ),
              //     ),
              //     Icon(
              //       Icons.chevron_right,
              //       color: AppPallet.textColor,
              //       size: 14.sp,
              //     )
              //   ],
              // ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 1.h)),
        Obx(
          () => crowdfundController.loading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: crowdfundController.AllCrowdFundings.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: CrowdFundingWidget(
                          data: crowdfundController.AllCrowdFundings[index]),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class SerivicesList extends ConsumerWidget {
  const SerivicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(exploreChangeProfider);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(padding: EdgeInsets.only(top: 1.h)),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .where("userBoolean", isEqualTo: false)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              List service = snapshot.data?.docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return AppStateModel.fromJson(data);
                  }).toList() ??
                  [];
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              // print(service[]);
              // return ListView.builder(
              //   itemCount:
              //       service.length,
              //   itemBuilder:
              //       (context, index) {
              //     return Text("data");
              //   },
              // );
              // GridView.count(crossAxisCount: crossAxisCount)
              return GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                crossAxisSpacing: 4.w,
                mainAxisSpacing: 4.w,
                crossAxisCount: 2,
                childAspectRatio: (1 / 1),
                children: [
                  // Text("data")
                  ...service.map((item) {
                    AppStateModel data = item;
                    print(data.brandName);
                    return ServicesWidget();
                  }).toList(),
                ],
              );
            }),
      ],
    );
  }
}

class FeedsList extends StatefulWidget {
  final String? searchQuery;

  const FeedsList({Key? key, this.searchQuery}) : super(key: key);

  @override
  State<FeedsList> createState() => _FeedsListState();
}

class _FeedsListState extends State<FeedsList> {
  final allfeedController = Get.put(AllFeedsController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      allfeedController.getAllFeeds();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => allfeedController.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: ScrollPhysics(),
                      itemCount: allfeedController.AllFeeds.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: FeedsWidget(
                            AllFeeds: allfeedController.AllFeeds[index],
                          ),
                        );
                      }),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
    );
  }
}
