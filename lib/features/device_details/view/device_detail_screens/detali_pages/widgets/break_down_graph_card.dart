import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';


class BreakDownGraphCard extends StatelessWidget {
  const BreakDownGraphCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: SfCartesianChart(

          borderWidth: 0,
          plotAreaBorderWidth: 0,

          title: ChartTitle(
            text: TTexts.breakDownCardTitle,
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),

          primaryXAxis: CategoryAxis(
            labelStyle: const TextStyle(color: Colors.white),
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
          ),
          primaryYAxis: NumericAxis(
            isVisible: false, // Hide Y axis
          ),


          series: <SplineSeries<ChartData, String>>[
            SplineSeries<ChartData, String>(
              dataSource: getChartData(),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              color: TColors.downGraphLine,
              // Line color
              width: 4,
              markerSettings: const MarkerSettings(
                isVisible: false,
                color: TColors.downGraphLine,
                borderWidth: 2,
                borderColor: TColors.downGraphLine,
              ),
            ),
          ],
          tooltipBehavior: TooltipBehavior(
            enable: true,
            header: '',
            format: 'point.x : point.y hrs',
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

List<ChartData> getChartData() {
  return [
    ChartData('Jan', 10),
    ChartData('Feb', 40),
    ChartData('Mar', 30),
    ChartData('April', 20),
    ChartData('May', 10),
  ];
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}
