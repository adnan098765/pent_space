// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace, must_be_immutable

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pent_space/widgets/loader.dart';
import '../../../core/const/colors.dart';
import '../../../view_models/controller/verifyotp/verify_otp_view_model.dart';

class VerifyOppScreen extends StatefulWidget {
  bool isresetpass = false;
  VerifyOppScreen({Key? key, this.isresetpass = false}) : super(key: key);

  @override
  State<VerifyOppScreen> createState() => _VerifyOppScreenState();
}

class _VerifyOppScreenState extends State<VerifyOppScreen> {
  final verfyotpVM = Get.put(VerifyOtpViewModel());
  bool complete = false;
  final int _duration = 10;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.whiteBackground,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                100.verticalSpace,
                Text(
                  "OTP Code",
                  style: TextStyle(
                    color: AppPallet.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                40.verticalSpace,
                Text(
                  "Please enter the one time passcode sent",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppPallet.lightTextColor,
                    fontSize: 16,
                    height: 0.17.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                80.verticalSpace,
                OTPTextField(
                  // controller: verfyotpVM.otpcontroller.value,
                  length: 4,
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  width: 0.8.sw,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  contentPadding: EdgeInsets.symmetric(vertical: 2),
                  fieldStyle: FieldStyle.box,
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Colors.white,
                    // borderColor: AppColor.primaryButtonColor,
                    enabledBorderColor: Colors.grey,
                    disabledBorderColor: Colors.grey,
                    focusBorderColor: Colors.grey,
                  ),
                  outlineBorderRadius: 5.r,
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (value) {
                    verfyotpVM.otpcode = value;

                    // pin = value;
                    // Get.to(() => createProfileScreen());
                  },
                ),
                80.verticalSpace,
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      verfyotpVM.VerifyOtp(widget.isresetpass);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 0.06.sh,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppPallet.textColor,
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      child: verfyotpVM.loading.value
                          ? Loader()
                          : Text(
                              'Continue',
                              style: TextStyle(
                                color: AppPallet.whiteTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                50.verticalSpace,
                complete == true
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _controller.start();
                            complete = false;
                          });

                          verfyotpVM.ResendOtp();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Code didnt receive?',
                              style: TextStyle(
                                color: AppPallet.lightTextColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 2.w)),
                            Text(
                              'Resend',
                              style: TextStyle(
                                color: AppPallet.textColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(),
                50.verticalSpace,
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: const Offset(0, 1),
                            color: const Color(0xff000029).withOpacity(0.20),
                            blurRadius: 10) //blur radius of shadow
                      ],
                    ),
                    child: CircularCountDownTimer(
                      // Countdown duration in Seconds.
                      duration: _duration,

                      // Countdown initial elapsed Duration in Seconds.
                      initialDuration: 0,

                      // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                      controller: _controller,

                      // Width of the Countdown Widget.
                      width: 140,

                      // Height of the Countdown Widget.
                      height: 140.h,

                      // Ring Color for Countdown Widget.
                      ringColor: Colors.transparent,

                      // Ring Gradient for Countdown Widget.
                      ringGradient: null,

                      // Filling Color for Countdown Widget.
                      fillColor: Colors.grey,

                      // Filling Gradient for Countdown Widget.
                      fillGradient: null,

                      // Background Color for Countdown Widget.
                      backgroundColor: Colors.white,

                      // Background Gradient for Countdown Widget.
                      backgroundGradient: null,

                      // Border Thickness of the Countdown Ring.
                      strokeWidth: 8.0,

                      // Begin and end contours with a flat edge and no extension.
                      strokeCap: StrokeCap.round,

                      // Text Style for Countdown Text.
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),

                      // Format for the Countdown Text.
                      textFormat: CountdownTextFormat.MM_SS,

                      // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                      isReverse: false,

                      // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                      isReverseAnimation: false,

                      // Handles visibility of the Countdown Text.
                      isTimerTextShown: true,

                      // Handles the timer start.
                      autoStart: true,

                      // This Callback will execute when the Countdown Starts.
                      onStart: () {
                        // Here, do whatever you want
                        debugPrint('Countdown Started');
                      },

                      // This Callback will execute when the Countdown Ends.
                      onComplete: () {
                        // Here, do whatever you want
                        print("object1212");
                        setState(() {
                          complete = true;
                        });
                        // getOtp(context);
                        debugPrint('Countdown Ended');
                      },

                      // This Callback will execute when the Countdown Changes.
                      onChange: (String timeStamp) {
                        // Here, do whatever you want
                        debugPrint('Countdown Changed $timeStamp');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
