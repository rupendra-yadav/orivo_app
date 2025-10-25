import 'package:auro/features/device_details/view/device_detail_screens/model/historical_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../controller/device_detail_controller.dart';
import '../model/history_filter_data_model.dart';

class Graph extends StatelessWidget {
  const Graph({
    super.key,
    required this.name,
    required this.nameType,
  });

  final String name;

  final int nameType;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceDetailedController());

/*
    if(nameType == 1 ){
      name1 = name;
    }
    if(nameType == 2 ){
      name2 = name;
    }
    if(nameType == 3 ){
      name3 = name;
    }*/

    return Padding(
      padding: SpacingStyle.paddingWithDefaultSpace,
      child: SfCartesianChart(
        trackballBehavior: TrackballBehavior(
            lineColor: TColors.errorLight,
            enable: true,
            tooltipAlignment: ChartAlignment.center,
            activationMode: ActivationMode.singleTap,
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints),
        tooltipBehavior: TooltipBehavior(enable: true),
        plotAreaBorderColor: TColors.primaryLight2,
        /* zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true, // Enables pinch zooming
          enablePanning: true, // Enables panning
          enableDoubleTapZooming: true, // Enables double-tap zooming
          enableMouseWheelZooming: true, // Enables mouse wheel zooming (for web)
        ),*/
        primaryXAxis: const CategoryAxis(
          axisLine: AxisLine(color: TColors.primaryLight2),
          labelStyle: TextStyle(color: TColors.primaryLight2, fontSize: 6),
          majorGridLines: MajorGridLines(color: TColors.primaryLight2),
        ),
        primaryYAxis: const NumericAxis(
          axisLine: AxisLine(color: TColors.primaryLight2),
          labelStyle: TextStyle(color: TColors.primaryLight2, fontSize: 6),
          majorGridLines: MajorGridLines(color: TColors.primaryLight2),
          // minimum: 0,
        ),
        series: <CartesianSeries>[
          // Graph1
          SplineSeries<HistoricalPoint, String>(
            name: controller.name1,
            animationDuration: 2000,
            dataSource: controller.historicalData.value?.value,
            xValueMapper: (HistoricalPoint sales, _) =>
                sales.x?.toString() ?? '',
            yValueMapper: (HistoricalPoint sales, _) => sales.y,
            color: TColors.graphLine,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: false,
              shape: DataMarkerType.circle,
              color: TColors.error,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.error,
            ),
          ),

          SplineSeries<HistoricalPoint, String>(
            name: controller.name2,
            animationDuration: 2000,
            dataSource: controller.historyModel1.value?.value,
            xValueMapper: (HistoricalPoint sales, _) => sales.x.toString(),
            yValueMapper: (HistoricalPoint sales, _) => sales.y,
            color: TColors.primaryLight2,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: false,
              shape: DataMarkerType.circle,
              color: TColors.primaryLight2,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.primaryLight2,
            ),
          ),

          SplineSeries<HistoricalPoint, String>(
            name: controller.name3,
            animationDuration: 2000,
            dataSource: controller.historyModel2.value.value,
            xValueMapper: (HistoricalPoint sales, _) => sales.x.toString(),
            yValueMapper: (HistoricalPoint sales, _) => sales.y,
            color: TColors.secondary,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: false,
              shape: DataMarkerType.circle,
              color: TColors.secondary,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.secondary,
            ),
          ),

          SplineSeries<HistoricalPoint, String>(
            animationDuration: 2000,
            dataSource: controller.historyModel3.value.value,
            xValueMapper: (HistoricalPoint sales, _) => sales.x.toString(),
            yValueMapper: (HistoricalPoint sales, _) => sales.y,
            color: TColors.error,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: false,
              shape: DataMarkerType.circle,
              color: TColors.error,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
