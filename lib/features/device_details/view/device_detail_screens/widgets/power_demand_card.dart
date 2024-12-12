import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/demand_estimate_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../model/demand_model.dart';
import 'custom_bars.dart';

class PowerDemandCard extends StatelessWidget {
  const PowerDemandCard({super.key,
    required this.demandModel,
    required this.totalLoad});

  final DemandModel demandModel;
  final String totalLoad;

  @override
  Widget build(BuildContext context) {

    double vall = demandModel.currentDemand?.value?.toDouble() ?? 0;
    double total = totalLoad != null ? double.parse(totalLoad) : 0;

    // double total = demandModel.currentDemand?.value?.toInt() ?? 1;


    double reVal =  ((vall / total) * 100).toDouble();
    double value = ((reVal / 100) * 33).toDouble();

    return GestureDetector(
      onTap: () => (Get.to(() => const DemandEstimateDetail(isNotify: false,))),
      child: Container(

        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const TextView(
                  text: TTexts.demand,
                  bold: true,
                  fontSize: 20,
                ),
              ),

              SfRadialGauge(
                axes: <RadialAxis>[RadialAxis(
                  showTicks: true,
                  showLabels: true,
                  canScaleToFit: true,
                  radiusFactor:0.65.r,
                  axisLineStyle: const AxisLineStyle(thickness: 20,cornerStyle: CornerStyle.bothCurve),
                  minimum: 0,
                  maximum: /*demandModel.currentDemand?.value?.toDouble() ?? 1*/total,
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
                      value: /*demandModel.avgDemand?.value?.toDouble() ?? 0*/vall,
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
                        needleLength: 0.78,
                        value:/* demandModel.avgDemand?.value?.toDouble() ?? 0*/vall,
                        enableAnimation: true,
                        animationType: AnimationType.easeOutBack),],
                )
                ],
              ),

              Center(
                child: TextView(
                  text: "${demandModel.currentDemand?.value?.toString() ?? "NA"} ${demandModel.currentDemand?.unit?.toString() ?? "NA"}",

                  bold: true,
                  fontSize: 35,
                ),
              ),

              /*SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomBar(
                        max: 33,
                        value: value,
                      ),
                    ),
                    // Other widgets can be added here
                  ],
                ),
              ),*/
              const SizedBox(height: 8),
              Center(
                child: TextView(
                  text: "Avg Demand : ${demandModel.avgDemand?.value?.round().toString() ??
                          '0'} ${demandModel.avgDemand?.unit?.toString() ?? ''}",
                  // Ensure unit is also handled
                  bold: false,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
