
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
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceDetailController());

    return Padding(
      padding: SpacingStyle.paddingWithDefaultSpace,
      child: SfCartesianChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        plotAreaBorderColor: TColors.primaryLight2,
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true, // Enables pinch zooming
          enablePanning: true, // Enables panning
          enableDoubleTapZooming: true, // Enables double-tap zooming
          enableMouseWheelZooming: true, // Enables mouse wheel zooming (for web)
        ),
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
          SplineSeries<Filters, String>(
            animationDuration: 2000,
            dataSource: controller.historyModel.value.filters,
            xValueMapper: (Filters sales, _) => sales.x,
            yValueMapper: (Filters sales, _) => sales.y,
            color: TColors.graphLine,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: TColors.error,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.error,
            ),
          ),

          SplineSeries<Filters, String>(
            animationDuration: 2000,
            dataSource: controller.historyModel1.value.filters,
            xValueMapper: (Filters sales, _) => sales.x,
            yValueMapper: (Filters sales, _) => sales.y,
            color: TColors.primaryLight2,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: TColors.error,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.error,
            ),
          ),

          SplineSeries<Filters, String>(
            animationDuration: 2000,
            dataSource: controller.historyModel2.value.filters,
            xValueMapper: (Filters sales, _) => sales.x,
            yValueMapper: (Filters sales, _) => sales.y,
            color: TColors.accent,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: TColors.error,
              height: 6.h,
              width: 6.w,
              borderWidth: 0,
              borderColor: TColors.error,
            ),
          ),

          SplineSeries<Filters, String>(
            animationDuration: 2000,
            dataSource: controller.historyModel3.value.filters,
            xValueMapper: (Filters sales, _) => sales.x,
            yValueMapper: (Filters sales, _) => sales.y,
            color: TColors.error,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: true,
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
