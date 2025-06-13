import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/home/home_notifier.dart';
import 'package:pent_space/screens/home/widgets/services_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../core/const/colors.dart';
import '../../../view_models/toogle_feeds_view_model/toogle_feeds.dart';
import '../create_services/create_services_view_model.dart';

class NearByServices extends StatefulWidget {
  const NearByServices({Key? key}) : super(key: key);

  @override
  State<NearByServices> createState() => _NearByServicesState();
}

class _NearByServicesState extends State<NearByServices> {
  final homecontroller = Get.put(HomeController());
  final feedController = Get.put(FeedController());
  final serviceVM = Get.put(ServicesViewModel());

  bool showCityServices = false;
  bool showStateServices = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppPallet.textColor,
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.8.w),
            child: SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                        feedController.showFeeds.value = true;
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      )),
                  Text(
                    'PentSpace',
                    style: TextStyle(
                      color: AppPallet.whiteTextColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container()
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Nearby Services',
              style: TextStyle(
                color: AppPallet.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(
                    () => serviceVM.loading.value
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                  child: Column(
                    children: [
                      serviceVM.allnearbyServices['exact_matches'].length!=0?
                      _buildGrid(serviceVM.allnearbyServices['exact_matches'], 'Nearby')
                       :Text("No Services Found Near You"),
                      SizedBox(height: 20),
                      if (!showCityServices)
                        _buildShowMoreButton(() {
                          setState(() {
                            showCityServices = true;
                          });
                        }, 'Show More'),
                      if (showCityServices)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Services in your City'),
                            serviceVM.allnearbyServices['city_matches'].length!=0?
                            _buildGrid(serviceVM.allnearbyServices['city_matches'], 'City')
                             :Text("No Services Found In Your City"),
                            SizedBox(height: 20),
                            if (!showStateServices)
                              _buildShowMoreButton(() {
                                setState(() {
                                  showStateServices = true;
                                });
                              }, 'Show More'),
                          ],
                        ),
                      if (showStateServices)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            _buildSectionTitle('Services in your State'),
                            serviceVM.allnearbyServices['state_matches'].length!=0?
                            _buildGrid(serviceVM.allnearbyServices['state_matches'], 'State')
                                :Text("No Services Found In Your State"),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGrid(List<dynamic> list, String label) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, index) {
        return ServicesWidget(
          serviceData: list[index], // Replace this later with city/state list
        );
      },
    );
  }

  Widget _buildShowMoreButton(VoidCallback onPressed, String label) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallet.textColor,
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          color: AppPallet.textColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
