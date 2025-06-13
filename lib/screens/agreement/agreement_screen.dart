// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pent_space/screens/onboarding/onboarding_screen.dart';

import '../../core/const/app_const.dart';
import '../../core/const/colors.dart';
import '../auth/signup/ServiceProviderRegistration.dart';
import '../auth/signup/complete_signup.dart';

class AgreementScreen extends StatefulWidget {
  AgreementScreen({Key? key}) : super(key: key);
  @override
  State<AgreementScreen> createState() => _AgreementScreenState();
}

class _AgreementScreenState extends State<AgreementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Terms and Condition',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //           ImageAssets.backgroundimage,
        //         ),
        //         fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              80.verticalSpace,
              Container(
                height: 0.83.sh,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                width: 0.9.sw,
                child: Column(
                  children: [
                    20.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: 0.8.sh,
                        height: 0.80.sh,
                        child: SingleChildScrollView(
                          child: Text(
                            'Below are terms and conditions of use (“Terms of Use”) which guide the use of our website, www.pentspaceonline.com, owned and controlled by Pentspace, Inc. We hereby advise that you comply with the terms and conditions of use, as this will guarantee the use of the site. If you do not agree to be bound by the Terms of Use, promptly exit this Site. The content of this agreement can be revised or modified at any point in time without the prior notice of the user, so we advise that you go through this regularly for any change or modification in the terms of use. \n\n Pentspace does not provide services. All service providers using this platform are independent of Pentspace and don’t have any affiliation with any service provider. Pentspace is not liable for any professional advice or service provided by any service provider using this platform, including products and services that any service provider might offer. Please note that you bear full responsibility for all information and services provided by service providers using this portal. \n\n HOW IT WORKS \n\n Upon registration, the platform allows you (the service user) to access services and products of your choice at any location in the world. As a service provider, you also have access to millions of people all over the world who might need your goods or services. \n\n   Kindly register with your correct information and details. All users’ information is treated with a high level of confidentiality. You are not permitted to use any person'
                            's details, or log-in details to access service on this portal. Pentspace reserves the right to cancel any application it deems fit without any prior explanation. \n\n RESOLVING A DISPUTE \n\n If the user disagrees with any of the registered clinics providing dental services, we can resolve the dispute if the disagreement is brought to our attention via our customer service unit. However, if the dispute cannot be resolved by us, either party(complainant and service provider) is free to settle in or out of court within their jurisdiction.',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.white),
                              ),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 25.0),
                            ),
                          ),
                          onPressed: () {
                            Get.offAll(OnBoardingScreen());
                          },
                          child: Text(
                            'Reject',
                            style: TextStyle(color: Colors.black),
                          ))),
                  Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              AppPallet.textColor,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                  color: AppPallet.textColor,
                                ),
                              ),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 25.0),
                            ),
                          ),
                          onPressed: () {
                            if (UserRole == 'BUSINESS') {
                              Get.to(() => ServiceProvideRegister());
                            } else {
                              Get.to((CompleteSignup()));
                            }
                          },
                          child: Text(
                            'Accept',
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
