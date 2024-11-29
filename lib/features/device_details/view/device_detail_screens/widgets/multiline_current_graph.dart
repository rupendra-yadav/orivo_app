import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../model/current_detail_value_model.dart';

class MultiLineCurrentGraph extends StatelessWidget {
  const MultiLineCurrentGraph({
    super.key,
    this.ia,
    this.ib,
    this.ic,
    required this.dateType,
  });

  final List<Value>? ia;
  final List<Value>? ib;
  final List<Value>? ic;

  final int dateType ;

  @override
  Widget build(BuildContext context) {


    List<ChartData> chartData = <ChartData>[];
    ia?.forEach((graph) {
      chartData.add(ChartData(
        x: graph.y ?? 0.0,
        y: DateTime.parse(graph.x ?? ""), // Parse x as DateTime
      ));
    });


    List<ChartData> chartData1 = <ChartData>[];
    ib?.forEach((graph) {
      chartData1.add(ChartData(
        x: graph.y ?? 0.0,
        y: DateTime.parse(graph.x ?? ""), // Parse x as DateTime
      ));
    });

    List<ChartData> chartData2 = <ChartData>[];
    ic?.forEach((graph) {
      chartData2.add(ChartData(
        x: graph.y ?? 0.0,
        y: DateTime.parse(graph.x ?? ""), // Parse x as DateTime
      ));
    });

    return


      SfCartesianChart(
        trackballBehavior: TrackballBehavior(
            enable: true,
            tooltipAlignment: ChartAlignment.center,
            activationMode: ActivationMode.singleTap,
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints
        ),
        backgroundColor: Colors.transparent,
        primaryXAxis: DateTimeAxis(
          interval: 1,
          dateFormat: DateFormat('dd-MM-yyyy h:mm a'),
          labelStyle: const TextStyle(color: Colors.white),
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: const AxisLine(width: 0),
          isVisible: false,
          /* autoScrollingDelta: 5,
        autoScrollingMode: AutoScrollingMode.start,*/
        ),
        primaryYAxis: const NumericAxis(
          labelStyle: TextStyle(color: Colors.white,fontSize: 10),
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0),
          minorTickLines: MinorTickLines(size: 0),
        ),

        /*  zoomPanBehavior: ZoomPanBehavior(
        enablePanning: true,
        zoomMode: ZoomMode.x,
      ),*/
        series: <CartesianSeries>[

          LineSeries<ChartData, DateTime>(
            name: "ia",
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.y,
            yValueMapper: (ChartData data, _) => data.x,
            color: TColors.totalPowerFactorGraphLine1,
            width: 3,
          ),
          LineSeries<ChartData, DateTime>(
            name: "ib",
            dataSource: chartData1,
            xValueMapper: (ChartData data, _) => data.y,
            yValueMapper: (ChartData data, _) => data.x,
            color: TColors.totalPowerFactorGraphLine2,
            width: 3,
          ),
          LineSeries<ChartData, DateTime>(
            name: "ic",
            dataSource: chartData2,
            xValueMapper: (ChartData data, _) => data.y,
            yValueMapper: (ChartData data, _) => data.x,
            color: TColors.totalPowerFactorGraphLine3,
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
      )



      /*SfCartesianChart(
      trackballBehavior: TrackballBehavior(
          enable: true,
          tooltipAlignment: ChartAlignment.center,
          activationMode: ActivationMode.singleTap,
          tooltipDisplayMode: TrackballDisplayMode.groupAllPoints
      ),
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
        ///Line 1
        SplineSeries<ChartData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.y,
          yValueMapper: (ChartData data, _) => data.x,
          color: TColors.totalPowerFactorGraphLine2,
          width: 4,
          markerSettings: const MarkerSettings(
            isVisible: false,
            color: TColors.white,
            borderWidth: 2,
            borderColor: TColors.totalPowerFactorGraphLine2,
          ),
        ),
        ///Line 2
        SplineSeries<ChartData, DateTime>(
          dataSource: chartData1,
          xValueMapper: (ChartData data, _) => data.y,
          yValueMapper: (ChartData data, _) => data.x,
          color: TColors.totalPowerFactorGraphLine4,
          width: 4,
          markerSettings: const MarkerSettings(
            isVisible: false,
            color: TColors.white,
            borderWidth: 2,
            borderColor: TColors.totalPowerFactorGraphLine4,
          ),
        ),
        ///Line 3
        SplineSeries<ChartData, DateTime>(
          dataSource: chartData2,
          xValueMapper: (ChartData data, _) => data.y,
          yValueMapper: (ChartData data, _) => data.x,
          color: TColors.totalPowerFactorGraphLine3,
          width: 4,
          markerSettings: const MarkerSettings(
            isVisible: false,
            color: TColors.white,
            borderWidth: 2,
            borderColor: TColors.totalPowerFactorGraphLine3,
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
    )*/;
  }
}

class ChartData {
  final double x;
  final DateTime y;

  ChartData({required this.x, required this.y});
}
