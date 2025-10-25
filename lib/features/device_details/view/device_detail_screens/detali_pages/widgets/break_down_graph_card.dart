import 'package:auro/common/widgets/text/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';

class BreakDownGraphCard extends StatelessWidget {
  const BreakDownGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int weekday = now.weekday;
    return Container(
      decoration: BoxDecoration(
        color: TColors.primaryDark1,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // // --- Chart ---
          // SizedBox(
          //   height: 300.h,
          //   child: SfCartesianChart(
          //     backgroundColor: TColors.primaryDark1,
          //     plotAreaBorderWidth: 0,

          //     primaryXAxis: CategoryAxis(
          //       majorGridLines: const MajorGridLines(width: 0),
          //       axisLine: const AxisLine(width: 0),
          //       labelStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
          //       labelPlacement: LabelPlacement.onTicks,
          //     ),
          //     primaryYAxis: NumericAxis(
          //       minimum: 0,
          //       maximum: 24,
          //       interval: 6,
          //       isVisible: false,
          //       majorGridLines: const MajorGridLines(width: 0),
          //       axisLine: const AxisLine(width: 0),
          //     ),

          //     // --- Series (two layers: white + orange overlay) ---
          //     series: [
          //       // Base white bar (background)
          //       ColumnSeries<ChartData, String>(
          //         dataSource: whiteBarData,
          //         xValueMapper: (ChartData data, _) => data.x,
          //         yValueMapper: (ChartData data, _) => data.y,
          //         width: 0.4,
          //         borderRadius: BorderRadius.circular(10.r),
          //         color: Colors.white,
          //       ),

          //       // Overlay orange segments
          //       ColumnSeries<ChartData, String>(
          //         dataSource: orangeData,
          //         xValueMapper: (ChartData data, _) => data.x,
          //         yValueMapper: (ChartData data, _) => data.y,
          //         width: 0.25,
          //         borderRadius: BorderRadius.circular(10.r),
          //         color: const Color(0xFFFFB300),
          //       ),
          //     ],
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                TextView(
                  text: "Light Off/BreakDown",
                  bold: true,
                ),
                Spacer(),
                TextView(
                  text: "100",
                  bold: true,
                  textColor: const Color(0xFFFFB300),
                ),
                TextView(
                  text: " hrs",
                  bold: true,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: "24:00 PM",
                      bold: true,
                      fontSize: 12,
                    ),
                    TextView(
                      text: "12:00 PM",
                      bold: true,
                      fontSize: 12,
                    ),
                    TextView(
                      text: "00:00 AM",
                      bold: true,
                      fontSize: 12,
                    ),
                  ],
                ),

                SizedBox(
                  width: 5,
                ),

                _buildWeeklyTimeLine(
                  [
                    [11, 15]
                  ],
                  weekday == 1 ? "Today" : "M",
                ), // 11–3
                _buildWeeklyTimeLine([
                  [2, 6]
                ], weekday == 2 ? "Today" : "T"), // no duration (hidden)
                _buildWeeklyTimeLine([
                  [6, 13]
                ], weekday == 3 ? "Today" : "W"), // 6–1
                // T — single long downtime
                _buildWeeklyTimeLine([
                  [4, 13],
                  [14, 16],
                ], weekday == 4 ? "Today" : "T"),

                // F — full workday breakdown
                _buildWeeklyTimeLine([
                  [9, 17],
                ], weekday == 5 ? "Today" : "F"),

                // S — mid-day only
                _buildWeeklyTimeLine([
                  [11, 14],
                ], weekday == 6 ? "Today" : "S"),

                // Today — evening breakdown
                _buildWeeklyTimeLine([
                  [18, 21],
                ], weekday == 7 ? "Today" : "S"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;
  ChartData(this.x, this.y);
}

Widget _buildWeeklyTimeLine(List<List<double>> ranges, String day) {
  const double maxHeight = 200; // full bar = 24 hours
  const double barWidth = 30;

  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      // Base white bar
      Container(
        height: maxHeight,
        width: barWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
      ),

      // Draw each orange range segment
      for (var range in ranges)
        Positioned(
          bottom: (range[0] / 24) * maxHeight, // start position from bottom
          child: Container(
            height: ((range[1] - range[0]) / 24) * maxHeight, // scaled height
            width: barWidth - 4,
            decoration: BoxDecoration(
              color: const Color(0xFFFFB300),

              // gradient: const LinearGradient(
              //   colors: [Color(0xFFFFB300), Color(0xFFD79B14)],
              //   begin: Alignment.bottomCenter,
              //   end: Alignment.topCenter,
              // ),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),

      Positioned(
          bottom: 1,
          child: TextView(
            text: day,
            fontSize: 10,
            bold: true,
            textColor: TColors.darkGrey,
          )),
    ],
  );
}

// String isToday(){
//   final DateTime now = DateTime.now();
//     final int weekday = now.weekday;
//     switch (weekday) {
//       case 1:
        
//         break;
//       default:
//     }
//   return 
// }