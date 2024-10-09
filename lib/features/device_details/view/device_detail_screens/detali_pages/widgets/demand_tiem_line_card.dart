import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/demand_detail_model.dart';
import 'demand_time_line_graph.dart';

class DemandTimeLineCard extends StatelessWidget {
  const DemandTimeLineCard({
    super.key, required this.demandDetailModel,
  });

  final DemandDetailModel demandDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextView(
              text: TTexts.demandTimeLine,
              bold: true,
              fontSize: 20,
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(height: 170.h, child: const DemandTimelineGraph()),

            SizedBox(
              height: 20.h,
            ),
            TextView(text: "Average ${demandDetailModel.avgDemand?.unit?.toString() ?? ''} : ${demandDetailModel.avgDemand?.value?.round().toString() ?? ''} ${demandDetailModel.avgDemand?.unit?.toString() ?? ''}",fontSize: 20,),

            SizedBox(
              height: 10.h,
            ),
            TextView(text: "Highest ${demandDetailModel.highestDemand?.unit?.toString() ?? ''} : ${demandDetailModel.highestDemand?.value?.round().toString() ?? ''} ${demandDetailModel.highestDemand?.unit?.toString() ?? ''}",fontSize: 20,),

            SizedBox(
              height: 10.h,
            ),
            TextView(text: "Load Factor ${demandDetailModel.loadFactor?.unit?.toString() ?? ''} : ${demandDetailModel.loadFactor?.value?.round().toString() ?? ''} ${demandDetailModel.loadFactor?.unit?.toString() ?? ''}",fontSize: 20,),

          ],
        ),
      ),
    );
  }
}