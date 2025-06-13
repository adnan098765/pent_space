import 'package:flutter/material.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:sizer/sizer.dart';

class InputWidget extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialvalue;
  final bool obscure;
  final bool enabled;
  final TextInputType keyboard;
  final double? bottomPadding;
  final Widget? icon;
  final Widget? trailingIcon;
  final double? height;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final TextEditingController? controller;
  String? Function(String?)? validator;

  var readOnly;

  var onTap;
  InputWidget({
    Key? key,
    this.hint,
    this.initialvalue,
    this.label,
    this.controller,
    this.enabled = true,
    this.obscure = false,
    this.readOnly = false,
    this.onTap,
    this.bottomPadding,
    this.icon,
    this.borderRadius,
    this.height,
    this.contentPadding,
    this.trailingIcon,
    this.validator,
    this.keyboard = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: bottomPadding == null ? 2.h : bottomPadding!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: label != null ? true : false,
            child: Column(
              children: [
                Text(
                  '$label',
                  style: TextStyle(
                    color: AppPallet.lightTextColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppPallet.lightTextColor,
                width: 0.3.w,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 2.w),
            ),
            child: Row(
              children: [
                icon ?? Container(),
                Padding(padding: EdgeInsets.only(right: 2.w)),
                Expanded(
                  child: TextFormField(
                    initialValue: initialvalue,
                    validator: validator,
                    textInputAction: TextInputAction.done,
                    // keyboardType: TextInputType.phone,
                    onTap: onTap,
                    readOnly: readOnly,
                    controller: controller,
                    keyboardType: keyboard,
                    enabled: enabled,
                    style: TextStyle(
                      color: AppPallet.textColor,
                      fontSize: 11.sp,
                    ),
                    obscureText: obscure,
                    decoration: InputDecoration(
                      hintText: hint,
                      filled: true,
                      fillColor: AppPallet.whiteTextColor,
                      isDense: true,
                      hintStyle: TextStyle(
                        color: const Color(0xFF5C5C5C),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      contentPadding: contentPadding ??
                          EdgeInsets.symmetric(
                            vertical: 4.w,
                            horizontal: 0.w,
                          ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                trailingIcon ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
