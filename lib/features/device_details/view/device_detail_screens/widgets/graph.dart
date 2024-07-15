import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../model/graph_data_model.dart';
import '../model/graph_data_model_api.dart';

class Graph extends StatelessWidget {
  const Graph({
    super.key, required this.graphData,
  });


  final GraphData graphData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SpacingStyle.paddingWithDefaultSpace,
      child: SfCartesianChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        plotAreaBorderColor: TColors.primaryLight2,
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true, // Enables pinch zooming
          enablePanning: true, // Enables panning
          enableDoubleTapZooming: true, // Enables double-tap zooming
          enableMouseWheelZooming:
              true, // Enables mouse wheel zooming (for web)
        ),
        primaryXAxis: const NumericAxis(
          axisLine: AxisLine(color: TColors.primaryLight2),
          labelStyle: TextStyle(color: TColors.primaryLight2, fontSize: 6),
          majorGridLines: MajorGridLines(color: TColors.primaryLight2),
        ),
        primaryYAxis: const NumericAxis(
          axisLine: AxisLine(color: TColors.primaryLight2),
          labelStyle: TextStyle(color: TColors.primaryLight2, fontSize: 6),
          majorGridLines: MajorGridLines(color: TColors.primaryLight2),
        ),
        series: <CartesianSeries>[
          // Graph1
          SplineSeries<SalesData, num>(
            animationDuration: 2000,
            dataSource: chartData1,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: TColors.graphLine,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: TColors.graphLine,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.graphLine,
            ),
          ),
          // Graph2
          /*SplineSeries<SalesData, double>(
            animationDuration: 2000,
            dataSource: chartData2,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: TColors.green,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: TColors.green,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.graphLine,
            ),
          ),*/
          // Graph3
          /*SplineSeries<SalesData, double>(
            animationDuration: 2000,
            dataSource: chartData3,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: TColors.error,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: TColors.error,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.graphLine,
            ),
          ),*/
        ],
      ),
    );
  }
}

 List<SalesData> chartData1 = [
  SalesData(2010, 1),
  SalesData(graphData.value, 1),

];

/*final List<SalesData> chartData2 = [
  SalesData(2010, 1),
  SalesData(2011, 5),
  SalesData(2012, 5),
  SalesData(2013, 8),
  SalesData(2014, 15),
  SalesData(2015, 46),
  SalesData(2016, 98),
  SalesData(2017, 2),
  SalesData(2018, 72),
  SalesData(2019, 90),
  SalesData(2020, 50),
  SalesData(2021, 39),
  SalesData(2022, 35),
  SalesData(2023, 40),
  SalesData(2024, 100)
];

final List<SalesData> chartData3 = [
  SalesData(2010, 1),
  SalesData(2011, 2),
  SalesData(2012, 3),
  SalesData(2013, 4),
  SalesData(2014, 5),
  SalesData(2015, 6),
  SalesData(2016, 7),
  SalesData(2017, 8),
  SalesData(2018, 9),
  SalesData(2019, 10),
  SalesData(2020, 11),
  SalesData(2021, 34),
  SalesData(2022, 32),
  SalesData(2023, 40),
  SalesData(2024, 40)
];*/
