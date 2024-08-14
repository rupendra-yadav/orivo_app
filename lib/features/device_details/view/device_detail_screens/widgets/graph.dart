
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../controller/device_detail_controller.dart';
import '../model/graph_data_model_api.dart';

class Graph extends StatelessWidget {
  const Graph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceDetailController());

    // List<GraphDataInput> chartData2 = [];

  /*  if (controller.graphDataList.isEmpty) {
      return TLoaders.customToast(message: "Something Went Wrong...!");
    }else{
      for (int i = 0; i < controller.graphDataList.length; i++) {
        chartData2.add(GraphDataInput(controller.graphDataList[i].value, controller.graphDataList[i].label));
        if (kDebugMode) {
          print(controller.graphDataList[i].value);
          print(controller.graphDataList[i].label);
        }
      }
    }*/

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
          SplineSeries<GraphData, String>(
            animationDuration: 2000,
            dataSource: controller.graphDataList,
            xValueMapper: (GraphData sales, _) => sales.label,
            yValueMapper: (GraphData sales, _) => sales.value,
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
        ],
      ),
    );
  }
}
