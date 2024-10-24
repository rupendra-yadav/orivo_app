import 'package:auro/features/device_details/view/device_detail_screens/widgets/multilene_voltage_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/pf_detail_modle.dart';
import '../../model/voltage_detail_model.dart';
import 'multi_line_total_power_factor_graph.dart';

class VoltageCard extends StatelessWidget {
  const VoltageCard({
    super.key,
    required this.voltageDetailModel,

  });

  final VoltageDetailModel voltageDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: TTexts.voltage,
              fontSize: 20,
              bold: true,
            ),

            TextView(
              text:voltageDetailModel.volt?.value?.toStringAsFixed(2) ?? "0.0",
              fontSize: 30,
              bold: true,
              textColor: TColors.green,
            ),

            TextView(
              text:"Average Voltage ------ ${voltageDetailModel.avgVolt?.value?.toStringAsFixed(2) ?? "0.0"}",
              fontSize: 20,
              bold: true,
            ),

            ///Multile Graph
        MultiLineVoltageGraph(onPeakGraph: voltageDetailModel.voltageTimeline?.value ?? []),

        ],
        ),
      ),
    );
  }
}