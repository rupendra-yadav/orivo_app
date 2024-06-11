import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/styles/spacing_style.dart';

class Graph extends StatelessWidget {
  const Graph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SpacingStyle.paddingWithDefaultSpace,
      child: SfCartesianChart(
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
          SplineSeries<SalesData, double>(
            animationDuration: 2000,
            dataSource: chartData,
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
              // Customize the color of the marker
              borderWidth: 0,
              // Customize the border width of the marker
              borderColor: TColors.graphLine,
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}

final List<SalesData> chartData = [
  SalesData(2010, 1),
  SalesData(2011, 2),
  SalesData(2012, 5),
  SalesData(2013, 6),
  SalesData(2014, 10),
  SalesData(2015, 36),
  SalesData(2016, 28),
  SalesData(2017, 0),
  SalesData(2018, 32),
  SalesData(2019, 40),
  SalesData(2020, 2),
  SalesData(2021, 34),
  SalesData(2022, 32),
  SalesData(2023, 40),
  SalesData(2024, 40)
];
