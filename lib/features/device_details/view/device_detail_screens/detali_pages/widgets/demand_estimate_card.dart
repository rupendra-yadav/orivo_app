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

  /*  int vall = demandDetailModel.currentDemand?.value?.toInt()??00;

    int total = demandDetailModel.highestDemand?.value?.toInt() ?? 0;

    int reVal= ((vall / total ) * 100).toInt() ;

    int value = ((reVal /  100 )* 33).toInt();*/

    int vall = demandDetailModel.currentDemand?.value?.toInt() ?? 0;
    int total = demandDetailModel.highestDemand?.value?.toInt() ?? 1; // Set to 1 to avoid division by zero

    int reVal = (total != 0) ? ((vall / total) * 100).toInt() : 0;
    int value = ((reVal / 100) * 33).toInt();


    print("checkDemandValue");
    print(reVal);
    print(value);

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
                    max: 33,
                    value: value,
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