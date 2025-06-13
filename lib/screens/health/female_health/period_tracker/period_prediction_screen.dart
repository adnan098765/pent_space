import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pent_space/core/const/colors.dart';
import 'package:pent_space/core/const/img_const.dart';
import 'package:pent_space/core/const/svg_const.dart';
import 'package:pent_space/core/utils/app_utils.dart';
import 'package:pent_space/screens/health/female_health/female_health_notifier.dart';
import 'package:pent_space/screens/health/female_health/period_tracker/new_period_record.dart';
import 'package:pent_space/screens/health/female_health/period_tracker/widgets/period_fertility_graph_widget.dart';
import 'package:pent_space/screens/health/workout/select_age_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PeriodPredictionScreen extends ConsumerWidget {
  const PeriodPredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(femaleHealthChangeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 100.w,
              color: AppPallet.textColor,
              padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
              alignment: Alignment.centerLeft,
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AppUtils.goBack();
                          },
                          child: WebsafeSvg.asset(healthMenuBackIcon,
                              width: 16.sp),
                        ),
                        Text(
                          'Period Prediction',
                          style: TextStyle(
                            color: AppPallet.whiteTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 8.h))
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.only(top: 13.h),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 4.8.w, vertical: 2.h),
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppPallet.whiteBackground,
                      border: Border.all(
                        color: const Color(0xFF262E3C),
                        width: 0.05.w,
                      ),
                      borderRadius: BorderRadius.circular(3.w),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10.w),
                          color: const Color(0x66cccccc),
                          blurRadius: 9.w,
                          spreadRadius: -4.w,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.4.w, vertical: 0.5.h),
                          color: const Color(0xFFEA5544),
                          child: Text(
                            'Saturday 2 July',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.8.w, vertical: 1.h),
                          child: Column(
                            children: [
                              Text(
                                'Today is \n day number 2 of \n your cycle',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Container(
                                width: 44.w,
                                height: 44.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 4.w,
                                    color: const Color(0xFFDFDFDF),
                                  ),
                                  borderRadius: BorderRadius.circular(22.w),
                                ),
                                alignment: Alignment.center,
                                child: Container(
                                    width: 20.w,
                                    height: 20.w,
                                    decoration: BoxDecoration(
                                      color: AppPallet.whiteBackground,
                                      borderRadius: BorderRadius.circular(10.w),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset.zero,
                                          color: const Color(0xFF444444),
                                          blurRadius: 9.w,
                                          spreadRadius: -4.w,
                                        )
                                      ],
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Today',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppPallet.textColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10.sp,
                                      ),
                                    )),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    AppUtils.go(const NewPeriodRecord());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.8.w, vertical: 0.6.h),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEA5544),
                                      borderRadius: BorderRadius.circular(2.w),
                                    ),
                                    child: Text(
                                      'Records',
                                      style: TextStyle(
                                        color: AppPallet.whiteTextColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
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
                  ),
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppPallet.whiteBackground,
                      border: Border.all(
                        color: const Color(0xFF262E3C),
                        width: 0.05.w,
                      ),
                      borderRadius: BorderRadius.circular(3.w),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset.zero,
                          color: const Color(0xFFcccccc),
                          blurRadius: 9.w,
                          spreadRadius: -4.w,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.4.w, vertical: 0.5.h),
                          color: const Color(0xFFEA5544),
                          child: Text(
                            'Pregnancy probability prediction',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.8.w, vertical: 1.h),
                            child: RichText(
                              text: TextSpan(
                                text: 'Your fertility today  ',
                                style: TextStyle(
                                  color: AppPallet.textColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: '4.6.%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const PeriodFertilityGraphWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 3.5.w,
                                height: 3.5.w,
                                margin: EdgeInsets.only(top: 0.2.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFBABABA),
                                  border: Border.all(
                                    width: 0.4.w,
                                    color: AppPallet.textColor,
                                  ),
                                  borderRadius: BorderRadius.circular(1.725.w),
                                ),
                                child: Text(
                                  'i',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 7.sp,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 2.w)),
                              Expanded(
                                child: Text(
                                  'If you don’t have a pregnancy preparation plan, Please take contraceptive measures',
                                  style: TextStyle(
                                    color: AppPallet.textColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 11.sp,
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
                  Padding(padding: EdgeInsets.only(top: 2.h)),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppPallet.whiteBackground,
                      border: Border.all(
                        color: const Color(0xFF262E3C),
                        width: 0.05.w,
                      ),
                      borderRadius: BorderRadius.circular(3.w),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset.zero,
                          color: const Color(0xFFcccccc),
                          blurRadius: 9.w,
                          spreadRadius: -4.w,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.4.w, vertical: 0.5.h),
                          color: const Color(0xFFEA5544),
                          child: Text(
                            'Symptom Prediction',
                            style: TextStyle(
                              color: AppPallet.whiteTextColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.h)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                          child: Text(
                            'The following symptoms may appear today',
                            style: TextStyle(
                              color: AppPallet.textColor,
                              fontWeight: FontWeight.w300,
                              fontSize: 11.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.8.w, vertical: 1.h),
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Row(
                                children: [
                                  Container(
                                    width: 8.w,
                                    height: 8.w,
                                    margin: EdgeInsets.only(right: 2.4.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.1.w,
                                        color: AppPallet.textColor,
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage(soreBreastImg),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Sore Brest',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Row(
                                children: [
                                  Container(
                                    width: 8.w,
                                    height: 8.w,
                                    margin: EdgeInsets.only(right: 2.4.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.1.w,
                                        color: AppPallet.textColor,
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage(diarrheaImg),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Diarrhea',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Row(
                                children: [
                                  Container(
                                    width: 8.w,
                                    height: 8.w,
                                    margin: EdgeInsets.only(right: 2.4.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.1.w,
                                        color: AppPallet.textColor,
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage(vomitImg),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Vomitting',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 2.h)),
                              Row(
                                children: [
                                  Container(
                                    width: 8.w,
                                    height: 8.w,
                                    margin: EdgeInsets.only(right: 2.4.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.1.w,
                                        color: AppPallet.textColor,
                                      ),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage(noAppetiteImg),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'No appetite',
                                    style: TextStyle(
                                      color: AppPallet.textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
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
        ],
      ),
    );
  }
}
