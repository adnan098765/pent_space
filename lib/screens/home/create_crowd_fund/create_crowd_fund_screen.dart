// ignore_for_file: unused_field, unused_local_variable, invalid_use_of_protected_member

import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/widgets/input_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../core/const/img_const.dart';
import '../../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import '../create_post/create_post_screen.dart';
import 'create_crowd_fund_controller.dart';
import 'package:pent_space/utils/helpers.dart';
class CreateCrowdFundScreen extends StatefulWidget {
  const CreateCrowdFundScreen({Key? key}) : super(key: key);

  @override
  State<CreateCrowdFundScreen> createState() => _CreateCrowdFundScreenState();
}

class _CreateCrowdFundScreenState extends State<CreateCrowdFundScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final crowdfundController = Get.put(CrowdFundingViewModel());
  final getUserData = Get.put(GetUserDataController());

  List documents = [
    'hospital_statement_bill.pdf',
    'affidavit_of_oath.pdf',
  ];
  String formattedTime = '';
  TextEditingController _datecontroller = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('MM/dd/yyyy');
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950, 8),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _datecontroller.text = myFormat.format(selectedDate);
        DateTime utcDate = selectedDate.toUtc();
        String isoDate = utcDate.toIso8601String();
        crowdfundController.dateofbirth = isoDate;
        print("Selected date in ISO format: $isoDate");
      });
    }
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
                      'Request Crowdfund',
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
                  Divider(height: 0.2.w, color: AppPallet.lightBorderColor),
                  Padding(padding: EdgeInsets.only(top: 1.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                    child: Row(
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: AppPallet.lightGreyColor,
                            borderRadius: BorderRadius.circular(4.w),
                            image: DecorationImage(
                              image: NetworkImage(cleanUrl(getUserData
                                  .userdata.data!.profilePicture
                                  .toString())),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 2.w)),
                        Expanded(
                          child: Text(
                            getUserData.userdata.data!.userName.toString(),
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                crowdfundController.validations();
                              }
                            },
                            child: Container(
                              height: 4.h,
                              padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppPallet.textColor,
                                borderRadius: BorderRadius.circular(1.w),
                              ),
                              child: crowdfundController.loading.value
                                  ? CupertinoActivityIndicator(
                                      color: AppPallet.whiteTextColor,
                                    )
                                  : Text(
                                      'PUBLISH',
                                      style: TextStyle(
                                        color: AppPallet.whiteTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 9.sp,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 1.h)),
                  Divider(height: 0.2.w, color: AppPallet.lightBorderColor),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Basic details',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.check,
                              color: const Color(0xFF7381A5),
                              size: 13.sp,
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.2.h)),
                        InputWidget(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Name of Patient’s';
                            }
                            return null;
                          },
                          controller:
                              crowdfundController.patientnameController.value,
                          // label: "First Name",
                          borderRadius: 1.w,

                          hint: 'Name of Patient’s (as seen on ID)',
                          obscure: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.3.w,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 9.sp,
                              ),
                            ),
                            Obx(
                              () => Radio(
                                value: 'MALE',
                                groupValue:
                                    crowdfundController.selectedGender.value,
                                activeColor: Colors.black,
                                // Set the active color to black

                                onChanged: (value) {
                                  crowdfundController
                                      .updateSelectedGender(value);
                                  //notifier.updateSelectedGender(value);
                                },
                              ),
                            ),
                            Text('Male'),
                            Obx(
                              () => Radio(
                                value: 'FEMALE',
                                groupValue:
                                    crowdfundController.selectedGender.value,
                                activeColor: Colors
                                    .black, // Set the active color to black

                                onChanged: (value) {
                                  crowdfundController
                                      .updateSelectedGender(value);
                                  // notifier.updateSelectedGender(value);
                                },
                              ),
                            ),
                            Text('Female'),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),

                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0.w),
                            child: InputWidget(
                              onTap: () {
                                _selectDate(context);
                              },
                              readOnly: true,
                              controller: _datecontroller,
                              label: "Date of birth",
                              borderRadius: 1.w,
                              icon: Icon(
                                Icons.calendar_today,
                                color: AppPallet.textColor,
                                size: 18.sp,
                              ),
                              hint: 'MM/DD/YYYY',
                              obscure: false,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 2.3.w,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 200,
                              child: Obx(
                                () => InputWidget(
                                  onTap: () {
                                    crowdfundController.selectDateTime(context);
                                  },
                                  readOnly: true,
                                  controller:
                                      crowdfundController.datecontroller.value,
                                  label: "CrowdFunding Validity",
                                  borderRadius: 1.w,
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: AppPallet.textColor,
                                    size: 18.sp,
                                  ),
                                  hint: 'MM/DD/YYYY',
                                  obscure: false,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.3.w,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 150,
                              child: InputWidget(
                                onTap: () async {
                                  TimeOfDay? selectedTime =
                                      await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (selectedTime != null) {
                                    setState(() {
                                      formattedTime =
                                          selectedTime.format(context);
                                    });

                                    DateTime date = DateFormat('MM/dd/yyyy')
                                        .parse(crowdfundController
                                            .datecontroller.value.text);
                                    DateTime time = DateFormat('h:mm a')
                                        .parse(formattedTime);
                                    // Combine date and time
                                    DateTime combinedDateTime = DateTime(
                                        date.year,
                                        date.month,
                                        date.day,
                                        time.hour,
                                        time.minute);
                                    print(combinedDateTime);
                                    DateTime inputDateTime =
                                        DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
                                            .parse(combinedDateTime.toString());
                                    // Format the datetime into ISO 8601 format
                                    String isoFormattedDateTime =
                                        DateFormat('yyyy-MM-ddTHH:mm:ss.SSS')
                                            .format(inputDateTime);
                                    String finaltime =
                                        isoFormattedDateTime + "Z";
                                    crowdfundController.SelectCrowdFundingTime =
                                        finaltime;
                                    print("formattedTime is $finaltime");
                                  }
                                },
                                readOnly: true,
                                // controller: _datecontroller,
                                label: "",
                                borderRadius: 1.w,
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: AppPallet.textColor,
                                  size: 18.sp,
                                ),
                                hint: formattedTime.isEmpty
                                    ? 'time'
                                    : formattedTime,
                                obscure: false,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.3.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Hospital Name',
                          style: TextStyle(
                            color: const Color(0xFF9EA2A8),
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.8.h)),
                        InputWidget(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Name of Hospital';
                            }
                            return null;
                          },
                          controller:
                              crowdfundController.hospitalnameController.value,
                          // label: "First Name",
                          borderRadius: 1.w,

                          hint: 'Name',
                          obscure: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.3.w,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // InputWidget(
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter Name of Hospital';
                        //     }
                        //     return null;
                        //   },
                        //   controller: notifier.hospitalNameController,
                        //   label: "Name of Hospital",
                        //   borderRadius: 1.w,
                        //   // hint: 'Name of Hospital ',
                        //   obscure: false,
                        //   contentPadding: EdgeInsets.symmetric(
                        //     vertical: 2.3.w,
                        //   ),
                        // ),
                        Text(
                          'EVENT TITLE',
                          style: TextStyle(
                            color: const Color(0xFF9EA2A8),
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.8.h)),
                        InputWidget(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Title';
                            }
                            return null;
                          },
                          controller:
                              crowdfundController.eventtitleController.value,
                          // label: "First Name",
                          borderRadius: 1.w,

                          hint: 'Title',
                          obscure: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.3.w,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Text(
                          'EVENT DESCRIPTION',
                          style: TextStyle(
                            color: const Color(0xFF9EA2A8),
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.8.h)),
                        PostInput(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter EVENT DESCRIPTION';
                            }
                            return null;
                          },
                          maxLines: 6,
                          controller:
                              crowdfundController.descriptionController.value,
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Divider(height: 0.2.w, color: AppPallet.lightBorderColor),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Amount',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.check,
                              color: const Color(0xFF7381A5),
                              size: 13.sp,
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.1.h)),
                        Text(
                          'This section contains the total donation',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 9.sp,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 3.h)),
                        Row(
                          children: [
                            Center(
                              child: Container(
                                color: AppPallet.textColor,
                                width: 50.w,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.8.w),
                                      child: Text(
                                        '₦',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: AppPallet.textColor,
                                            border: Border(
                                              top: BorderSide(
                                                width: 0.2.w,
                                                color: AppPallet.lightTextColor,
                                              ),
                                              bottom: BorderSide(
                                                width: 0.2.w,
                                                color: AppPallet.lightTextColor,
                                              ),
                                              right: BorderSide(
                                                width: 0.2.w,
                                                color: AppPallet.lightTextColor,
                                              ),
                                            ),
                                          ),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter EVENT DESCRIPTION';
                                              }
                                              return null;
                                            },
                                            controller: crowdfundController
                                                .amountController.value,
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 4.8.w,
                                                vertical: 1.h,
                                              ),
                                              hintText: 'Enter Amount',
                                              border: const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.zero,
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.zero,
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     // notifier.pickPdfFile();
                            //   },
                            //   child: Container(
                            //     height: 4.3.h,
                            //     width: 21.w,
                            //     child: Padding(
                            //       padding: EdgeInsets.all(2.0),
                            //       child: Text(
                            //         "Hospital Statement bill (PDF)",
                            //         style: TextStyle(
                            //             fontSize: 9,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     ),
                            //     decoration: BoxDecoration(
                            //         border: Border.all(),
                            //         borderRadius:
                            //             BorderRadius.all(Radius.circular(3))),
                            //   ),
                            // ),
                            // Icon(Icons.delete)
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Divider(height: 0.2.w, color: AppPallet.lightBorderColor),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Upload Proof',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.check,
                              color: const Color(0xFF7381A5),
                              size: 13.sp,
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.1.h)),
                        Text(
                          'This section contains upload of relevant proof',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 9.sp,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 4.h)),
                        Obx(
                          () => GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                crowdfundController.imageFileList.value.length +
                                    1,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 0.w),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 4,
                            ),
                            itemBuilder: (context, index) => index ==
                                    crowdfundController
                                        .imageFileList.value.length
                                ? GestureDetector(
                                    onTap: () {
                                      crowdfundController.pickFile();
                                    },
                                    child: DottedBorder(
                                        radius: Radius.circular(15),
                                        borderType: BorderType.RRect,
                                        strokeCap: StrokeCap.round,
                                        dashPattern: const [5, 5],
                                        strokeWidth: 1.5,
                                        color: Colors.white,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.add_a_photo),
                                                Text(
                                                  'Add',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                )
                                              ],
                                            )))),
                                  )
                                : Obx(
                                    () => Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              image: crowdfundController
                                                      .imageFileList
                                                      .value[index]
                                                      .contains('http')
                                                  ? DecorationImage(
                                                      image: NetworkImage(
                                                        cleanUrl(crowdfundController
                                                            .imageFileList
                                                            .value[index]),
                                                      ),
                                                      //  FileImage(
                                                      //   File(imageFileList[index]),
                                                      // ),
                                                      fit: BoxFit.cover)
                                                  : DecorationImage(
                                                      image: FileImage(
                                                        File(crowdfundController
                                                            .imageFileList
                                                            .value[index]),
                                                      ),
                                                      fit: BoxFit.cover),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          top: -80,
                                          left: 30,
                                          child: GestureDetector(
                                            onTap: () {
                                              crowdfundController
                                                  .removeImage(index);
                                            },
                                            child: SizedBox(
                                              height: 25.h,
                                              width: 25.w,
                                              child: Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Divider(height: 0.2.w, color: AppPallet.lightBorderColor),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Upload Document',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.check,
                              color: const Color(0xFF7381A5),
                              size: 13.sp,
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 0.1.h)),
                        Text(
                          'Upload all relevant document about the event in order to get verified faster',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 9.sp,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 4.h)),
                        Obx(
                          () => GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                crowdfundController.pdfFileList.value.length +
                                    1,
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 0.w),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 4,
                            ),
                            itemBuilder: (context, index) => index ==
                                    crowdfundController.pdfFileList.value.length
                                ? GestureDetector(
                                    onTap: () {
                                      crowdfundController.pickPDF();
                                    },
                                    child: DottedBorder(
                                        radius: Radius.circular(15),
                                        borderType: BorderType.RRect,
                                        strokeCap: StrokeCap.round,
                                        dashPattern: const [5, 5],
                                        strokeWidth: 1.5,
                                        color: Colors.white,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.edit_document),
                                                Text(
                                                  'Add',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                )
                                              ],
                                            )))),
                                  )
                                : Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  pdf,
                                                ),
                                                //  FileImage(
                                                //   File(imageFileList[index]),
                                                // ),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        top: -70,
                                        left: 20,
                                        child: GestureDetector(
                                          onTap: () {
                                            crowdfundController
                                                .removePdf(index);
                                          },
                                          child: SizedBox(
                                            height: 25.h,
                                            width: 25.w,
                                            child: Icon(
                                              Icons.cancel,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                        Divider(
                            height: 0.2.w, color: AppPallet.lightBorderColor),
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Next of kin',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9.sp,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.check,
                              color: const Color(0xFF7381A5),
                              size: 13.sp,
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text("Name"),
                            ),
                            Container(
                                width: 40.w,
                                child: InputWidget(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Title';
                                    }
                                    return null;
                                  },
                                  controller: crowdfundController
                                      .nameofkinController.value,

                                  borderRadius: 1.w,
                                  // hint: 'Name of Patient’s (as seen on ID)',
                                  obscure: false,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.3.w,
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text("Relationship"),
                            ),
                            SizedBox(
                                width: 40.w,
                                child: InputWidget(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Relationship';
                                    }
                                    return null;
                                  },
                                  controller: crowdfundController
                                      .relationController.value,

                                  borderRadius: 1.w,
                                  // hint: 'Name of Patient’s (as seen on ID)',
                                  obscure: false,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.3.w,
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text("Phone Number"),
                            ),
                            Container(
                                width: 40.w,
                                child: InputWidget(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Phone Number';
                                    }
                                    return null;
                                  },
                                  controller:
                                      crowdfundController.phoneController.value,
                                  borderRadius: 1.w,
                                  // hint: 'Name of Patient’s (as seen on ID)',
                                  obscure: false,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 2.3.w,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Divider(height: 0.2.w, color: AppPallet.lightBorderColor),
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
