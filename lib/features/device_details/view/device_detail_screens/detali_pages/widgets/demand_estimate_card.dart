import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/demand_detail_model.dart';
import '../../widgets/custom_bars.dart';


class DemandEstimateCard extends StatelessWidget {
  const DemandEstimateCard({
    super.key,
    required this.demandDetailModel,
  });

  final DemandDetailModel demandDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextView(text: TTexts.demandEstimate),
            SizedBox(
              height: 15.h,
            ),
             TextView(
              text:  "${demandDetailModel.currentDemand?.value?.round().toString() ??
                  '0'} ${demandDetailModel.currentDemand?.unit?.toString() ?? ''}",
              fontSize: 30,
              bold: true,
            ),
            SizedBox(
              height: 10.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomBar(
                    max: demandDetailModel.highestDemand?.value?.toInt() ?? 0,
                    value: demandDetailModel.currentDemand?.value?.toInt() ?? 0,
                  ),
                  // Add more widgets here as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}