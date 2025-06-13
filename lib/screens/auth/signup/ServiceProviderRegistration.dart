import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/const/colors.dart';
import '../../../core/utils/navigation_service.dart';
import '../../../view_models/imagepicker/image_picker_view_model.dart';
import '../../../view_models/serviceprovider_view_models/create_serviceprovider/create_serviceprovider_view_model.dart';
import '../../../widgets/input_widget.dart';
import '../../../widgets/loader.dart';

class ServiceProvideRegister extends StatefulWidget {
  final bool userboolean;

  const ServiceProvideRegister({Key? key, this.userboolean = true})
      : super(key: key);

  @override
  _ServiceProvideRegisterState createState() => _ServiceProvideRegisterState();
}

class _ServiceProvideRegisterState extends State<ServiceProvideRegister> {
  String _country = 'Nigeria';
  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());
  final createServiceProvider = Get.put(CreateServiceProviderViewModel());

  @override
  void dispose() {
    Get.delete<ImagePickerController>();
    Get.delete<CreateServiceProviderViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.8.w),
          child: Column(
            children: [
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
                        "Registration",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
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
                    InputWidget(
                      controller:
                          createServiceProvider.businessnamecontroller.value,
                      icon: Icon(
                        Icons.person_outline,
                        color: AppPallet.textColor,
                        size: 15.sp,
                      ),
                      label: 'Business Name',
                      hint: 'Enter business name',
                      // controller: notifier.businessNameController,
                    ),
                    InputWidget(
                      controller:
                          createServiceProvider.phonecontrollerController.value,
                      keyboard: TextInputType.phone,
                      icon: Icon(
                        Icons.phone,
                        color: AppPallet.textColor,
                        size: 15.sp,
                      ),
                      label: 'Phone number',
                      hint: '+234 8022225555',
                      // controller: notifier.phoneNumberController,
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
          controller: createServiceProvider.dobController.value,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime(2000),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (pickedDate != null) {
              // Store the DateTime value
              createServiceProvider.selectedDate.value = pickedDate;

              // Optionally, still update the text field with formatted date
              String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              createServiceProvider.dobController.value.text = formattedDate;
            }
          },
          readOnly: true,
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
                      controller: createServiceProvider.cityController.value,
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
                      controller: createServiceProvider.stateController.value,
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
                              setState(() {
                                _country = newValue!;
                                createServiceProvider.country.value = newValue;
                              });
                            },
                            items: <String>[
                              'Nigeria',
                              'Ghana',
                              'South Africa',
                            ].map<DropdownMenuItem<String>>((String value) {
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
                    InputWidget(
                      icon: Icon(
                        Icons.location_city,
                        color: AppPallet.textColor,
                        size: 15.sp,
                      ),
                      label: 'Street',
                      hint: 'Enter your Street Adress',
                      controller:
                      createServiceProvider.addressController.value,
                    ),
                    Padding(padding: EdgeInsets.only(top: 3.h)),
                    Text(
                      """Fill in three keywords your customers are likely to know you by, e.g. woodwork, furniture, carpentry.""",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    Padding(padding: EdgeInsets.only(top: 3.h)),
                    InputWidget(
                      controller:
                          createServiceProvider.firstkeywordcontroller.value,
                      label: 'First Keyword',
                      hint: 'Enter keyword',
                      //controller: notifier.enterSecondKeywordController,
                    ),
                    InputWidget(
                      controller:
                          createServiceProvider.secondkeywordcontroller.value,
                      label: 'Second Keyword',
                      hint: 'Enter keyword',
                      // controller: notifier.enterSecondKeywordController1,
                    ),
                    InputWidget(
                      controller:
                          createServiceProvider.thirdkeywordcontroller.value,
                      label: 'Third Keyword',
                      hint: 'Enter keyword',
                      // controller: notifier.enterSecondKeywordController2,
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          //notifier.register(widget.userboolean);
                          createServiceProvider.validations();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 5.5.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppPallet.textColor,
                            borderRadius: BorderRadius.circular(1.5.w),
                          ),
                          child: createServiceProvider.loading.value
                              ? Loader()
                              : Text(
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
                        //AppUtils.go(const SigninScreen());
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
