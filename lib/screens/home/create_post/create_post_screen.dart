// ignore_for_file: unused_local_variable, must_be_immutable

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../core/const/svg_const.dart';
import '../../../view_models/imagepicker/image_picker_view_model.dart';
import 'create_post_controller.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController postController = new TextEditingController();
  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());

  final postcontroller = Get.put(PostFeedViewModel());

  @override
  void initState() {
    imagepickercontroller.selectedImagePath = ''.obs;
    super.initState();
  }

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
                      'Create a post',
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
            Padding(padding: EdgeInsets.only(top: 2.h)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 0),
                children: <Widget>[
                  PostInput(
                    controller: postcontroller.aboutcontroller.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Post text';
                      }
                      return null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Text(
                    'Add Images',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(
                      () => GestureDetector(
                        onTap: () async {
                          // notifier.selectImage();
                          imagepickercontroller.pickImage();
                        },
                        child:
                            imagepickercontroller.selectedImagePath.value == ''
                                ? Container(
                                    height: 7.h,
                                    width: 15.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFBFBFD),
                                      border: Border.all(
                                        width: 0.2.w,
                                        color: AppPallet.lightBorderColor,
                                      ),
                                      borderRadius: BorderRadius.circular(2.w),
                                    ),
                                    child: Center(
                                      child: WebsafeSvg.asset(
                                        createPostUploadVector,
                                        width: 7.w,
                                      ),
                                    ),
                                  )
                                : Card(
                                    elevation: 8,
                                    child: Image.file(File(imagepickercontroller
                                        .selectedImagePath.value)),
                                  ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 4.h)),
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
                          child: Obx(
                            () => GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  // notifier.createPost2();
                                  postcontroller.CreatePost();
                                }
                              },
                              child: Container(
                                height: 5.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppPallet.textColor,
                                  borderRadius: BorderRadius.circular(1.5.w),
                                ),
                                child: postcontroller.loading.value
                                    ? CupertinoActivityIndicator(
                                        color: AppPallet.whiteTextColor,
                                      )
                                    : Text(
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

class PostInput extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final hint;
  final maxLines;

  PostInput({
    Key? key,
    required this.controller,
    required this.validator,
    this.maxLines,
    this.hint,
  }) : super(key: key);

  @override
  _PostInputState createState() => _PostInputState();
}

class _PostInputState extends State<PostInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      validator: widget.validator,
      controller: widget.controller,
      style: TextStyle(
        fontSize: 10.sp,
        color: AppPallet.textColor,
        fontWeight: FontWeight.w400,
      ),
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: 'Create a post today…',
        fillColor: AppPallet.transparent,
        hintStyle: TextStyle(
          fontSize: 10.sp,
          color: AppPallet.lightTextColor,
          fontWeight: FontWeight.w300,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 4.8.w,
          vertical: 2.h,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.2,
              color: AppPallet.lightTextColor,
            ),
            borderRadius: BorderRadius.circular(2.w)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.2,
              color: AppPallet.lightTextColor,
            ),
            borderRadius: BorderRadius.circular(2.w)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.2,
              color: AppPallet.lightTextColor,
            ),
            borderRadius: BorderRadius.circular(2.w)),
      ),
    );
  }
}
