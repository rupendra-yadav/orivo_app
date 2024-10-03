import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../home.dart';
import '../model/energy_consumption_model.dart';

class PieCard extends StatelessWidget {
  const PieCard({
    super.key,
    required this.totalCount,
    required this.legendPosition,
    required this.onPressed,
    this.showLegendsInRow = false,
    required this.energyConsumptionModel,
  });

  final double totalCount;
  final void Function() onPressed;
  final bool showLegendsInRow;
  final EnergyConsumptionModel energyConsumptionModel;

  final LegendPosition legendPosition;

  @override
  Widget build(BuildContext context) {
    Map<String, double> originalDataMap = {
      "On Peak": energyConsumptionModel.onPeakUnit?.value ?? 0.0,
      // Handle null with ?? 0.0
      "Off Peak": energyConsumptionModel.offPeakUnit?.value ?? 0.0,
      // Same for Off Peak
      "Normal": energyConsumptionModel.normalUnit?.value ?? 0.0,
      // Same for Normal
    };

    Map<String, double> updatedDataMap = {};

// Updating the map with formatted keys
    originalDataMap.forEach((key, value) {
      updatedDataMap['$key: $value'] = value;
    });

    print(updatedDataMap);



    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: TColors.primaryDark1,
            borderRadius: BorderRadius.circular(10.r),
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
            child: Column(
              children: [
                const TextView(text: TTexts.energyConsumption),

                SizedBox(
                  height: 20.h,
                ),

                ///Pie Chart

                PieChart(
                  dataMap: updatedDataMap,
                  animationDuration: const Duration(milliseconds: 800),
                  chartLegendSpacing: 32.w,
                  chartRadius: MediaQuery.of(context).size.width / 3.2,
                  colorList: colorList,
                  initialAngleInDegree: 0,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 32.w,
                  centerWidget: Container(
                    width: 87.w,
                    height: 87.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Center(
                      child: TextView(
                        text: "${totalCount.toStringAsFixed(2)}\nTotal",
                        textColor: Colors.black,
                      ),
                    ),
                  ),
                  legendOptions: LegendOptions(
                    showLegendsInRow: showLegendsInRow,
                    legendPosition: legendPosition,
                    showLegends: true,
                    legendShape: BoxShape.circle,
                    legendTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TColors.primaryLight1),
                  ),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValueBackground: true,
                    showChartValues: false,
                    showChartValuesInPercentage: false,
                    showChartValuesOutside: false,
                    chartValueBackgroundColor: TColors.primary,
                    decimalPlaces: 1,
                  ),
                  // gradientList: ---To add gradient colors---
                  // emptyColorGradient: ---Empty Color gradient---
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
