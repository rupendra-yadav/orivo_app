import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../detali_pages/cost_estimate_detail.dart';
import '../home.dart';
import '../model/cost_estimate_model.dart';


class CostEstimateCard extends StatelessWidget {
  const CostEstimateCard({
    super.key,
    required this.totalCount,
    required this.costEstimateModel,
  });

  final double totalCount;
  final CostEstimateModel costEstimateModel;

  @override
  Widget build(BuildContext context) {

    Map<String, double> originalDataMap = {
      "Energy": costEstimateModel.totalEnergyCost?.value ?? 0.0,
      "Govt": costEstimateModel.govCost?.value ?? 0.0,
      "Demand": costEstimateModel.demand?.value ?? 0.0,
     /* "Other": costEstimateModel.other?.value ?? 0.0,*/
    };

    Map<String, double> updatedDataMap = {};

    originalDataMap.forEach((key, value) {
      updatedDataMap['$key: $value'] = value;
    });

    print(updatedDataMap);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () => Get.to(() => const CostEstimate()),
        child: Container(
            height: 320.h,
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
                    dataMap: updatedDataMap,
                    animationDuration:
                    const Duration(milliseconds: 800),
                    chartLegendSpacing: 32.w,
                    chartRadius:
                    MediaQuery.of(context).size.width / 3.2,
                    colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,

                    ringStrokeWidth: 10.w,
                    centerWidget: Container(
                      width: 90.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          color: TColors.primaryDark1,
                          borderRadius:
                          BorderRadius.circular(100.r)),
                      child: Center(
                        child: TextView(
                          text:
                          "${totalCount.toStringAsFixed(2)} Rs",
                          textColor: Colors.white,
                          bold: true,
                          fontSize: 11,
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
final colorList = <Color>[
  const Color(0xff3dd598),
  const Color(0xff0062ff),
  const Color(0xffff974a),
  const Color(0xffffc542),
];
