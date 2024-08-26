import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../detali_pages/cost_estimate_detail.dart';
import '../home.dart';


class CostEstimateCard extends StatelessWidget {
  const CostEstimateCard({
    super.key,
    required this.totalCount,
  });

  final double totalCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () => Get.to(() => const CostEstimate()),
        child: Container(
            decoration: BoxDecoration(
              color: TColors.primaryDark1,
              borderRadius: BorderRadius.circular(10.r),
            ),
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 20.h, horizontal: 10.w),
              child: Column(
                children: [
                  const TextView(text: TTexts.costEstimation),

                  SizedBox(
                    height: 20.h,
                  ),

                  ///Pie Chart

                  PieChart(
                    dataMap: updatedDataMap2,
                    animationDuration:
                    const Duration(milliseconds: 800),
                    chartLegendSpacing: 32.w,
                    chartRadius:
                    MediaQuery.of(context).size.width / 3.2,
                    colorList: colorList2,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,

                    ringStrokeWidth: 10.w,
                    centerWidget: Container(
                      width: 87.w,
                      height: 87.w,
                      decoration: BoxDecoration(
                          color: TColors.primaryDark1,
                          borderRadius:
                          BorderRadius.circular(100.r)),
                      child: Center(
                        child: TextView(
                          text:
                          "${totalCount.toStringAsFixed(0)} Rs",
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    legendOptions: const LegendOptions(
                      showLegendsInRow: true,
                      legendPosition: LegendPosition.bottom,
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TColors.primaryLight1),
                    ),
                    chartValuesOptions:
                    const ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: false,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                      chartValueBackgroundColor:
                      TColors.primary,
                      decimalPlaces: 1,
                    ),
                    // gradientList: ---To add gradient colors---
                    // emptyColorGradient: ---Empty Color gradient---
                  )
                ],
              ),
            )),
      ),
    );
  }
}
