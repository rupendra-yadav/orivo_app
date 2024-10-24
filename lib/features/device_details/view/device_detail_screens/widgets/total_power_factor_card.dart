import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/power_quality_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../model/pf_model.dart';
import '../model/power_factor_model.dart';

class TotalPowerFactorsCard extends StatelessWidget {
  const TotalPowerFactorsCard({
    super.key, required this.powerFactorModel,
  });

  final PfModel powerFactorModel;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () => (Get.to(() => const PowerQualityDetail())),
        child: Container(
          decoration: BoxDecoration(
            color: TColors.primaryDark1,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextView(
                  text: TTexts.totalPowerFactors,
                  bold: true,
                ),
                Row(
                  children: [
                     Expanded(
                        flex: 1,
                        child: TextView(
                          text: (powerFactorModel.pf?.value?.toString() ?? '0.0'),
                          fontSize: 25,
                          textColor: TColors.green,
                        )),
                    // SizedBox(width: 20.w,),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SfLinearGauge(
                            minimum: 0,
                            maximum: 100,
                            animateRange: true,
                            animateAxis: true,
                            showLabels: false,
                            // Hide the scale values (labels)
                            showTicks: false,
                            // Hide the scale pointers (ticks)
                            barPointers: [
                              LinearBarPointer(
                                value: (powerFactorModel.pf?.value?.toDouble() ?? 0.0),
                                // Set the value for the pointer
                                thickness: 10,
                                // Adjust the thickness of the bar
                                edgeStyle: LinearEdgeStyle.bothCurve,
                                // Apply curved edges if needed
                                shaderCallback: (bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Colors.red,
                                      Colors.yellow,
                                      Colors.green,
                                    ],
                                  ).createShader(bounds);
                                },
                              ),
                            ],
                            markerPointers: [
                              LinearShapePointer(
                                value:(powerFactorModel.pf?.value?.toDouble() ?? 0.0),
                                // Position of the marker
                                shapeType: LinearShapePointerType.rectangle,
                                // Shape of the marker
                                color: Colors.green[300],
                                // Color of the marker
                                elevation: 50,
                                width: 2.w,
                                height: 20.h, // Adds shadow to the marker
                                // Size of the marker
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              TextView(text: TTexts.bad),
                              Spacer(),
                              TextView(text: TTexts.good),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TextView(text: powerFactorModel.pf?.value?.toStringAsFixed(4) ?? '0.0'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
