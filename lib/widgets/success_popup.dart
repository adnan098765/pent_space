import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:sizer/sizer.dart';

class SuccessPopup extends StatefulWidget {
  const SuccessPopup({Key? key}) : super(key: key);

  @override
  _SuccessPopupState createState() => _SuccessPopupState();
}

class _SuccessPopupState extends State<SuccessPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            Positioned.fill(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: const Color(0x99222222),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 40.w,
                height: 40.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppPallet.whiteBackground,
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: Text(
                  'Success',
                  style: TextStyle(
                    color: const Color(0xFF009900),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
