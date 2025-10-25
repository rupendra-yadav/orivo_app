import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/demand_analysis_respponse.dart';
import '../../model/demand_detail_model.dart';
import 'demand_time_line_graph.dart';

class DemandTimeLineCard extends StatelessWidget {
  const DemandTimeLineCard({
    super.key,
    required this.demandTimeline,
    required this.average,
    required this.averageUnit,
    required this.highest,
    required this.highestUnit,
    required this.loadFactor,
    required this.loadFactorUnit,
  });

  final DemandTimeline demandTimeline;
  final String average;
  final String averageUnit;
  final String highest;
  final String highestUnit;
  final String loadFactor;
  final String loadFactorUnit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const TextView(
                text: TTexts.demandTimeLine,
                bold: true,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            DemandTimelineGraph(
              timeline: demandTimeline.data ?? [],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextView(
                text: "Average $averageUnit : $average $averageUnit",
                // "Average ${demandTimeline.avgDemand?.unit?.toString() ?? ''} : ${demandTimeline.avgDemand?.value?.round().toString() ?? ''} ${demandTimeline.avgDemand?.unit?.toString() ?? ''}",
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextView(
                text: "Highest $highestUnit : $highest $highestUnit",
                // "Highest ${demandTimeline.highestDemand?.unit?.toString() ?? ''} : ${demandTimeline.highestDemand?.value?.round().toString() ?? ''} ${demandTimeline.highestDemand?.unit?.toString() ?? ''}",
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextView(
                text:
                    "Load Factor $loadFactorUnit : $loadFactor $loadFactorUnit",
                // "Load Factor : ${demandTimeline.loadFactor?.value?.round().toString() ?? ''} ${demandTimeline.loadFactor?.unit?.toString() ?? ''}",
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
