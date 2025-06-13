// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_const_constructors, avoid_print, invalid_use_of_protected_member

import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../Services/auth/auth_services.dart';
import '../home_screen.dart';

class CrowdFundingViewModel extends GetxController {
  final patientnameController = TextEditingController().obs;
  final eventtitleController = TextEditingController().obs;
  var gender;
  final descriptionController = TextEditingController().obs;
  final hospitalnameController = TextEditingController().obs;
  final nameofkinController = TextEditingController().obs;
  final relationController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final amountController = TextEditingController().obs;
  var dateofbirth;
  final _picker = ImagePicker();
  final filepicker = FilePicker.platform;
  RxList imageFileList = [].obs;
  List myCrwodFundings = [];
  RxList pdfFileList = [].obs;
  RxInt feedsid = 0.obs;
  RxBool loading = false.obs;
  Map postComments = {};
  RxString selectedGender = ''.obs;
  DateTime? selectedDate;
  String formattedTime = '';
  final datecontroller = TextEditingController().obs;
  List AllCrowdFundings = [];
  var myFormat = DateFormat('MM/dd/yyyy');
  var SelectedDate;
  var SelectCrowdFundingTime;

  validations() {
    if (selectedGender.value.isEmpty) {
      Get.snackbar('Message', 'Please Select Gender', colorText: Colors.white);
    } else if (dateofbirth == null) {
      Get.snackbar('Message', 'Please Select Date of Birth',
          colorText: Colors.white);
    } else if (imageFileList.value.isEmpty) {
      Get.snackbar('Message', 'Please Upload Images For Prove');
    } else if (SelectCrowdFundingTime == null) {
      Get.snackbar('Message', 'Please Upload Date and Time for validity');
    } else if (pdfFileList.value.isEmpty) {
      Get.snackbar('Message', 'Please Upload Documents For Verification');
    } else if (nameofkinController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Name of Kin',
          colorText: Colors.white);
    } else if (relationController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Relation');
    } else if (phoneController.value.text.isEmpty) {
      Get.snackbar('Message', 'Please Enter Phone Number');
    } else {
      CreateCrowdFund();
    }
  }

  void CreateCrowdFund() async {
    try {
      loading.value = true;
      var data = {
        'patient_name': patientnameController.value.text,
        'patient_gender': selectedGender.value,
        'date_of_birth': dateofbirth,
        'hospital_name': hospitalnameController.value.text,
        'title': eventtitleController.value.text,
        'description': descriptionController.value.text,
        'amount': amountController.value.text,
        'next_of_kin_name': nameofkinController.value.text,
        'next_of_kin_relation': relationController.value.text,
        'next_of_kin_phone': phoneController.value.text,
        'end_datetime': SelectCrowdFundingTime,
        'crowd_funding_images': imageFileList.value,
        'crowd_funding_docs': pdfFileList.value
      };

      var result = await AuthServices().CreateCrowdFunding(data);
      var responseBody = await result.stream.bytesToString();
      Map<String, dynamic> response = json.decode(responseBody);

      if (response['status']['success'] == true) {
        Get.snackbar('Message', response['message']);
        Get.to(() => HomeScreen());
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
      selectedGender.value = '';
      patientnameController.value.clear();
      hospitalnameController.value.clear();
      dateofbirth = null;
      eventtitleController.value.clear();
      descriptionController.value.clear();
      SelectCrowdFundingTime = '';
      datecontroller.value.clear();
      phoneController.value.clear();
      nameofkinController.value.clear();
      relationController.value.clear();
      amountController.value.clear();
      imageFileList.value.clear();
      pdfFileList.value.clear();
      // commentController.value.clear();
    }
  }

  void updateSelectedGender(gender) {
    selectedGender.value = gender!;
  }

  void pickFile() async {
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      List<String> paths = selectedImages.map((image) => image.path).toList();

      imageFileList.addAll(paths);
    }
  }

  void removeImage(int index) {
    imageFileList.removeAt(index);
  }

  void pickPDF() async {
    final FilePickerResult? result = await filepicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      List<String> paths = result.paths.map((path) => path!).toList();

      pdfFileList.addAll(paths);
    }
  }

  selectDateTime(BuildContext context) async {
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
      SelectedDate = selectedDate;
      datecontroller.value.text = myFormat.format(picked);
      DateTime utcDate = picked.toUtc();
      String isoDate = utcDate.toIso8601String();
      print('isoo Date ${isoDate}');
    }
  }

  void removePdf(int index) {
    pdfFileList.removeAt(index);
  }

  getAllCrowdFundings() async {
    try {
      loading.value = true;
      var resData = await AuthServices().getAllCrowFundings();
      Map<String, dynamic> response = json.decode(resData.body);
      if (response['status']['success'] == true) {
        AllCrowdFundings = response['data'];
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
    }
  }

  getMyCrowdFundings() async {
    try {
      loading.value = true;
      var resData = await AuthServices().getMyCrowFundings();
      Map<String, dynamic> response = json.decode(resData.body);
      if (response['status']['success'] == true) {
        myCrwodFundings = response['data'];
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {
      loading.value = false;
    }
  }

  void DeleteCrowdFunding(id) async {
    try {
      var data = {'is_active': false, 'id': id};
      var result = await AuthServices().DeleteCrowdFunding(data);
      Map<String, dynamic> response = json.decode(result.body);
      if (response['status']['success'] == true) {
        Get.snackbar('Message', response['message']);
        Get.to(() => HomeScreen());
      } else {
        Get.snackbar('Message', response['message']);
      }
    } catch (e) {
      Get.snackbar('Message', e.toString());
    } finally {}
  }
}
