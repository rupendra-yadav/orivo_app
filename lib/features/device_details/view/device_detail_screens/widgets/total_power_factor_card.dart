import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/power_quality_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../model/pf_model.dart';

class TotalPowerFactorsCard extends StatelessWidget {
  const TotalPowerFactorsCard({
    super.key,
    required this.powerFactorModel,
  });

  final PfModel powerFactorModel;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        height: 110.h,
        decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: GestureDetector(
          onTap: () => Get.to(() => const PowerQualityDetail()),
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
                      text: powerFactorModel.highestPf?.value?.toStringAsFixed(2) ?? 'NA',
                      fontSize: 25,
                      textColor: TColors.green,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,  // Explicit fixed width
                          height: 30,  // Explicit fixed height
                          child: SfLinearGauge(
                            minimum: 0,
                            maximum: 1,  // Set fixed range for gauge
                            interval: 0.2,
                            animateRange: true,
                            animateAxis: true,
                            showLabels: false,
                            showTicks: false,
                            barPointers: [
                              LinearBarPointer(
                                value:1,
                                thickness: 5,
                                edgeStyle: LinearEdgeStyle.bothCurve,
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
                                value: (powerFactorModel.highestPf?.value?.toDouble() ?? 0.0).isFinite
                                    ? powerFactorModel.highestPf?.value?.toDouble() ?? 0.0
                                    : 0.0,
                                shapeType: LinearShapePointerType.rectangle,
                                color: Colors.green[300],
                                elevation: 50,
                                width: 4,  // Fixed width for pointer
                                height: 20, // Fixed height for pointer
                              ),
                            ],
                          ),
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
              TextView(
                text: powerFactorModel.pf?.value?.toStringAsFixed(2) ?? 'NA',
              ),
            ],
          ),
        ),
      );




    /* Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      height: 110.h,
      decoration: BoxDecoration(
        color: TColors.primaryDark1,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: GestureDetector(
        onTap: () => Get.to(() => const PowerQualityDetail()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextView(
              text: TTexts.totalPowerFactors,
              bold: true,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextView(
                    text:
                        powerFactorModel.pf?.value?.toStringAsFixed(2) ?? 'NA',
                    fontSize: 25,
                    textColor: TColors.green,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200.w,
                        height: 30.h, // Adjust as needed
                        child: SfLinearGauge(
                          minimum: 0,
                          maximum: (powerFactorModel.pf?.value?.toDouble() ??
                                      0.0)
                                  .isFinite
                              ? powerFactorModel.pf?.value?.toDouble() ?? 0.0
                              : 1.0,
                          interval: 0.2,
                          animateRange: true,
                          animateAxis: true,
                          showLabels: false,
                          showTicks: false,
                          barPointers: [
                            LinearBarPointer(

                              value: (powerFactorModel.pf?.value?.toDouble() ??
                                          0.0)
                                      .isFinite
                                  ? powerFactorModel.pf?.value?.toDouble() ??
                                      0.0
                                  : 0.0,
                              thickness: 5,
                              edgeStyle: LinearEdgeStyle.bothCurve,
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
                              value: (powerFactorModel.highestPf?.value
                                              ?.toDouble() ??
                                          0.0)
                                      .isFinite
                                  ? powerFactorModel.highestPf?.value
                                          ?.toDouble() ??
                                      0.0
                                  : 0.0,
                              shapeType: LinearShapePointerType.rectangle,
                              color: Colors.green[300],
                              elevation: 50,
                              width: 2.w,
                              // Adjusted width
                              height: 20.h, // Adjusted height
                            ),
                          ],
                        ),
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
            TextView(
                text: powerFactorModel.pf?.value?.toStringAsFixed(2) ?? 'NA'),
          ],
        ),
      ),
    );*/
  }
}
