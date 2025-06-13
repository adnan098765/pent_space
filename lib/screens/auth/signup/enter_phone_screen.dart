import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/core/utils/navigation_service.dart';
import 'package:pent_space/screens/auth/signup/signup_notifier.dart';
import 'package:pent_space/screens/auth/signup/verify_phone_screen.dart';
import 'package:pent_space/widgets/input_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:websafe_svg/websafe_svg.dart';

final selectedCountryStateProvider =
    StateProvider<CountryCode>((ref) => CountryCode(name: "Nigeria"));

class EnterPhoneScreen extends ConsumerWidget {
  const EnterPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(signupChangeProvider);
    final selectedCountryProvider =
        ref.watch(selectedCountryStateProvider.notifier);
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
                  NavigationService.instance.goback();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 19.sp,
                    color: AppPallet.textColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Center(
                      child: Text(
                        "Enter Phone Number",
                        style: TextStyle(
                          color: AppPallet.textColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                    Text(
                      "Please enter your information below in order to create your account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppPallet.lightTextColor,
                        fontSize: 11.sp,
                        height: 0.17.h,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.h)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        children: [
                          InputWidget(
                            icon: Row(
                              children: [
                                CountryListPick(
                                  theme: CountryTheme(
                                    isShowFlag: true,
                                    isShowTitle: false,
                                    isShowCode: true,
                                    isDownIcon: true,
                                    showEnglishName: true,
                                    labelColor: AppPallet.textColor,
                                  ),
                                  initialSelection: '+234',
                                  onChanged: (CountryCode? code) {
                                    selectedCountryProvider.state =
                                        code as CountryCode;
                                  },
                                ),
                                Container(
                                  height: 3.h,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: AppPallet.lightTextColor,
                                        width: 0.2.w,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            hint: '123 456 7890',
                          ),
                          Padding(padding: EdgeInsets.only(top: 4.h)),
                          GestureDetector(
                            onTap: () {
                              AppUtils.go(const VerifyPhoneScreen());
                            },
                            child: Container(
                              width: double.infinity,
                              height: 5.5.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppPallet.textColor,
                                borderRadius: BorderRadius.circular(1.5.w),
                              ),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: AppPallet.whiteTextColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2.h)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
