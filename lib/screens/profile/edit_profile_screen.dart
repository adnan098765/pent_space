// ignore_for_file: prefer_const_constructors, unused_element
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/profile/profile_notifier.dart';
import 'package:pent_space/view_models/edit_profile_view_model/edit_profile_view_model.dart';
import 'package:pent_space/widgets/input_widget.dart';
import 'package:pent_space/widgets/loader.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import '../../view_models/imagepicker/image_picker_view_model.dart';
import 'package:pent_space/utils/helpers.dart';
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final getUserData = Get.put(GetUserDataController());
  final editProfile = Get.put(EditProfileController());

  late ProfileNotifier notifier;

  @override
  void initState() {
    imagepickercontroller.selectedImagePath = ''.obs;
    editProfile.nameController.value.text =
        getUserData.userdata.data!.userName.toString();
    editProfile.phoneController.value.text =
        getUserData.userdata.data!.phone.toString();

    print('Number ${getUserData.userdata.data!.phone.toString()}');
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != notifier.selectedDate) {
      notifier.setDate(picked);
    }
  }

  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                            size: 14.sp,
                            color: AppPallet.whiteTextColor,
                          ),
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: AppPallet.whiteTextColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.more_horiz,
                          size: 14.sp,
                          color: AppPallet.whiteTextColor,
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        imagepickercontroller.pickImage();
                      },
                      child: SizedBox(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 24.w,
                                        height: 24.w,
                                        decoration: BoxDecoration(
                                          color: AppPallet.greyBackgroundColor,
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
                                          image: imagepickercontroller
                                                      .selectedImagePath
                                                      .value ==
                                                  ''
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                    cleanUrl(getUserData.userdata.data!
                                                        .profilePicture
                                                        .toString()),
                                                  ),
                                                  fit: BoxFit.cover,
                                                )
                                              : DecorationImage(
                                                  image: FileImage(
                                                    File(imagepickercontroller
                                                        .selectedImagePath
                                                        .value),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 2.w)),
                                      WebsafeSvg.asset(
                                        profileUploadVector,
                                        height: 4.w,
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 2.w)),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  color: AppPallet.whiteBackground,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 2.h)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputWidget(
                              // initialvalue: getUserData.userdata.data!.userName,
                              controller: editProfile.nameController.value,
                              label: "Name",
                              borderRadius: 1.w,
                              icon: Icon(
                                Icons.person_outline,
                                color: AppPallet.textColor,
                                size: 15.sp,
                              ),
                              hint: 'Revolt Therapist',
                              obscure: false,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 2.3.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                        child: InputWidget(
                          initialvalue: getUserData.userdata.data!.email,
                          // controller: notifier.lastNameController,
                          label: "Email",
                          borderRadius: 1.w,
                          icon: Icon(
                            Icons.person_outline,
                            color: AppPallet.textColor,
                            size: 18.sp,
                          ),
                          hint: 'Jony',
                          obscure: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.3.w,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                        child: InputWidget(
                          // initialvalue: getUserData.userdata.data!.phone,
                          keyboard: TextInputType.phone,
                          controller: editProfile.phoneController.value,
                          label: "Phone",
                          borderRadius: 1.w,
                          icon: Icon(
                            Icons.phone,
                            color: AppPallet.textColor,
                            size: 15.sp,
                          ),
                          hint: '+234 8022225555',
                          obscure: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.3.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.h)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.8.w,
                    vertical: 1.h,
                  ),
                  child: Text(
                    'Account Information',
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                EditItem(
                  title: 'Email Address',
                  icon: dateOfBirthVector,
                  trailing: Column(
                    children: [
                      Text(
                        'VERIFIED',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 1.w)),
                      Text(
                        getUserData.userdata.data!.email.toString(),
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
          Padding(padding: EdgeInsets.only(top: 2.h)),
          Obx(
            () => Center(
              child: SafeArea(
                top: false,
                child: GestureDetector(
                  onTap: () {
                    editProfile.editProfile();
                  },
                  child: Container(
                    height: 5.h,
                    width: 80.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppPallet.textColor,
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: editProfile.loading.value
                        ? Loader()
                        : Text(
                            'SAVE CHANGES',
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
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
        ],
      ),
    );
  }
}

class EditItem extends StatelessWidget {
  final String? title;
  final String? icon;
  final Widget? trailing;
  const EditItem({Key? key, this.icon, this.title, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 1.5.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppPallet.borderColor, width: 0.2.w),
        ),
      ),
      child: Row(
        children: [
          WebsafeSvg.asset(icon!, width: 4.w),
          Padding(padding: EdgeInsets.only(right: 2.w)),
          Text(
            title!,
            style: TextStyle(
              color: AppPallet.textColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Spacer(),
          trailing!
        ],
      ),
    );
  }
}
