import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../model/consumption_detail_model.dart';

class DetailPieCard extends StatelessWidget {
  const DetailPieCard({
    super.key,
    required this.totalCount,
    // required this.legendPosition,
    required this.onPressed,
    this.showLegendsInRow = false,
    required this.consumptionDetail,
  });

  final double totalCount;
  final void Function() onPressed;
  final bool showLegendsInRow;
  final ConsumptionDetail consumptionDetail;

  // final LegendPosition legendPosition;

  @override
  Widget build(BuildContext context) {
    Map<String, double> originalDataMap = {
      "On Peak": consumptionDetail.onPeakUnit?.value ?? 0.0,
      // Handle null with ?? 0.0
      "Off Peak": consumptionDetail.offPeakUnit?.value ?? 0.0,
      // Same for Off Peak
      "Normal": consumptionDetail.normalUnit?.value ?? 0.0,
      // Same for Normal
    };

    Map<String, double> updatedDataMap = {};

// Updating the map with formatted keys
    originalDataMap.forEach((key, value) {
      updatedDataMap['$key: $value'] = value;
    });

    if (kDebugMode) {
      print(updatedDataMap);
    }

    final List<ChartData> chartData = [
      ChartData('USA', 10, '80%', const Color(0xFFFEB546)),
      ChartData('INDIA', 11, '85%', const Color(0xFFFFC0BB)),
      ChartData('Russia', 9, '75%', const Color(0xFF344BFD)),
      ChartData('Germany', 10, '80%', const Color(0xFF00820D))
    ];


    infoDialog(BuildContext context) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        // Prevents closing the dialog by tapping outside
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: TColors.primaryDark1,
            insetPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            child:  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: TextView(text: TTexts.energyConsumption, textColor: TColors.white, fontSize: 18, bold: true,)),

                  SizedBox(height: 15.h,),

                  TextView(text: TTexts.timeOfDay, textColor: TColors.white, fontSize: 18, bold: true,),
                  SizedBox(height: 15.h,),
                  TextView(text: "1. ${TTexts.normalSlot}", textColor: TColors.white, fontSize: 18, bold: true,),
                  SizedBox(height: 5.h,),
                  Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.normalPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                  SizedBox(height: 15.h,),
                  TextView(text: "2. ${TTexts.offPeakSlot}", textColor: TColors.white, fontSize: 18, bold: true,),
                  SizedBox(height: 5.h,),
                  Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.offPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                  SizedBox(height: 15.h,),
                  TextView(text: '3. ${TTexts.onPeakSlot}', textColor: TColors.white, fontSize: 18, bold: true,),
                  SizedBox(height: 5.h,),
                  Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.onPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                  SizedBox(height: 20.h,),


                  /// Close OK
                  Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: TextView(text: TTexts.dialogOk, textColor: TColors.white, fontSize: 18, bold: true,),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: TColors.primaryDark1,
            borderRadius: BorderRadius.circular(20.r),
          ),
          width: double.infinity,
          child: Column(
            children: [
              // const TextView(text: TTexts.energyConsumption),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.w),
                child: InkWell(
                  onTap: () {
                    infoDialog(context);
                  },
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.info_outline,
                        color: TColors.white,
                      )),
                ),
              ),

              // SizedBox(
              //   height: 20.h,
              // ),

              ///Pie Chart

              /* PieChart(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        text: NumberFormater().numberComma(number:totalCount),
                        textColor: Colors.black,
                        bold: true,
                        fontSize: 11,
                      ),

                      TextView(
                        text: "Total",
                        textColor: Colors.black,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
                legendOptions: LegendOptions(
                  showLegendsInRow: showLegendsInRow,
                  // legendPosition: legendPosition.left,
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
              ),*/

              // SfCircularChart(
              //     series: <CircularSeries>[
              //       PieSeries<ChartData, String>(
              //           dataSource: chartData,
              //           xValueMapper: (ChartData data, _) => data.x,
              //           yValueMapper: (ChartData data, _) => data.y,
              //           // Radius for each segment from data source
              //           pointRadiusMapper: (ChartData data, _) => data.size,
              //
              //
              //         // Added pointRenderMode
              //         pointRenderMode: PointRenderMode.segment,
              //         dataLabelSettings: const DataLabelSettings(isVisible: false),
              //         enableTooltip: false, // Disable tooltip on tap.
              //         strokeWidth: 0, // Remove the stroke around the slices
              //
              //         // Apply border radius directly to the series
              //         dataLabelMapper: (ChartData data, _) => data.x, // Ensure dataLabelMapper is set if labels are used
              //         borderRadius: 10, // Enable the curved corner
              //
              //       )
              //     ]
              // ),

              SizedBox(
                width: 200.w, // Adjust as needed
                height: 200.h, // Adjust as needed
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Chart
                    SfCircularChart(
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          // Pass the data
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          pointRadiusMapper: (ChartData data, _) => data.size,
                          pointColorMapper: (ChartData data, _) => data.color,
                          cornerStyle: CornerStyle.bothFlat,
                          radius: '60%',
                          innerRadius: '30%',
                          dataLabelSettings:
                              DataLabelSettings(isVisible: false),
                          enableTooltip: false,
                        )
                      ],
                    ),

                    // Center Text
                    Container(
                      height: 77.h,
                      width: 77.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextView(
                              text: '6870',
                              textColor: TColors.textPrimary,
                              fontSize: 20,
                              bold: true,
                            ),
                            TextView(
                              text: 'Total',
                              textColor: TColors.textSecondary,
                              fontSize: 15,
                              bold: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///Custom Legend
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.h),
                                child: Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    color: TColors.multiGraphBarColor1,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Column(
                                children: [
                                  TextView(
                                    text: 'Normal',
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  TextView(
                                    text: '132456',
                                    bold: true,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.h),
                                child: Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    color: TColors.multiGraphBarColor2,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Column(
                                children: [
                                  TextView(
                                    text: 'Off Peak',
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  TextView(
                                    text: '132456',
                                    bold: true,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 4.h),
                                child: Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: BoxDecoration(
                                    color: TColors.multiGraphBarColor3,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Column(
                                children: [
                                  TextView(
                                    text: 'On Peak',
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  TextView(
                                    text: '132456',
                                    bold: true,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.size, this.color);

  final String x;
  final double y;
  final String size;
  final Color color;
}
