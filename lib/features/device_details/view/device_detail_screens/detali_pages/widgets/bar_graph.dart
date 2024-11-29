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
  });

  final List<NormalGraph>? onPeakGraph;

  @override
  Widget build(BuildContext context) {
   /* List<ChartSampleData> chartData = <ChartSampleData>[];*/

// Assuming onPeakGraph is a List of data points
   /* onPeakGraph?.forEach((graph) {
      chartData.add(ChartSampleData(x: graph.y ?? 0.0, y: graph.x ?? ""));
    });*/


    List<ChartData> chartData = <ChartData>[];
    onPeakGraph?.forEach((graph) {
      chartData.add(ChartData(
        x: graph.y ?? 0.0,
        y: DateTime.parse(graph.x ?? ""), // Parse x as DateTime
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
        primaryXAxis: DateTimeAxis(
          interval: 1,
          dateFormat: DateFormat('dd'),
          labelStyle: const TextStyle(color: Colors.white),
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: const AxisLine(width: 0),
          isVisible: true,
           autoScrollingDelta: 5,
        autoScrollingMode: AutoScrollingMode.start,
        ),
       /* primaryXAxis: CategoryAxis(
          interval: 1,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines: MajorGridLines(width: 0),
          majorTickLines: MajorTickLines(width: 0),
          axisLine: AxisLine(width: 0),
          autoScrollingDelta: 5,
          autoScrollingMode: AutoScrollingMode.start,
        ),*/
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
            xValueMapper: (ChartData data, _) => data.y,
            yValueMapper: (ChartData data, _) => data.x,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: TColors.barColors,
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
  final double x;
  final DateTime y;

  ChartData({required this.x, required this.y});
}
