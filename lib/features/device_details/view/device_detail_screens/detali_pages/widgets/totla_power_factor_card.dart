import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/temperature_scale.dart';
import 'package:auro/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/base_metric_response_model.dart';
import '../../model/pf_detail_modle.dart';
import 'multi_line_total_power_factor_graph.dart';

class TotalPowerFactorCard extends StatelessWidget {
  const TotalPowerFactorCard({
    super.key,
    required this.pfDetailModel,
    required this.dateType,
  });

  final PowerQualityMetrics pfDetailModel;
  final int dateType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: TTexts.totalPowerFactors,
              fontSize: 20,
              bold: true,
            ),

            TextView(
              text: pfDetailModel.highestPf?.value?.toStringAsFixed(3) ?? "NA",
              fontSize: 30,
              bold: true,
              textColor: TColors.green,
            ),

            /// Temperature Scale

            TemperatureScale(
              totalValue: pfDetailModel.highestPf?.value ?? 0,
              pointerValue: pfDetailModel.highestPf?.value ?? 0,
            ),

            Row(
              children: [
                TextView(text: TTexts.bad),
                Spacer(),
                TextView(text: TTexts.good),
              ],
            ),

            TextView(
              text:
                  "Average P.F -----------  ${pfDetailModel.averagePf?.value?.toStringAsFixed(3) ?? "NA"}",
              fontSize: 20,
              bold: true,
            ),

            ///Multile Graph

            MultiLineTotalPowerFactorGraph(
              onPeakGraph: pfDetailModel.timeline ?? [],
              dateType: dateType,
            ),
          ],
        ),
      ),
    );
  }
}
