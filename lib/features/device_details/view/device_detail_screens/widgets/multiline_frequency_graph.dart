import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../utils/constant/colors.dart';
import '../model/freq_value_model.dart';

class MultiLineFrequencyGraph extends StatelessWidget {
  const MultiLineFrequencyGraph({
    super.key,
    this.onPeakGraph, required this.dateType,
  });

  final List<Value>? onPeakGraph;
  final int dateType ;
  // final List<NormalGraph>? onPeakGraph;

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData = <ChartData>[];
    onPeakGraph?.forEach((graph) {
      chartData.add(ChartData(
        x: graph.y ?? 0.0,
        y: DateTime.parse(graph.x ?? ""),
      ));
    });
    return SfCartesianChart(
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat((dateType == 1) ? 'HH:MM:ss' : 'dd/MM'),
        labelStyle: const TextStyle(color: Colors.white),
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),
      primaryYAxis: const NumericAxis(
        isVisible: false, // Hide Y axis
      ),
      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,
        enablePanning: true,
        enableDoubleTapZooming: true,
        enableMouseWheelZooming: false,
        enableSelectionZooming: true,
      ),
      series: <SplineSeries<ChartData, DateTime>>[
        SplineSeries<ChartData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.y,
          yValueMapper: (ChartData data, _) => data.x,
          color: TColors.totalPowerFactorGraphLine1,
          width: 4,
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: TColors.white,
            borderWidth: 2,
            borderColor: TColors.totalPowerFactorGraphLine1,
          ),
        ),
      ],
      tooltipBehavior: TooltipBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap,
        shouldAlwaysShow: true,
        header: '',
        format: 'point.y on point.x',
        textStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ChartData {
  final double x;    // The numeric value (y-axis)
  final DateTime y;  // The date (x-axis)

  ChartData({required this.x, required this.y});
}