import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../utils/constant/colors.dart';
import '../../model/demand_value_modle.dart';

class DemandTimelineGraph extends StatelessWidget {
  const DemandTimelineGraph({super.key,
    this.timeline});


  final List<Value>? timeline;

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = <ChartData>[];

// Assuming onPeakGraph is a List of data points
    timeline?.forEach((graph) {
      chartData.add(ChartData(x: graph.y ?? 0.0, y: graph.x ?? ""));
    });


    return SfCartesianChart(
      backgroundColor: Colors.transparent,
      primaryXAxis: const CategoryAxis(
        labelStyle: TextStyle(color: Colors.white),
        majorGridLines: MajorGridLines(width: 0),
        //interval: 5,  // Adjust this based on how many labels you want visible
        //labelRotation: 45, // Rotate the labels to avoid overlapping
        edgeLabelPlacement: EdgeLabelPlacement.shift, // Handle labels at the edge
        autoScrollingMode: AutoScrollingMode.end,  // Enable auto-scrolling if you have lots of data
        autoScrollingDelta: 10,
      ),
      primaryYAxis: const NumericAxis(
        labelStyle: TextStyle(color: Colors.white),

        axisLine: AxisLine(width: 0),
        majorTickLines: MajorTickLines(size: 0),
        minorTickLines: MinorTickLines(size: 0),
      ),

      zoomPanBehavior: ZoomPanBehavior(
        enablePinching: true,     // Allows pinch zoom
        enablePanning: true,      // Enables panning
        enableDoubleTapZooming: true,
        enableMouseWheelZooming: true,
        enableSelectionZooming: true,
      ),
      series: <CartesianSeries>[
        LineSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.y,
          yValueMapper: (ChartData data, _) => data.x,
          color: TColors.demandGraphLine,

          // Solid color for the line
          width: 3,
        ),
      ],
      plotAreaBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      borderWidth: 0,

      tooltipBehavior: TooltipBehavior(
        enable: true,
        activationMode: ActivationMode.singleTap, // Show tooltip on tap
        shouldAlwaysShow: true,                   // Keeps tooltip visible after tap
        header: '',
        format: 'point.y on point.x',                // Custom format to show y-value
        textStyle: const TextStyle(color: Colors.white),
      ),

    );
  }

/*
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
*/
}
class ChartData {
  final double x; // The numeric value (y-axis)
  final String y; // The date (x-axis)

  ChartData({required this.x, required this.y});
}
