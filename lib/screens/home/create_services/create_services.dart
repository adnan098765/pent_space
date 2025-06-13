// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../core/const/colors.dart';
import '../../../core/const/svg_const.dart';
import '../../../core/utils/app_utils.dart';
import '../../../view_models/imagepicker/image_picker_view_model.dart';
import '../../../widgets/input_widget.dart';
import '../../../widgets/loader.dart';
import '../../mapscreen/map_screen.dart';
import 'create_services_view_model.dart';

class CreateServices extends StatefulWidget {
  const CreateServices({Key? key}) : super(key: key);

  @override
  State<CreateServices> createState() => _CreateServicesState();
}

class _CreateServicesState extends State<CreateServices> {
  final ServiceVM = Get.put(ServicesViewModel());
  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());

  String _country = 'Nigeria';

  TextEditingController locationController = new TextEditingController();

  LatLng selectedLocation = LatLng(0.0, 0.0);
  void selectLocation() async {
    LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapScreen(
          initialLocation: selectedLocation,
        ),
      ),
    );
    if (result != null) {
      // Get the address from the coordinates using reverse geocoding
      List<Placemark> placemarks =
          await placemarkFromCoordinates(result.latitude, result.longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String address = "${placemark.name}, ${placemark.locality}";
        // Save the selected location to SharedPreferences
        // controller.updateLocation(result.latitude, result.longitude);
        // Update the selected location and controllers
        setState(() {
          selectedLocation = result;
          locationController.text = address;
          ServiceVM.lat = result.latitude;
          ServiceVM.long = result.longitude;
          // latController.text = result.latitude.toString();
          // longController.text = result.longitude.toString();
        });
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ServiceVM.getServiceCategories();
    });

    imagepickercontroller.selectedImagePath = ''.obs;
    super.initState();
  }

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
                          'Create Services',
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
                                        width: 50.w,
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
                                                    'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2030&q=80',
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 2.h)),
                        InputWidget(
                          controller: ServiceVM.servicenameController.value,
                          label: "Service Name",
                          borderRadius: 1.w,
                          // icon: Icon(
                          //   Icons.person_outline,
                          //   color: AppPallet.textColor,
                          //   size: 15.sp,
                          // ),
                          hint: '',
                          obscure: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.3.w,
                          ),
                        ),
                        InputWidget(
                          controller: ServiceVM.descriptionController.value,
                          label: "Description",
                          borderRadius: 1.w,
                          // icon: Icon(
                          //   Icons.person_outline,
                          //   color: AppPallet.textColor,
                          //   size: 18.sp,
                          // ),
                          hint: '',
                          obscure: false,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 2.3.w,
                          ),
                        ),
                        // Padding(padding: EdgeInsets.only(top: 1.h)),
                        Text(
                          'Select Category',
                          style: TextStyle(
                            color: AppPallet.lightTextColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Obx(
                          () => Container(
                            width: 90.w,
                            height: 45,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppPallet.lightTextColor,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: ServiceVM.loading.value
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : DropdownButtonFormField(
                                      dropdownColor: Color(0xffe9f3ff),
                                      alignment: Alignment.topCenter,
                                      borderRadius: BorderRadius.circular(15),
                                      isDense: true,
                                      style: TextStyle(
                                          color: const Color(0xff747474),
                                          fontWeight: FontWeight.w400),
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Color(0xFF5C5C5C)),
                                      items: ServiceVM.ServicesName.map(
                                        (category) {
                                          return DropdownMenuItem(
                                            onTap: () {},
                                            value: category,
                                            child: Text(
                                              category.toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF5C5C5C),
                                              ),
                                            ),
                                          );
                                        },
                                      ).toList(),
                                      onChanged: (newValue) async {
                                        for (var i = 0;
                                            i < ServiceVM.allServices.length;
                                            i++) {
                                          if (ServiceVM.allServices[i]
                                                  ['name'] ==
                                              newValue) {
                                            ServiceVM.categoryid =
                                                ServiceVM.allServices[i]['id'];
                                          }
                                        }

                                        print('idd ${ServiceVM.categoryid}');
                                      },
                                      validator: (text) {
                                        if (text == null) {
                                          return 'Service Category';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        hintText: "Service Category",
                                        fillColor: Colors.white,
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF5C5C5C),
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 3.w,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                        ),
                        InputWidget(
                          controller: ServiceVM.streetController.value,
                          label: 'Street',
                          hint: 'Enter Your Street Address',
                        ),
                        InputWidget(
                          controller: ServiceVM.cityController.value,
                          label: 'City',
                          hint: 'Enter Your City',
                        ),
                        InputWidget(
                          controller: ServiceVM.stateController.value,
                          label: 'State',
                          hint: 'Your State',
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                        ),
                        Text(
                          'Select Country',
                          style: TextStyle(
                            color: AppPallet.lightTextColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          height: 5.2.h,
                          width: 90.w,
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
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                underline: Container(
                                  height: 0,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _country = newValue!;
                                    ServiceVM.selectedcountry = newValue;
                                    //createServiceProvider.country.value = newValue;
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 1.h),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.h)),
          Center(
            child: SafeArea(
              top: false,
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    ServiceVM.validations();
                  },
                  child: Container(
                    height: 5.h,
                    width: 80.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppPallet.textColor,
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: ServiceVM.iscreating.value
                        ? const Loader()
                        : Text(
                            'Create',
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
