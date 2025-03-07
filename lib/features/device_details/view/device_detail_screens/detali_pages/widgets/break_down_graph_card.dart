import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';


class BreakDownGraphCard extends StatelessWidget {
  const BreakDownGraphCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: SfCartesianChart(
          backgroundColor: TColors.primaryDark1,
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          ),
          primaryYAxis: NumericAxis(
            isVisible: false, // Hide the Y axis
            majorGridLines: const MajorGridLines(width: 0),  // Hide the major grid lines
            axisLine: const AxisLine(width: 0),  // Hides the axis line
            labelStyle: const TextStyle(color: Colors.transparent), // Hides the labels
          ),
          series: <StackedColumn100Series<ChartData, String>>[
            StackedColumn100Series<ChartData, String>(
              dataSource: [
                ChartData('M', 10),
                ChartData('M', 40),
                ChartData('T', 60),
                ChartData('W', 40),
                ChartData('W', 10),
                ChartData('T', 80),
                ChartData('F', 50),
                ChartData('F', 70),
                ChartData('S', 90),

                ChartData('Today', 30),
              ],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              color: TColors.graphBarColor,
              borderRadius: BorderRadius.circular(100.r),
              dataLabelSettings: const DataLabelSettings(isVisible: false),
            ),
          ],
        ),







        //
        // SfCartesianChart(
        //
        //   borderWidth: 0,
        //   plotAreaBorderWidth: 0,
        //
        //   title: const ChartTitle(
        //     text: TTexts.breakDownCardTitle,
        //     textStyle: TextStyle(
        //         color: Colors.white,
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold),
        //   ),
        //
        //   primaryXAxis: const CategoryAxis(
        //     labelStyle: TextStyle(color: Colors.white),
        //     majorGridLines: MajorGridLines(width: 0),
        //     axisLine: AxisLine(width: 0),
        //   ),
        //   primaryYAxis: const NumericAxis(
        //     isVisible: false, // Hide Y axis
        //   ),
        //
        //
        //   series: <SplineSeries<ChartData, String>>[
        //     SplineSeries<ChartData, String>(
        //       dataSource: getChartData(),
        //       xValueMapper: (ChartData data, _) => data.x,
        //       yValueMapper: (ChartData data, _) => data.y,
        //       color: TColors.downGraphLine,
        //       // Line color
        //       width: 4,
        //       markerSettings: const MarkerSettings(
        //         isVisible: false,
        //         color: TColors.downGraphLine,
        //         borderWidth: 2,
        //         borderColor: TColors.downGraphLine,
        //       ),
        //     ),
        //   ],
        //   tooltipBehavior: TooltipBehavior(
        //     enable: true,
        //     header: '',
        //     format: 'point.x : point.y hrs',
        //     textStyle: const TextStyle(color: Colors.white),
        //   ),
        // ),
      ),
    );
  }
}

List<ChartData> getChartData() {
  return [
    ChartData('Jan', 10),
    ChartData('Feb', 40),
    ChartData('Mar', 30),
    ChartData('April', 20),
    ChartData('May', 10),
  ];
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
