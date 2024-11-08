import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart'; // Import for date formatting

import '../../../../../../utils/constant/colors.dart';
import '../../model/pf_detail_timeline_model.dart';
import '../../model/pf_detail_value_model.dart';

class MultiLineTotalPowerFactorGraph extends StatelessWidget {
  const MultiLineTotalPowerFactorGraph({
    super.key,
    this.onPeakGraph,
    required this.dateType,
  });

  final List<Value>? onPeakGraph;
  final int dateType ;

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = <ChartData>[];

    // Parse onPeakGraph data
    onPeakGraph?.forEach((graph) {
      chartData.add(ChartData(
        x: graph.y ?? 0.0,
        y: DateTime.parse(graph.x ?? ""), // Parse x as DateTime
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
