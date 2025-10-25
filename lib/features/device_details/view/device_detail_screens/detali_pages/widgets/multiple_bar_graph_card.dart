import 'package:auro/features/device_details/view/device_detail_screens/model/energy_consumption_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/consumption_detail_model.dart';
import 'bar_graph.dart';

class MultipleBarGraphCard extends StatelessWidget {
  const MultipleBarGraphCard({
    super.key,
    required this.graphConsumption,
  });

  final List<GraphPeriod> graphConsumption;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.primaryDark1,
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: TTexts.energyConsumption,
            fontSize: 18.sp,
          ),
          SizedBox(height: 10.h),
          ListView.builder(
            itemBuilder: (context, index) {
              return _buildBarGraph(
                graphConsumption[index],
                _formatcolor(graphConsumption[index].periodName),
              );
            },
            itemCount: graphConsumption.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}

Widget _buildBarGraph(GraphPeriod graphPeriod, Color color) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    TextView(text: _formatLabel(graphPeriod.periodName)),
    TextView(text: TTexts.normalTimeRange, fontSize: 12.sp),
    BarGraph(
      onPeakGraph: graphPeriod.dataPoints,
      color: color,
    ),
    SizedBox(height: 10.h),
  ]);
}

// Helper for nicer labels
String _formatLabel(String key) {
  switch (key.toLowerCase()) {
    case "normal":
      return "Normal";
    case "off_peak":
      return "OFF Peak";
    case "on_peak":
      return "On Peak";
    default:
      return key; // fallback (API may add new ones)
  }
}

// Helper for nicer labels
Color _formatcolor(String color) {
  switch (color) {
    case "normal":
      return chartColors[0];
    case "off_peak":
      return chartColors[1];
    case "on_peak":
      return chartColors[2];
    default:
      return Colors.white; // fallback (API may add new ones)
  }
}

final List<Color> chartColors = [
  const Color(0xFFFEB546),
  const Color(0xFFFFC0BB),
  const Color(0XFF344BFD),
];
