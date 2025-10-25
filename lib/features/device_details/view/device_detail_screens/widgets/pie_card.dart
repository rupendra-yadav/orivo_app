import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/helpers/number_formaters.dart';
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
  final TariffConsumptionData energyConsumptionModel;

  final LegendPosition legendPosition;

  @override
  Widget build(BuildContext context) {
    // Map<String, double> originalDataMap = {
    //   "On Peak":
    //       ((double.parse(energyConsumptionModel.breakdown[1].consumption) ??
    //                       0.0) *
    //                   100)
    //               .roundToDouble() /
    //           100,
    //   // Handle null with ?? 0.0
    //   "Off Peak":
    //       ((double.parse(energyConsumptionModel.breakdown[0].consumption) ??
    //                       0.0) *
    //                   100)
    //               .roundToDouble() /
    //           100,
    //   // Same for Off Peak
    //   "Normal":
    //       ((double.parse(energyConsumptionModel.breakdown[2].consumption) ??
    //                       0.0) *
    //                   100)
    //               .roundToDouble() /
    //           100,
    //   // Same for Normal
    // };

    final Map<String, double> originalDataMap = {};

    for (var period in energyConsumptionModel.breakdown) {
      originalDataMap[period.period] = period.consumption != null
          ? double.tryParse(period.consumption) ?? 0.0
          : 0.0;
    }

    Map<String, double> updatedDataMap = {};

// Updating the map with formatted keys
    originalDataMap.forEach((key, value) {
      // updatedDataMap['$key: $value'] = value;
      updatedDataMap['${_formatLabel(key)}: $value'] = value;
    });

    print(updatedDataMap);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 240.h,
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

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: PieChart(
                    dataMap: updatedDataMap,
                    animationDuration: const Duration(milliseconds: 800),
                    chartLegendSpacing: 32.w,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    colorList: colorList,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 35.w,
                    centerWidget: Container(
                      width: 77.w,
                      height: 77.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextView(
                              text: NumberFormater()
                                  .numberComma(number: totalCount),
                              textColor: Colors.black,
                              bold: true,
                              fontSize: 11,
                            ),
                            TextView(
                              text: "Total",
                              textColor: Colors.black,
                              fontSize: 10,
                              bold: true,
                            ),
                          ],
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Helper for nicer labels
String _formatLabel(String key) {
  switch (key.toLowerCase()) {
    case "normal":
      return "Normal";
    case "off_peak":
      return "Off Peak";
    case "on_peak":
      return "On Peak";
    default:
      return key; // fallback (API may add new ones)
  }
}
