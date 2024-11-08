import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../utils/constant/colors.dart';
import '../../model/demand_value_modle.dart';

class DemandTimelineGraph extends StatelessWidget {
  const DemandTimelineGraph({super.key, this.timeline});

  final List<Value>? timeline;

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = <ChartData>[];

    timeline?.forEach((graph) {
      chartData.add(ChartData(
        x: graph.y ?? 0.0,
        y: DateTime.parse(graph.x ?? ""),
      ));
    });

    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: DateTimeAxis(
        interval: 1,
        dateFormat: DateFormat('dd/MM'),
        labelStyle: const TextStyle(color: Colors.white),
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
        autoScrollingDelta: 5,
        autoScrollingMode: AutoScrollingMode.start,
      ),
      primaryYAxis: const NumericAxis(
        labelStyle: TextStyle(color: Colors.white),
        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        minorTickLines: MinorTickLines(size: 0),
      ),

      zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        zoomMode: ZoomMode.x,
      ),
      series: <CartesianSeries>[
        LineSeries<ChartData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.y,
          yValueMapper: (ChartData data, _) => data.x,
          color: TColors.demandGraphLine,
          width: 3,
        ),
      ],
      plotAreaBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      borderWidth: 0,
      tooltipBehavior: TooltipBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        // Show tooltip on tap
        shouldAlwaysShow: true,
        // Keeps tooltip visible after tap
        header: '',
        format: 'point.y on point.x',
        // Custom format to show y-value
        textStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ChartData {
  final double x; // The numeric value (y-axis)
  final DateTime y; // The date (x-axis)

  ChartData({required this.x, required this.y});
}
