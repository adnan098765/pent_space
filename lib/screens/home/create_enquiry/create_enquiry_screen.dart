import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/models/app_state_model.dart';
import 'package:sizer/sizer.dart';
import 'package:pent_space/utils/helpers.dart';
import '../../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import 'create_enquirt_controller.dart';

class CreateEnquiryScreen extends StatefulWidget {
  CreateEnquiryScreen({Key? key}) : super(key: key);

  @override
  _CreateEnquiryScreenState createState() => _CreateEnquiryScreenState();
}

class _CreateEnquiryScreenState extends State<CreateEnquiryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  final createEnquiryvm = Get.put(PostEnquiryViewModel());
  final getUserData = Get.put(GetUserDataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
              color: AppPallet.textColor,
              child: SafeArea(
                bottom: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppUtils.goBack();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppPallet.whiteTextColor,
                        size: 13.sp,
                      ),
                    ),
                    Text(
                      'Ask a Question',
                      style: TextStyle(
                        color: AppPallet.whiteTextColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 9.8.w,
                        vertical: 6.h,
                      ),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                              color: const Color(0xFFE1E4EC),
                              borderRadius: BorderRadius.circular(2.w)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 0.2.h),
                                child: Icon(
                                  Icons.circle,
                                  size: 6.sp,
                                  color: const Color(0xFF6F7581),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Expanded(
                                child: Text(
                                  'Ask the community questions you need answers to.',
                                  style: TextStyle(
                                    color: const Color(0xFF6F7581),
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Divider(height: 0.2.w, color: AppPallet.lightBorderColor),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                            color: AppPallet.lightGreyColor,
                            borderRadius: BorderRadius.circular(5.w),
                            image: DecorationImage(
                              image: NetworkImage(
                                  cleanUrl('${getUserData.userdata.data!.profilePicture}')),
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
                                '${getUserData.userdata.data!.userName}',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  PostInout(
                    controller: createEnquiryvm.enquirycontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your question';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Padding(padding: EdgeInsets.only(top: 4.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppUtils.goBack();
                          },
                          child: Container(
                            height: 5.h,
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE2E2E2),
                              borderRadius: BorderRadius.circular(1.5.w),
                              border: Border.all(
                                width: 0.2.w,
                                color: AppPallet.lightTextColor,
                              ),
                            ),
                            child: Text(
                              'CLOSE',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 5.w)),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // notifier.createPost();
                                createEnquiryvm.CreateEnquiry();
                              }
                            },
                            child: Container(
                              height: 5.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppPallet.textColor,
                                borderRadius: BorderRadius.circular(1.5.w),
                              ),
                              child:
                                  //  notifier.isCreatingPost
                                  //     ? Loader()
                                  //     :

                                  Text(
                                'POST',
                                style: TextStyle(
                                  color: AppPallet.whiteTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 2.h)),
          ],
        ),
      ),
    );
  }
}

class PostInout extends StatelessWidget {
  TextEditingController controller;

  String? Function(String?)? validator;

  PostInout({
    Key? key,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      controller: controller,
      validator: validator,
      style: TextStyle(
        fontSize: 10.sp,
        color: AppPallet.textColor,
        fontWeight: FontWeight.w500,
      ),
      maxLines: null,
      minLines: 10,
      decoration: InputDecoration(
        hintText: 'What do you want to ask?',
        fillColor: AppPallet.transparent,
        hintStyle: TextStyle(
          fontSize: 10.sp,
          color: AppPallet.textColor,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 13.8.w,
          vertical: 2.h,
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
    );
  }
}
