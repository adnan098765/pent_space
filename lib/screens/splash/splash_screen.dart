// ignore_for_file: unused_field, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/app_const.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/screens/onboarding/onboarding_screen.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../view_models/controller/getuserprofile/get_userprofile_view_model.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final getUserData = Get.put(GetUserDataController());

  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  void checkUserAuthentication() async {
    SharedPreferences spPref = await SharedPreferences.getInstance();
    String token = spPref.getString('authtoken').toString();
    getToken(token);
    Future.delayed(const Duration(seconds: 1), () {
      if (token != 'null') {
        getUserData.getUserData();
        Get.to(() => HomeScreen());
      } else {
        AppUtils.go(const OnBoardingScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WebsafeSvg.asset(logoSvg, height: 9.w),
            Padding(padding: EdgeInsets.only(top: 1.h)),
            Text(
              "PentSpace",
              style: TextStyle(
                color: AppPallet.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w800,
              ),
            )
          ],
        ),
      ),
    );
  }
}
