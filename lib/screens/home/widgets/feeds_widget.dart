// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import '../../../view_models/getallfeeds/get_allfeeds_view_model.dart';
import '../../../view_models/likes_view_model/likes_view_model.dart';
import '../create_post/create_post_notifier.dart';
import 'feed_comments_screen.dart';
import 'package:pent_space/utils/helpers.dart';


class FeedsWidget extends StatefulWidget {
  final dynamic AllFeeds;
  // final FeedModel? feed;
  FeedsWidget({
    Key? key,
    this.AllFeeds,
  }) : super(key: key);

  @override
  _FeedsWidgetState createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  int count = 0;
  int likesCount = 0; // State variable for likes count
  bool isLiked = false;


  void handleLike() {
    String feedId = widget.AllFeeds['id'].toString();

    if (isLiked) {
      // If already liked, unlike it
      likesCount--;
      likedvm.favList.remove(feedId);
    } else {
      // If not liked, like it
      likesCount++;
      likedvm.favList.add(feedId);
    }

    // Update the like status
    setState(() {
      isLiked = !isLiked;
    });
  }

  final createPostNotifier = CreatePostNotifier();
  final likedvm = Get.put(LikesViewModel());

  @override
  void initState() {
    super.initState();
    likesCount = int.parse(widget.AllFeeds['total_likes']);
    isLiked = likedvm.favList.contains(widget.AllFeeds['id'].toString());
    print('AllFeeds ${widget.AllFeeds}');
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallet.whiteBackground,
        border: Border(
          top: BorderSide(
            color: AppPallet.lightTextColor,
            width: 0.1.w,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // AppUtils.go(UserProfileScreen(
                    //   feeddata: feed!,
                    //   userdata: feed!.user,
                    // ));
                  },
                  child: Container(
                    width: 9.w,
                    height: 9.w,
                    decoration: BoxDecoration(
                      color: AppPallet.lightGreyColor,
                      borderRadius: BorderRadius.circular(4.w),
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.AllFeeds['profile_picture']!=null?cleanUrl(widget.AllFeeds['profile_picture']):"",

                          // feed!.user.image == ""
                          //   ?
                          // '$globalimage'
                          //: feed!.user.image
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 2.w)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // AppUtils.go(UserProfileScreen(
                          //   feeddata: feed!,
                          //   userdata: feed!.user,
                          // ));
                        },
                        child: Text(
                          widget.AllFeeds['user_name']!=null?widget.AllFeeds['user_name']:"John",
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 0.3.h)),
                      Text(
                        formatTimestamp(
                            DateTime.parse(widget.AllFeeds['createdAt'])),
                        style: TextStyle(
                          color: AppPallet.lightTextColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _openBottomModal(context, widget.AllFeeds);
                  },
                  child: Icon(
                    Icons.more_horiz,
                    size: 11.sp,
                    color: AppPallet.textColor,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.4.w),
            child: Text(
              widget.AllFeeds['about'],
              style: TextStyle(
                color: AppPallet.textColor,
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 1.h)),
          GestureDetector(
            onTap: () {
              // ExtendedImage.network(
              //   feed!.imageUrl,
              //   width: 400,
              //   height: 400,
              //   fit: BoxFit.fill,
              //   cache: true,
              //   border: Border.all(color: Colors.red, width: 1.0),
              //   shape: BoxShape.rectangle,
              //   borderRadius: BorderRadius.all(Radius.circular(30.0)),
              //   //cancelToken: cancellationToken,
              // );
            },
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                color: AppPallet.lightGreyColor,
                image: DecorationImage(
                  image: NetworkImage(
                    cleanUrl(widget.AllFeeds['image']),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 4.w,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      handleLike();
                      //likedvm.addToLike(widget.AllFeeds['id'].toString(), '');
                      likedvm.feedsid.value = int.parse(widget.AllFeeds['id']);
                      likedvm.AddLikeDisLike();
                    },
                    child: likedvm.favList
                            .contains(widget.AllFeeds['id'].toString())
                        ? Icon(
                            Icons.favorite,
                            color: AppPallet.lightRedTextColor,
                            size: 14.sp,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: AppPallet.lightRedTextColor,
                            size: 14.sp,
                          ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 1.w)),
                  Text(
                    '${likesCount}',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 4.w)),
                  GestureDetector(
                    onTap: () {
                      AppUtils.go(FeedCommentsScreen(
                        feedid: widget.AllFeeds['id'],
                      ));
                    },
                    child: Row(
                      children: [
                        WebsafeSvg.asset(
                          messageIconVector,
                          width: 3.8.w,
                          color: AppPallet.textColor,
                        ),
                        Padding(padding: EdgeInsets.only(right: 1.w)),
                        Text(
                          '${widget.AllFeeds['total_comments']}',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openBottomModal(BuildContext context, feedsdata) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return CreateModal(
          feedsdata: feedsdata, // Pass the actual feed here
        );
      },
    );
  }
}

class CreateModal extends StatelessWidget {
  final feedsdata;

  CreateModal({Key? key, required this.feedsdata}) : super(key: key);
  final getUserData = Get.put(GetUserDataController());
  final allfeedController = Get.put(AllFeedsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 18.h,
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
        ],
      ),
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
            Padding(padding: EdgeInsets.only(top: 4.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     // Clipboard.setData(ClipboardData(text: feed!.content));

                //     EasyLoading.showSuccess('Post copied to clipboard');
                //   },
                //   child: Container(
                //     height: 7.6.h,
                //     width: 22.w,
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFF6F6F7),
                //       borderRadius: BorderRadius.circular(2.w),
                //     ),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           Icons.file_copy,
                //           color: AppPallet.textColor,
                //           size: 18.sp,
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 0.8.h)),
                //         Text(
                //           'Copy',
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
                // GestureDetector(
                //   onTap: () {
                //     // Share.share(
                //     //   """${feed!.content.toString()}\n\n${feed!.imageUrl.toString()}""",
                //     //   subject: 'Question Content',
                //     // );
                //   },
                //   child: Container(
                //     height: 7.6.h,
                //     width: 22.w,
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFF6F6F7),
                //       borderRadius: BorderRadius.circular(2.w),
                //     ),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           Icons.share_outlined,
                //           color: AppPallet.textColor,
                //           size: 18.sp,
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 0.8.h)),
                //         Text(
                //           'Share',
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
                // GestureDetector(
                //   onTap: () {
                //     // AppUtils.goReplace(const CreateCrowdFundScreen());
                //   },
                //   child: Container(
                //     height: 7.6.h,
                //     width: 22.w,
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFF6F6F7),
                //       borderRadius: BorderRadius.circular(2.w),
                //     ),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         WebsafeSvg.asset(
                //           answersReportFilledVector,
                //           height: 2.3.h,
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 0.8.h)),
                //         Text(
                //           'Report',
                //           style: TextStyle(
                //             color: const Color(0xFF9A1708),
                //             fontSize: 9.sp,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
            // Padding(padding: EdgeInsets.only(top: 2.h)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     // AppUtils.goReplace(const CreateCrowdFundScreen());
                //   },
                //   child: Container(
                //     height: 7.6.h,
                //     width: 22.w,
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFF6F6F7),
                //       borderRadius: BorderRadius.circular(2.w),
                //     ),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           Icons.hide_image,
                //           color: Colors.black,
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 0.8.h)),
                //         Text(
                //           'Hide this',
                //           style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 9.sp,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // GestureDetector(
                //   onTap: () {
                //     // AppUtils.goReplace(const CreateCrowdFundScreen());
                //   },
                //   child: Container(
                //     height: 7.6.h,
                //     width: 22.w,
                //     decoration: BoxDecoration(
                //       color: const Color(0xFFF6F6F7),
                //       borderRadius: BorderRadius.circular(2.w),
                //     ),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Icon(
                //           Icons.present_to_all,
                //           color: Colors.black,
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 0.8.h)),
                //         Text(
                //           'Promote',
                //           style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 9.sp,
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                if (getUserData.userdata.data!.id ==
                    int.parse(feedsdata['user_id'])) ...[
                  GestureDetector(
                    onTap: () {
                      allfeedController.deleteFeed(feedsdata['id']);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 7.6.h,
                      width: 22.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F7),
                        borderRadius: BorderRadius.circular(2.w),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          Padding(padding: EdgeInsets.only(top: 0.8.h)),
                          Text(
                            'Delete',
                            style: TextStyle(
                              color: const Color(0xFF9A1708),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 1.h)),
          ],
        ),
      ),
    );
  }

}
