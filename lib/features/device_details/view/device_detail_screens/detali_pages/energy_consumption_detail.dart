import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart' as pie_chart;
import 'package:syncfusion_flutter_charts/charts.dart' as syncfusion;
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/pie_card.dart';

class EnergyConsumptionDetail extends StatelessWidget {
  const EnergyConsumptionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DeviceCardDetailsAppBar(title: TTexts.energyConsumptionDetail),
        backgroundColor: TColors.primary,
        body: Padding(
          padding: SpacingStyle.paddingWithDefaultSpace,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: TColors.primaryDark1,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      child: const TextView(text: TTexts.dateRange),
                    ),
                  ),
                ),

                /// Pie chart below

                PieCard(
                  totalCount: 100,
                  legendPosition: pie_chart.LegendPosition.bottom,
                  showLegendsInRow: true,
                  onPressed: () => Get.to(() => const EnergyConsumptionDetail()),
                ),


                /// bar graphs below
                Container(
                  decoration: BoxDecoration(
                    color: TColors.primaryDark1,borderRadius: BorderRadius.circular(20.r)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///OnPeak
                        Row(
                          children: [
                            TextView(text: TTexts.onPeak),
                            TextView(text: TTexts.timeRange),

                          ],
                        ),
                        BarGraph(),
                        ///OfPeak
                        Row(
                          children: [
                            TextView(text: TTexts.offPeak),
                            TextView(text: TTexts.timeRange),

                          ],
                        ),
                        BarGraph(),
                        ///Normal
                        Row(
                          children: [
                            TextView(text: TTexts.normal),
                            TextView(text: TTexts.timeRange),

                          ],
                        ),
                        BarGraph(),
                      ],
                    ),
                  ),
                )



              ],
            ),
          ),
        ));
  }
}

class BarGraph extends StatelessWidget {
  const BarGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child:syncfusion.SfCartesianChart(
        borderWidth: 0,
        plotAreaBorderWidth: 0,
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(width: 0),  // Hide major tick lines
          axisLine: AxisLine(width: 0),  // Hide the x-axis line
        ),
        primaryYAxis: const NumericAxis(
          majorGridLines: MajorGridLines(width: 0),  // Hide major grid lines
          minorGridLines: MinorGridLines(width: 0),  // Hide minor grid lines
          axisLine: AxisLine(width: 0),  // Hide the y-axis line
          labelStyle: TextStyle(color: Colors.transparent),  // Hide y-axis labels
          majorTickLines: MajorTickLines(width: 0),  // Hide y-axis tick lines
        ),
        series: <CartesianSeries>[
          ColumnSeries<ChartSampleData, double>(
            dataSource: chartData,
            xValueMapper: (ChartSampleData data, _) => data.x,
            yValueMapper: (ChartSampleData data, _) => data.y,
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            color: TColors.barColors,
          ),
        ],
      ),
    );
  }
}
//Initialize the data source.
List<ChartSampleData > chartData = <ChartSampleData>[
  ChartSampleData(x: 1, y: 0.541),
  ChartSampleData(x: 2, y: 0.818),
  ChartSampleData(x: 3, y: 1.51),
  ChartSampleData(x: 4, y: 1.302),
  ChartSampleData(x: 5, y: 2.017),
  ChartSampleData(x: 6, y: 1.683),
];

class ChartSampleData {
  final double x;
  final double y;
  ChartSampleData({required this.x, required this.y});
}