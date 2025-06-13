import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static getStyles() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppPallet.whiteTextColor,
        isDense: true,
        hintStyle: TextStyle(
          color: const Color(0xFF5C5C5C),
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 4.w,
          horizontal: 4.8.w,
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppPallet.borderInputColor, width: 0.2.w),
          borderRadius: BorderRadius.circular(1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPallet.textColor, width: 0.2.w),
          borderRadius: BorderRadius.circular(1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppPallet.textColor, width: 0.2.w),
          borderRadius: BorderRadius.circular(1.w),
        ),
      ),
      primarySwatch: Colors.blue,
    );
  }
}
