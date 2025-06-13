// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../models/FeedModel.dart';
import '../../../view_models/comments_view_model/comments_view_model.dart';
import '../../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import 'package:pent_space/utils/helpers.dart';
class FeedCommentsScreen extends StatefulWidget {
  final feedid;
  final CommentsList;
  FeedCommentsScreen({Key? key, this.feedid, this.CommentsList})
      : super(key: key);

  @override
  _FeedCommentsScreenState createState() => _FeedCommentsScreenState();
}

class _FeedCommentsScreenState extends State<FeedCommentsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final commentscontroller = Get.put(CommentsViewModel());
  final getUserData = Get.put(GetUserDataController());

  @override
  void initState() {
    commentscontroller.feedsid.value = int.parse(widget.feedid);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      commentscontroller.getComments();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        bottom: false,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppUtils.goBack();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppPallet.textColor,
                        size: 13.sp,
                      ),
                    ),
                    Text(
                      'Comments',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _openBottomModal(context);
                      },
                      child: Icon(
                        Icons.more_horiz,
                        color: AppPallet.textColor,
                        size: 12.sp,
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 2.h)),
              Divider(
                height: 0.4.w,
                thickness: 0.4.w,
                color: AppPallet.inputBorderColor,
              ),
              Expanded(
                child: Obx(
                  () => commentscontroller.loading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _QuestionItem(
                              comments:
                                  commentscontroller.postComments['comments'],
                            ),
                          ],
                        ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: AppPallet.whiteBackground,
                  borderRadius: BorderRadius.circular(1.w),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFcccccc),
                      offset: Offset(0.w, -2.w),
                      blurRadius: 3.w,
                      spreadRadius: -2.5.w,
                    )
                  ],
                ),
                child: SafeArea(
                  top: false,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Container(
                          height: 8.w,
                          width: 8.w,
                          decoration: BoxDecoration(
                            color: AppPallet.greyBackgroundColor,
                            borderRadius: BorderRadius.circular(4.w),
                            image: DecorationImage(
                              image: NetworkImage(
                                cleanUrl('${getUserData.userdata.data!.profilePicture}'),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Visibility(
                            visible: commentscontroller.loading.value,
                            child: Container(
                              color: const Color(0x66000000),
                              child: CupertinoActivityIndicator(
                                color: AppPallet.whiteTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.4.w,
                              color: AppPallet.greyBackgroundColor,
                            ),
                            borderRadius: BorderRadius.circular(3.w),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your comment';
                                    }
                                    return null;
                                  },
                                  maxLines: 5,
                                  controller: commentscontroller
                                      .commentController.value,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    fillColor: AppPallet.transparent,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: '',
                                    hintStyle: TextStyle(
                                      color: AppPallet.greyTextColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              commentscontroller.PostComment();
                              // notifier.sendFeedComment(feed!);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.send),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openBottomModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuestionItem extends StatefulWidget {
  final comments;
  _QuestionItem({Key? key, this.comments}) : super(key: key);

  @override
  __QuestionItemState createState() => __QuestionItemState();
}

class __QuestionItemState extends State<_QuestionItem> {
  @override
  void initState() {
    super.initState();
  }

  final getUserData = Get.put(GetUserDataController());
  final commentsvm = Get.put(CommentsViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.comments != null ? widget.comments.length : 0,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 10.w,
                              width: 10.w,
                              decoration: BoxDecoration(
                                color: AppPallet.greyBackgroundColor,
                                borderRadius: BorderRadius.circular(5.w),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    cleanUrl('${widget.comments[index]['profile_picture']}'),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 4.w)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.comments[index]['user_name']}',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 0.3.h)),
                                  Text(
                                    '${widget.comments[index]['createdAt']}',
                                    style: TextStyle(
                                      color: AppPallet.lightTextColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 2.h)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Row(
                            children: [
                              Text(
                                '${widget.comments[index]['comment_text']}',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              if (widget.comments[index]['user_id'] ==
                                  getUserData.userdata.data!.id) ...[
                                InkWell(
                                    onTap: () {
                                      _showDeleteDialog(context,
                                          widget.comments[index]['id']);
                                    },
                                    child: Icon(Icons.delete))
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 2.h)),
                  Divider(
                    height: 0.4.w,
                    thickness: 0.4.w,
                    color: AppPallet.inputBorderColor,
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 1.h)),
                ],
              );
            }));
  }

  void _showDeleteDialog(BuildContext context, feedid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Comment'),
          content: Text('Are you sure you want to delete this comment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                commentsvm.deleteComments(feedid);

                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

class _AnswersWidget extends StatelessWidget {
  final CommentModel? comment;
  _AnswersWidget({Key? key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TEst',
            style: TextStyle(
              color: AppPallet.textColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 0.3.h)),
          Text(
            'Test',
            style: TextStyle(
              color: AppPallet.lightTextColor,
              fontSize: 9.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class AnswersWidget extends StatelessWidget {
  final CommentModel? comment;
  const AnswersWidget({Key? key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.4.w, vertical: 1.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10.w,
                width: 10.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: AppPallet.greyBackgroundColor,
                  image: DecorationImage(
                    image: NetworkImage(
                      cleanUrl('${globalimage}'),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 4.w)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Text',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Text',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 0.5.h)),
                    Row(
                      children: [
                        Text(
                          // '${formatTimestamp(comment!.timestamp)}',
                          'Time',
                          style: TextStyle(
                            color: AppPallet.lightTextColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 8.w)),
                        Text(
                          '2 downvotes',
                          style: TextStyle(
                            color: AppPallet.lightTextColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 2.4.w)),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     WebsafeSvg.asset(answersUpVoteVector, height: 1.8.h),
              //     Padding(padding: EdgeInsets.only(top: 0.5.h)),
              //     WebsafeSvg.asset(answersDownVoteVector, height: 1.8.h),
              //   ],
              // )
            ],
          ),
        ],
      ),
    );
  }
}

_openBottomModal(context) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return const CreateModal();
      });
}

class CreateModal extends StatelessWidget {
  const CreateModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 32.h,
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
                GestureDetector(
                  onTap: () {},
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
                          Icons.file_copy,
                          color: AppPallet.textColor,
                          size: 18.sp,
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.8.h)),
                        Text(
                          'Copy',
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
                  onTap: () {},
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
                          Icons.share_outlined,
                          color: AppPallet.textColor,
                          size: 18.sp,
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.8.h)),
                        Text(
                          'Share',
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
                    // AppUtils.goReplace(const CreateCrowdFundScreen());
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
                        WebsafeSvg.asset(
                          answersReportFilledVector,
                          height: 2.3.h,
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.8.h)),
                        Text(
                          'Report',
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
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F7),
                borderRadius: BorderRadius.circular(2.w),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Text(
                      'Follow Aftermath Therapy',
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Divider(
                    height: 0.2.w,
                    color: AppPallet.lightTextColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Text(
                      'Hide This Post',
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 1.h)),
          ],
        ),
      ),
    );
  }
}
