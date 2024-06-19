import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constant/colors.dart';
class Insights extends StatelessWidget {
  const Insights({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithDefaultSpace,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextView(text: TTexts.alarms),
              const InsightCards(titleCard: TTexts.typesOfAlarm,),

              SizedBox(height: 30.h,),
              const TextView(text: TTexts.consumptionAnalysis),
              const InsightCards(titleCard: TTexts.daily,),
              const InsightCards(titleCard: TTexts.monthly,),
              const InsightCards(titleCard: TTexts.quarterly,),
              const InsightCards(titleCard: TTexts.yearly,),

              SizedBox(height: 30.h,),
              const TextView(text: TTexts.otherReports),
              const InsightCards(titleCard: TTexts.pfIncentive,),
              const InsightCards(titleCard: TTexts.loadFactorIncentive,),
              const InsightCards(titleCard: TTexts.tariffPlanUnderstanding,),
              const InsightCards(titleCard: TTexts.other,),
            ],
          ),
        ),
      ),
    );
  }
}

class InsightCards extends StatelessWidget {
  const InsightCards({
    super.key, required this.titleCard,
  });

  final String titleCard;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
      height: 50.h,
        decoration: BoxDecoration(color: TColors.primaryDark1,borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding:  EdgeInsets.only(left: 10.0.w),
          child: Row(
            children: [
              Text(titleCard,style: const TextStyle(color: TColors.primaryLight1),)
            ],
          ),
        ),
      ),
    );
  }
}
