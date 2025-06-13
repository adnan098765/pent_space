import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/screens/explore/crowd_funding/crowdfunding_donation_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pent_space/utils/helpers.dart';

class CrowdFundingDonationScreen extends StatefulWidget {
  final data;
  CrowdFundingDonationScreen({Key? key, this.data}) : super(key: key);

  @override
  _CrowdFundingDonationScreenState createState() =>
      _CrowdFundingDonationScreenState();
}

class _CrowdFundingDonationScreenState
    extends State<CrowdFundingDonationScreen> {
  final donationController = Get.put(CrowdFundingDonationController());
  final Uri _url = Uri.parse(
      'https://q87nmhz7-3000.euw.devtunnels.ms/payment?client_secret=pi_3PWo5yIebYoHkpTy0MUW88UK_secret_SmYHnVhKXVI1lAe2IHWC0Fivi');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void initState() {
    donationController.crowdfundingid = widget.data['crowd_funding_id'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 2.4.h, horizontal: 4.8.w),
            child: SafeArea(
              bottom: false,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppPallet.textColor,
                        size: 14.sp,
                      ),
                    ),
                    Text(
                      'Donation',
                      style: TextStyle(
                        color: AppPallet.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.w),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 1.5.h)),
              ]),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 1.h)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 1.h)),
                Expanded(
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                    children: [
                      Text(
                        'Donation for',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 3.h)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppPallet.whiteBackground,
                          borderRadius: BorderRadius.circular(2.w),
                          boxShadow: [
                            BoxShadow(
                              color: AppPallet.inputBorderColor,
                              offset: const Offset(0, 0),
                              blurRadius: 6.w,
                              spreadRadius: 0.w,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 15.w,
                              width: 15.w,
                              margin: EdgeInsets.only(right: 4.w),
                              decoration: BoxDecoration(
                                color: AppPallet.greyBackgroundColor,
                                borderRadius: BorderRadius.circular(2.w),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    cleanUrl('${widget.data['crowd_funding_image']}'),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${widget.data["title"]}',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 3.h)),
                      Text(
                        'Payment info',
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 3.h)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppPallet.whiteBackground,
                          borderRadius: BorderRadius.circular(2.w),
                          boxShadow: [
                            BoxShadow(
                              color: AppPallet.inputBorderColor,
                              offset: const Offset(0, 0),
                              blurRadius: 6.w,
                              spreadRadius: 0.w,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Donation Amount',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 1.h)),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(right: 5.w)),
                                  Expanded(
                                    child: TextField(
                                      controller: donationController
                                          .donationController.value,
                                      onChanged: (text) {
                                        // exploreNotifier.setDonation("0");
                                      },
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: 'Enter',
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 2.4.w,
                                          vertical: 0.7.h,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppPallet.textColor,
                                            width: 0.4.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(1.4.w),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppPallet.textColor,
                                            width: 0.4.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(1.4.w),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppPallet.textColor,
                                            width: 0.4.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(1.4.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(right: 5.w)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.h)),
                      RichText(
                        text: TextSpan(
                          text:
                              'By continuing, I represent that I have read, understand, and fully agree to the PentSpace',
                          style: TextStyle(
                            color: AppPallet.textColor,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w300,
                            height: 0.15.h,
                          ),
                          children: [
                            TextSpan(
                              text: ' terms of service ',
                              recognizer: TapGestureRecognizer(),
                              style: TextStyle(
                                color: AppPallet.lightRedTextColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const TextSpan(text: 'and '),
                            TextSpan(
                              text: ' privacy policy.',
                              recognizer: TapGestureRecognizer(),
                              style: TextStyle(
                                color: AppPallet.lightRedTextColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 2.h)),
                      Obx(
                        () => GestureDetector(
                          onTap: () {
                            // exploreNotifier.fundPfoject(widget.data);
                            donationController.validation();
                            // _launchUrl();
                          },
                          child: Center(
                            child: SafeArea(
                              top: false,
                              child: Container(
                                height: 5.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppPallet.buttonColor,
                                  borderRadius: BorderRadius.circular(1.w),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppPallet.greyTextColor,
                                      offset: const Offset(0, 0),
                                      blurRadius: 2.w,
                                      spreadRadius: -0.5.w,
                                    )
                                  ],
                                ),
                                child: donationController.loading.value
                                    ? CupertinoActivityIndicator(
                                        color: AppPallet.whiteTextColor)
                                    : Text(
                                        'CONFIRM',
                                        style: TextStyle(
                                          color: AppPallet.whiteTextColor,
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
