import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/models/app_state_model.dart';
import 'package:pent_space/screens/auth/signup/complete_signup.dart';
import 'package:pent_space/screens/auth/signup/signup_notifier.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../widgets/platformDialog.dart';

class UploadProfile extends ConsumerWidget {
  const UploadProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupChangeProvider);
    String dropdownValue = 'Choose Service Category';
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
                  children: [
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Column(
                      children: [
                        Text(
                          "Registration",
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
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
                    Padding(padding: EdgeInsets.only(top: 3.h)),
                      GestureDetector(
                          onTap: () {
                            // pickImage(source);
                            notifier.selectImage();
                          },
                          child: notifier.image == null
                              ? WebsafeSvg.asset(uploadImageVector, height: 9.h)
                              : Container(
                                  height: 150,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: MemoryImage(
                                          notifier.image,
                                        ),
                                        fit: BoxFit.contain),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black, // Border color
                                      width: 2.0, // Border width
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                // child: Image.memory(
                                //   notifier.image,
                                //   height: 80,
                                //   width: 80,
                                //   fit: BoxFit.cover,
                                // ),
                              )),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Text(
                      "Upload a brand image",
                      style: TextStyle(
                        color: AppPallet.redTextColor,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    TextField(
                      controller: notifier.businessNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter business name',
                        hintStyle: TextStyle(
                          color: AppPallet.lightTextColor,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.h)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      width: double.infinity,
                      height: 5.5.h,
                      decoration: BoxDecoration(
                        color: AppPallet.whiteBackground,
                        border: Border.all(
                            color: AppPallet.textColor, width: 0.2.w),
                        borderRadius: BorderRadius.circular(1.5.w),
                      ),
                      child: StatefulBuilder(builder: (context, setState) {
                        return DropdownButton<String>(
                          value: notifier.userCategory,
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 0,
                          ),
                          onChanged: (String? newValue) {
                            notifier.setUserCategory(newValue!);
                          },
                          items: <String>[
                            'Choose Service Category',
                            'Pharmacy',
                            'Clinic',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: AppPallet.lightTextColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11.sp,
                                    fontStyle: FontStyle.italic),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5.h)),
                    GestureDetector(
                      onTap: () {
                        // print(notifier.photoUrl);
                        // print(notifier.businessNameController.text);
                        // print(notifier.userCategory);
                        if (notifier.businessNameController.text.isEmpty) {
                          PlatformDialog.showModal(
                            title: 'Alert',
                            body: "Please enter your business name.",
                          );
                        } else if (notifier.userCategory ==
                            "Choose Service Category") {
                          PlatformDialog.showModal(
                            title: 'Alert',
                            body: "Please select a user category.",
                          );
                        } else if (notifier.image == null) {
                          PlatformDialog.showModal(
                            title: 'Alert',
                            body: "Please select an image.",
                          );
                        } else {
                          AppUtils.go(const CompleteSignup(
                            userboolean: false,
                          ));
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 5.5.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppPallet.textColor,
                          borderRadius: BorderRadius.circular(1.5.w),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: AppPallet.whiteTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
