import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import 'multi_line_total_power_factor_graph.dart';

class VoltageCard extends StatelessWidget {
  const VoltageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: TTexts.voltage,
              fontSize: 20,
              bold: true,
            ),

            TextView(
              text: TTexts.powerQuality096,
              fontSize: 30,
              bold: true,
              textColor: TColors.green,
            ),

            TextView(
              text: TTexts.averagePF,
              fontSize: 20,
              bold: true,
            ),

            ///Multile Graph

            MultiLineTotalPowerFactorGraph(),
          ],
        ),
      ),
    );
  }
}