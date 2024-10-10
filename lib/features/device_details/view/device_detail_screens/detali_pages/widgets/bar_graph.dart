import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auro/utils/constant/colors.dart';

import '../../model/consumption_detail_graph_model.dart';  // Assuming this is your custom color import

class BarGraph extends StatelessWidget {
  const BarGraph({
    super.key, this.onPeakGraph,
  });

  final List<NormalGraph>? onPeakGraph;

  @override
  Widget build(BuildContext context) {

    List<ChartSampleData> chartData = <ChartSampleData>[];

// Assuming onPeakGraph is a List of data points
    onPeakGraph?.forEach((graph) {
      chartData.add(ChartSampleData(x: graph.y ?? 0.0, y: graph.x ?? ""));
    });



    return SizedBox(
      height: 90.h,
      child: SfCartesianChart(
        borderWidth: 0,
        plotAreaBorderWidth: 0,
        primaryXAxis: const CategoryAxis(  // Treat x-axis as categories (dates)
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(width: 0), // Hide major tick lines
          axisLine: AxisLine(width: 0), // Hide the x-axis line
        ),
        primaryYAxis: const NumericAxis(  // Numeric values on y-axis
          majorGridLines: MajorGridLines(width: 0), // Hide major grid lines
          axisLine: AxisLine(width: 0), // Hide the y-axis line
          majorTickLines: MajorTickLines(width: 0), // Hide y-axis tick lines
          labelStyle: TextStyle(color: Colors.transparent), // Hide y-axis labels
        ),
        series: <CartesianSeries>[
          ColumnSeries<ChartSampleData, String>(  // Use String for x values
            dataSource: chartData,  // Pass your chart data
            xValueMapper: (ChartSampleData data, _) => data.y,  // Map date to x
            yValueMapper: (ChartSampleData data, _) => data.x,  // Map numeric value to y
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            color: TColors.barColors,
          ),
        ],
      ),
    );
  }
}


class ChartSampleData {
  final double x;  // The numeric value (y-axis)
  final String y;  // The date (x-axis)

  ChartSampleData({required this.x, required this.y});
}
