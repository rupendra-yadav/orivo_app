import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../utils/constant/colors.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child:SfCartesianChart(
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