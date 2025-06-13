// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/widgets/platformDialog.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../core/utils/app_utils.dart';
import '../../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import '../../home/create_enquiry/create_enquirt_controller.dart';
import 'answers_screen.dart';

class QuestionWidget extends StatelessWidget {
  //final EnquiryModel question;
  final questions;

  QuestionWidget({Key? key, this.questions}) : super(key: key);
  final getUserData = Get.put(GetUserDataController());
  final getAllQuestionsVM = Get.put(PostEnquiryViewModel());

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
                getAllQuestionsVM.deleteQuestion(questiondid);

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
    return GestureDetector(
      onTap: () {
        AppUtils.go(AnswersScreen(
          questionid: questions['id'],
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.4.w, color: AppPallet.inputBorderColor),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q: ${questions['question_text']}",
              style: TextStyle(
                color: AppPallet.textColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Padding(padding: EdgeInsets.only(bottom: 2.h)),
            Row(
              children: [
                Text(
                  'Asked by: ${questions['user_name']}',
                  style: TextStyle(color: Colors.grey),
                ),
                // Text(
                //   '2 answers',
                //   style: TextStyle(
                //     color: AppPallet.textColor,
                //     fontSize: 9.sp,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                Padding(padding: EdgeInsets.only(right: 2.w)),
                Icon(
                  Icons.circle,
                  color: AppPallet.lightTextColor,
                  size: 4.sp,
                ),
                Padding(padding: EdgeInsets.only(right: 2.w)),
                Text(
                  ' Posted ${formatTimestamp(DateTime.parse(questions['createdAt']))}',
                  style: TextStyle(
                    color: AppPallet.lightTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Spacer(),
                if (questions['user_id'] == getUserData.userdata.data!.id) ...[
                  InkWell(
                      onTap: () {
                        _showDeleteDialog(context, questions['id']);
                      },
                      child: Icon(Icons.delete))
                ],
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 1.h)),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    AppUtils.go(AnswersScreen(
                      questionid: questions['id'],
                    ));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
                    decoration: BoxDecoration(
                      color: AppPallet.inputBorderColor,
                      borderRadius: BorderRadius.circular(1.w),
                    ),
                    child: Row(
                      children: [
                        Text(
                          ' View Answers',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        WebsafeSvg.asset(viewAnswerVector, width: 5.w)
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: 2.w)),
                GestureDetector(
                  onTap: () {
                    PlatformDialog.showModal(title: 'alert', body: 'Reported!');
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
                    decoration: BoxDecoration(
                      color: AppPallet.inputBorderColor,
                      borderRadius: BorderRadius.circular(1.w),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Report',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        WebsafeSvg.asset(reportAnswerVector, width: 4.w)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
