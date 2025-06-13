// ignore_for_file: must_be_immutable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/explore/answers/ansewerSevices.dart';
import 'package:sizer/sizer.dart';
import 'package:share_plus/share_plus.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../models/AnswerModel.dart';
import '../../../models/EnquiryModel.dart';
import '../../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import 'package:pent_space/utils/helpers.dart';

class AnswersScreen extends StatefulWidget {
  final questionid;
  AnswersScreen({
    this.questionid,
    Key? key,
  }) : super(key: key);

  @override
  State<AnswersScreen> createState() => _AnswersScreenState();
}

class _AnswersScreenState extends State<AnswersScreen> {
  // final EnquiryModel question;
  final answerVM = Get.put(AnswersViewModel());

  var formkey = GlobalKey<FormState>();

  @override
  void initState() {
    answerVM.questionid.value = widget.questionid;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      answerVM.getAnswers();
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
          key: formkey,
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
                      'Answers',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // _openBottomModal(context);
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
                  () => answerVM.loading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _QuestionItem(AllQuestion: answerVM.Answers),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 8.w,
                        width: 8.w,
                        decoration: BoxDecoration(
                          color: AppPallet.greyBackgroundColor,
                          borderRadius: BorderRadius.circular(4.w),
                          image: DecorationImage(
                            image: NetworkImage(
                              cleanUrl('https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
                            )),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 2.w)),
                      Expanded(
                        child: Container(
                          // height: 4.5.h,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  controller: answerVM.answerController.value,
                                  maxLines: 10,
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
                      SizedBox(
                        width: 2.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              answerVM.PostAnswer();
                            }
                          },
                          child: const Center(child: Icon(Icons.send)))
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
}

class _QuestionItem extends StatelessWidget {
  final AllQuestion;

  _QuestionItem({Key? key, required this.AllQuestion}) : super(key: key);
  final getUserData = Get.put(GetUserDataController());
  final answerVM = Get.put(AnswersViewModel());
  void _showDeleteDialog(BuildContext context, questiondid) {
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
                answerVM.deleteAnswer(questiondid);

                Navigator.of(context).pop(); // Dismiss the dialog
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.4.w, color: AppPallet.inputBorderColor),
        ),
      ),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: AllQuestion.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.w),
                            color: AppPallet.greyBackgroundColor,
                            image: DecorationImage(
                              image: NetworkImage(
                                cleanUrl('${AllQuestion[index]['profile_picture']}'),
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
                                '${AllQuestion[index]['user_name']}',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 0.3.h)),
                              Text(
                                '${formatTimestamp(DateTime.parse(AllQuestion[index]['createdAt']))}',
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
                        Spacer(),
                        if (AllQuestion[index]['user_id'] ==
                            getUserData.userdata.data!.id) ...[
                          InkWell(
                              onTap: () {
                                _showDeleteDialog(
                                    context, AllQuestion[index]['id']);
                              },
                              child: Icon(Icons.delete))
                        ],
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 2.h)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        '${AllQuestion[index]['answer_text']}',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 2.h)),
                    Divider(
                      height: 0.4.w,
                      thickness: 0.4.w,
                      color: AppPallet.inputBorderColor,
                    ),
                  ],
                ),
              );
            },
          ),
          // Padding(padding: EdgeInsets.only(bottom: 1.h)),
        ],
      ),
    );
  }
}

class _AnswersWidget extends StatelessWidget {
  final AnswerModel answers;

  final bool hasImages;
  const _AnswersWidget(
      {Key? key, required this.answers, this.hasImages = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.4.w, vertical: 2.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10.w,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: AppPallet.greyBackgroundColor,
                    borderRadius: BorderRadius.circular(5.w),
                    image: DecorationImage(
                      image: NetworkImage(
                        cleanUrl('$globalimage'),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 4.w)),
                Expanded(
                  child: Text(
                    '${answers.user.firstName} ${answers.user.lastName}',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     WebsafeSvg.asset(answersUpVoteVector, height: 2.h),
                //     Padding(padding: EdgeInsets.only(top: 0.5.h)),
                //     WebsafeSvg.asset(answersDownVoteVector, height: 2.h),
                //   ],
                // )
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 2.h)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${answers.content}',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 0.5.h)),
                  Row(
                    children: [
                      Text(
                        '${formatTimestamp(answers.timestamp)}',
                        style: TextStyle(
                          color: AppPallet.lightTextColor,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      // Padding(padding: EdgeInsets.only(right: 8.w)),
                      // Text(
                      //   '2 downvotes',
                      //   style: TextStyle(
                      //     color: AppPallet.lightTextColor,
                      //     fontSize: 9.sp,
                      //     fontWeight: FontWeight.w500,
                      //     fontStyle: FontStyle.italic,
                      //   ),
                      // ),
                    ],
                  ),
                  hasImages
                      ? Container(
                          height: 20.h,
                          margin: EdgeInsets.only(top: 2.h),
                          decoration: BoxDecoration(
                            color: AppPallet.greyBackgroundColor,
                            borderRadius: BorderRadius.circular(3.w),
                            image:  DecorationImage(
                              image: NetworkImage(
                                cleanUrl('https://images.unsplash.com/photo-1587854692152-cbe660dbde88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2338&q=80'),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
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
        return Container(
          color: Colors.black,
        );
      });
}

class CreateModal extends StatelessWidget {
  EnquiryModel question;
  CreateModal({Key? key, required this.question}) : super(key: key);

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
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: question.content));

                    // Optionally, you can provide some feedback that the text has been copied
                    EasyLoading.showSuccess('Text copied to clipboard');

                    print(question.content);
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
                  onTap: () {
                    Share.share(question.content, subject: 'Question Content');
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
            // Container(
            //   decoration: BoxDecoration(
            //     color: const Color(0xFFF6F6F7),
            //     borderRadius: BorderRadius.circular(2.w),
            //   ),
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.symmetric(vertical: 2.h),
            //         child: Text(
            //           'Follow Aftermath Therapy',
            //           style: TextStyle(
            //             color: AppPallet.lightTextColor,
            //             fontSize: 9.sp,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       ),
            //       Divider(
            //         height: 0.2.w,
            //         color: AppPallet.lightTextColor,
            //       ),
            //       Padding(
            //         padding: EdgeInsets.symmetric(vertical: 2.h),
            //         child: Text(
            //           'Hide This Post',
            //           style: TextStyle(
            //             color: AppPallet.lightTextColor,
            //             fontSize: 9.sp,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(padding: EdgeInsets.only(top: 1.h)),
          ],
        ),
      ),
    );
  }
}
