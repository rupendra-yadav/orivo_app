import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../utils/constant/colors.dart';

class DemandTimelineGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(color: Colors.white),
        majorGridLines: MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(color: Colors.white),
        minimum: 10,
        maximum: 40,
        interval: 10,
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        minorTickLines: MinorTickLines(size: 0),
      ),
      series: <CartesianSeries>[
        LineSeries<ChartData, String>(
          dataSource: getChartData(),
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.demand,
          color: TColors.demandGraphLine,
          // Solid color for the line
          width: 3,
        ),
      ],
      plotAreaBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      borderWidth: 0,
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData('Jan', 18),
      ChartData('Feb', 25),
      ChartData('Mar', 22),
      ChartData('Apr', 30),
      ChartData('May', 28),
      ChartData('Jun', 35),
      ChartData('Jul', 25),
      ChartData('Aug', 30),
    ];
  }
}

class ChartData {
  ChartData(this.month, this.demand);

  final String month;
  final double demand;
}
