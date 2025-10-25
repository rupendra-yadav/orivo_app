import 'package:auro/features/device_details/view/device_detail_screens/model/energy_consumption_detail.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auro/utils/constant/colors.dart';

import '../../model/consumption_detail_graph_model.dart'; // Assuming this is your custom color import

class BarGraph extends StatelessWidget {
  const BarGraph({
    super.key,
    this.onPeakGraph,
    required this.color,
  });

  final List<GraphDataPoint>? onPeakGraph;
  final Color color;

  @override
  Widget build(BuildContext context) {
    bool isTrue = false;
    /* List<ChartSampleData> chartData = <ChartSampleData>[];*/

// Assuming onPeakGraph is a List of data points
    /* onPeakGraph?.forEach((graph) {
      chartData.add(ChartSampleData(x: graph.y ?? 0.0, y: graph.x ?? ""));
    });*/

    if (onPeakGraph!.length == 1) {
      isTrue = true;
      // final graph = onPeakGraph!.first;

      // // // Format date to yyyy-MM-dd
      // // final String formattedDate = DateFormat('yyyy-MM-dd').format(
      // //   DateTime.parse(graph.date ?? ""),
      // // );
      // // // Parse and format to yyyy-MM-dd
      // // String onlyDate =
      // //     DateFormat('yyyy-MM-dd').format(DateTime.parse(graph.date ?? ""));

      // // Create chart data for single bar
      // final List<SingleBarData> chartData = [
      //   SingleBarData(graph.date.trimLeft(), graph.value ?? 0.0),
      // ];
    }

    List<ChartData> chartData = <ChartData>[];
    onPeakGraph?.forEach((graph) {
      chartData.add(ChartData(
        y: graph.value ?? 0.0,
        x: DateTime.parse(graph.date ?? ""), // Parse x as DateTime
      ));
    });

    return SizedBox(
      height: 120.h,
      child: SfCartesianChart(
        /*  trackballBehavior: TrackballBehavior(
            enable: true,
            tooltipAlignment: ChartAlignment.center,
            activationMode: ActivationMode.singleTap,
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints
        ),*/
        borderWidth: 0,
        plotAreaBorderWidth: 0,
        primaryXAxis: !isTrue
            ? DateTimeAxis(
                interval: 1,
                dateFormat: DateFormat('dd'),
                labelStyle: const TextStyle(color: Colors.white),
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: const AxisLine(width: 0),
                isVisible: true,
                autoScrollingDelta: 5,
                autoScrollingMode: AutoScrollingMode.start,
              )
            : CategoryAxis(
                interval: 1,
                labelStyle: const TextStyle(color: Colors.white),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                axisLine: AxisLine(width: 0),
                autoScrollingDelta: 5,
                autoScrollingMode: AutoScrollingMode.start,
              ),
        primaryYAxis: NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(width: 0),
          labelStyle: TextStyle(color: Colors.transparent),
        ),
        zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
          zoomMode: ZoomMode.x,
        ),
        series: <CartesianSeries>[
          ColumnSeries<ChartData, DateTime>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: color,
          ),
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          shouldAlwaysShow: true,
          header: '',
          format: 'Value: point.y',
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

/*class ChartSampleData {
  final double x; // The numeric value (y-axis)
  final String y; // The date (x-axis)

  ChartSampleData({required this.x, required this.y});
}*/

class ChartData {
  final double y;
  final DateTime x;

  ChartData({required this.x, required this.y});
}

class SingleBarData {
  final String label;
  final double value;
  SingleBarData(this.label, this.value);
}
