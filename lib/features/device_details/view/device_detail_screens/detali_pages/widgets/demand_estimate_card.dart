import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/demand_detail_model.dart';
import '../../widgets/custom_bars.dart';


class DemandEstimateCard extends StatelessWidget {
  const DemandEstimateCard({
    super.key,
    required this.demandDetailModel,
  });

  final DemandDetailModel demandDetailModel;

  @override
  Widget build(BuildContext context) {

    int vall = demandDetailModel.currentDemand?.value?.toInt() ?? 0;
    int total = demandDetailModel.highestDemand?.value?.toInt() ?? 1; // Set to 1 to avoid division by zero

    int reVal = (total != 0) ? ((vall / total) * 100).toInt() : 0;
    int value = ((reVal / 100) * 33).toInt();


    if (kDebugMode) {
      print("checkDemandValue");
      print(reVal);
      print(value);
    }


    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextView(text: TTexts.demandEstimate),
            SizedBox(
              height: 15.h,
            ),

            SizedBox(
              height: 10.h,
            ),

            SfRadialGauge(
              axes: <RadialAxis>[RadialAxis(
                showTicks: true,
                showLabels: true,
                canScaleToFit: true,
                radiusFactor:0.8.r,
                axisLineStyle: const AxisLineStyle(thickness: 20,cornerStyle: CornerStyle.bothCurve),
                minimum: 0,
                maximum: ((demandDetailModel.highestDemand?.value?.toDouble() ?? 1) != 0)
                    ? (demandDetailModel.highestDemand?.value?.toDouble() ?? 1)
                    : 1,
                axisLabelStyle: const GaugeTextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 12, // Optional: Set font size
                ),

                majorTickStyle: const MajorTickStyle(
                  length: 15, // Length of major ticks
                  thickness: 2, // Thickness of major ticks
                  color: Colors.white, // Optional: Set tick color
                ),
                minorTicksPerInterval: 4, // Number of minor ticks between each major tick
                minorTickStyle: const MinorTickStyle(
                  length: 8, // Length of minor ticks
                  thickness: 1, // Thickness of minor ticks
                  color: Colors.white, // Optional: Set tick color
                ),
tickOffset: 5,
                pointers:  <GaugePointer>[
                   RangePointer(
                    enableAnimation: true,
                    animationType: AnimationType.easeOutBack,
                    width: 20,
                    color: Color(0xFF00A8B5),
                    value: demandDetailModel.currentDemand?.value?.toDouble() ?? 0,
                     cornerStyle: CornerStyle.bothCurve, // Add rounded corners
                    gradient: SweepGradient(
                        colors: <Color>[Color(0xFFC4306E), Color(0xFFE5961E)],
                        stops: <double>[0.25, 0.75]),
                  ),

                  NeedlePointer(
                      knobStyle: KnobStyle(
                          color: TColors.white,
                          knobRadius: 15,
                          sizeUnit: GaugeSizeUnit.logicalPixel),
                      needleEndWidth:10,
                      needleStartWidth: 1,
                      needleColor:
                      TColors.dialColor,
                      needleLength: 0.89,
                      value: demandDetailModel.currentDemand?.value?.toDouble() ?? 0,
                      enableAnimation: true,
                      animationType: AnimationType.easeOutBack),],
                )
              ],
            ),


            Center(
              child: TextView(
                text:  "${demandDetailModel.currentDemand?.value?.round().toString() ??
                    '0'} ${demandDetailModel.currentDemand?.unit?.toString() ?? ''}",
                fontSize: 30,
                bold: true,
              ),
            ),

            SizedBox(height: 20.h,),
            TextView(
              text:  "Average Demand : ${demandDetailModel.avgDemand?.value?.toString() ?? "0"} ${demandDetailModel.avgDemand?.unit?.toString() ?? ''}",
              fontSize: 20,
              bold: true,
            ),

            /*SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomBar(
                    max: 33,
                    value: value,
                  ),
                  // Add more widgets here as needed
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}