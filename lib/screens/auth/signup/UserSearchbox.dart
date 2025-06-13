import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../core/const/colors.dart';
import '../../../core/utils/navigation_service.dart';
import '../../../view_models/toogle_feeds_view_model/toogle_feeds.dart';
import '../../../widgets/input_widget.dart';
import '../../../widgets/loader.dart';
import '../../home/create_services/create_services_view_model.dart';
import '../../mapscreen/map_screen.dart';

class UserSearchBox extends StatefulWidget {
  const UserSearchBox({Key? key}) : super(key: key);

  @override
  _UserSearchBoxState createState() => _UserSearchBoxState();
}

class _UserSearchBoxState extends State<UserSearchBox> {
  String? selectedCountry;
  TextEditingController locationController = new TextEditingController();
  final feedController = Get.put(FeedController());
  final streetController = TextEditingController().obs;
  final stateController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final ServiceVM = Get.put(ServicesViewModel());

  LatLng selectedLocation = LatLng(0.0, 0.0);

  @override
  void initState() {
    super.initState();

    // Initialize ServiceVM lat and long with default values
    ServiceVM.lat = selectedLocation.latitude;
    ServiceVM.long = selectedLocation.longitude;
  }

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
          print("Search Screen : "+result.toString());
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
  Widget build(BuildContext context) {
    String _country = 'Nigeria';
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
                  feedController.showFeeds.value = true;
                  NavigationService.instance.goback();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    SizedBox(width: 2),
                    Text(
                      "back",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Text(
                      "What are you looking for?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 1.h)),
                    Text(
                      "Enter three keywords the service you are searching for is likely to be known by.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 11.sp,
                        height: 0.17.h,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    InputWidget(
                      controller: ServiceVM.firstkeywordController.value,
                      label: 'First Keyword',
                      hint: 'Enter keyword',
                    ),
                    InputWidget(
                      controller: ServiceVM.secondkeywordController.value,
                      label: 'Second Keyword',
                      hint: 'Enter keyword',
                    ),

                    InputWidget(
                      controller: ServiceVM.thirdkeywordController.value,
                      label: 'Third Keyword',
                      hint: 'Enter keyword',
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
                                ServiceVM.selectedcountry =
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

                    Padding(padding: EdgeInsets.only(top: 4.h)),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          // if (ServiceVM.lat == null) {
                          //   Get.snackbar('Message', 'Please Select Location');
                          // } else {
                          //   ServiceVM.getAllServices();
                          // }
                          ServiceVM.getAllServices();
                          // notifier.register(true);
                          // AppUtils.go(UserSearchBox());
                          // feedController.showFeeds.value = false;
                          // Get.back();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 5.5.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppPallet.textColor,
                            borderRadius: BorderRadius.circular(1.5.w),
                          ),
                          child: ServiceVM.loading.value
                              ? const Loader()
                              : Text(
                                  'Search',
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
