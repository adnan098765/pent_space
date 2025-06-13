// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/view_models/user_view_models/createprofile/create_profile_view_model.dart';
import 'package:pent_space/widgets/input_widget.dart';
import 'package:pent_space/widgets/loader.dart';
import 'package:sizer/sizer.dart';

import '../../../view_models/imagepicker/image_picker_view_model.dart';

class CompleteSignup extends StatefulWidget {
  final bool userboolean;

  const CompleteSignup({Key? key, this.userboolean = true}) : super(key: key);

  @override
  _CompleteSignupState createState() => _CompleteSignupState();
}

class _CompleteSignupState extends State<CompleteSignup> {
  String _country = 'Nigeria';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());

  final createuserViewModel = Get.put(CreateUserViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 2.h)),
              GestureDetector(
                onTap: () {
                  NavigationService.instance.goback();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 19.sp,
                    color: AppPallet.textColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(
                      "Please enter your information below in order to create your account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 11.sp,
                        height: 0.17.h,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 10),
                          ),
                          child: Obx(
                            () => CircleAvatar(
                              radius: 60,
                              backgroundImage: imagepickercontroller
                                          .selectedImagePath.value !=
                                      ''
                                  ? FileImage(File(imagepickercontroller
                                      .selectedImagePath.value))
                                  : null,
                              child: imagepickercontroller
                                      .selectedImagePath.value.isEmpty
                                  ? Icon(Icons.image)
                                  : null,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          left: 90,
                          child: GestureDetector(
                            onTap: () {
                              imagepickercontroller.pickImage();
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color.fromARGB(255, 185, 185, 185),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputWidget(
                            icon: Icon(
                              Icons.person_outline,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Full Name',
                            hint: 'Enter your full name',
                            controller:
                                createuserViewModel.fullnamecontroller.value,
                          ),
                          InputWidget(
                            icon: Icon(
                              Icons.person_outline,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'UserName',
                            hint: 'Enter your preferred username',
                            controller:
                                createuserViewModel.usernameController.value,
                          ),
                          InputWidget(
                            keyboard: TextInputType.none,
                            icon: Icon(
                              Icons.calendar_today,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'DOB',
                            hint: '31/1/2003',
                            controller: createuserViewModel.dobController.value,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2000),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                // Store the DateTime value
                                createuserViewModel.selectedDate.value = pickedDate;

                                // Optionally, still update the text field with formatted date
                                String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                createuserViewModel.dobController.value.text = formattedDate;
                              }
                            },
                            readOnly: true,
                          ),
                          InputWidget(
                            keyboard: TextInputType.phone,
                            icon: Icon(
                              Icons.phone,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Phone',
                            hint: '+1 7012345678',
                            controller: createuserViewModel
                                .phonecontrollerController.value,
                          ),
                          InputWidget(
                            keyboard: TextInputType.text,
                            icon: Icon(
                              Icons.pin_drop_rounded,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'City',
                            hint: 'Enter your City e.g Lagos',
                            controller: createuserViewModel
                                .cityController.value,
                          ),
                          InputWidget(
                            keyboard: TextInputType.text,
                            icon: Icon(
                              Icons.map_outlined,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'State',
                            hint: 'Enter your State e.g Kano',
                            controller: createuserViewModel
                                .stateController.value,
                          ),
                          Text(
                            'Country',
                            style: TextStyle(
                              color: AppPallet.lightTextColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            width: double.infinity,
                            height: 5.5.h,
                            decoration: BoxDecoration(
                              color: AppPallet.whiteBackground,
                              border: Border.all(
                                color: AppPallet.lightTextColor,
                                width: 0.3.w,
                              ),
                              borderRadius: BorderRadius.circular(1.5.w),
                            ),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return DropdownButton<String>(
                                  value: _country,
                                  isExpanded: true,
                                  icon: Container(
                                    width: 6.w,
                                    height: 6.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.2.w,
                                        color: AppPallet.lightTextColor,
                                      ),
                                      borderRadius: BorderRadius.circular(4.w),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.unfold_more,
                                          size: 13.sp,
                                          color: AppPallet.textColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 0,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _country = newValue!;
                                      createuserViewModel.country.value =
                                          newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Nigeria',
                                    'Ghana',
                                    'South Africa',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: AppPallet.lightTextColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 11.sp,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2.h)),
                          InputWidget(
                            icon: Icon(
                              Icons.location_city,
                              color: AppPallet.textColor,
                              size: 15.sp,
                            ),
                            label: 'Street',
                            hint: 'Enter your Street Adress',
                            controller:
                                createuserViewModel.addressController.value,
                          ),
                          Padding(padding: EdgeInsets.only(top: 4.h)),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                createuserViewModel.validations();
                              },
                              child: Container(
                                width: double.infinity,
                                height: 5.5.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppPallet.textColor,
                                  borderRadius: BorderRadius.circular(1.5.w),
                                ),
                                child: createuserViewModel.loading.value
                                    ? Loader()
                                    :
                                    //  _notifier.isRegistering
                                    //     ? const Loader()
                                    //     :

                                    Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 2.h)),
                          GestureDetector(
                            onTap: () {
                              // AppUtils.go(const SigninScreen());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Have an account already?',
                                  style: TextStyle(
                                    color: AppPallet.lightTextColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: 2.w)),
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
