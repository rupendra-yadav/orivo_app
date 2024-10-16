import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/consumption_detail_model.dart';
import 'bar_graph.dart';

class MultipleBarGraphCard extends StatelessWidget {
  const MultipleBarGraphCard({
    super.key, required this.consumptionDetail,
  });

  final ConsumptionDetail consumptionDetail;

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
          /// On-Peak Bar Graph
          const Row(
            children: [
              TextView(text: TTexts.onPeak),
              TextView(text: "11PM to 9AM"),
            ],
          ),
           BarGraph(onPeakGraph: consumptionDetail.onPeakGraph),
          SizedBox(height: 10.h),

          /// Off-Peak Bar Graph
          const Row(
            children: [
              TextView(text: TTexts.offPeak),
              TextView(text: "9AM to 5PM"),
            ],
          ),
           BarGraph(onPeakGraph: consumptionDetail.offPeakGraph),
          SizedBox(height: 10.h),

          /// Normal Bar Graph
          const Row(
            children: [
              TextView(text: TTexts.normal),
              TextView(text: "9AM to 5PM"),
            ],
          ),
           BarGraph(onPeakGraph: consumptionDetail.normalGraph),
        ],
      ),
    );
  }
}
