import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/temperature_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/curent_detail_modle.dart';
import '../../widgets/multiline_current_graph.dart';
import 'multi_line_total_power_factor_graph.dart';
class CurrentCard extends StatelessWidget {
  const CurrentCard({
    super.key,
    required this.currentDetailModel,
  });


 final CurrentDetailModel currentDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: TTexts.current,
              fontSize: 20,
              bold: true,
            ),

            TextView(
              text: currentDetailModel.current?.value?.toStringAsFixed(2) ?? "NA",
              fontSize: 30,
              bold: true,
              textColor: TColors.green,
            ),

            /// Temperature Scale

            TemperatureScale(totalValue: currentDetailModel.highestCurrent?.value??00,pointerValue: currentDetailModel.current?.value??00,),

            Row(
              children: [
                TextView(text: TTexts.bad),
                Spacer(),
                TextView(text: TTexts.good),
              ],
            ),

            TextView(
              text:"Average Current ------ ${currentDetailModel.avgCurrent?.value?.toStringAsFixed(2) ?? "NA"}",

              fontSize: 20,
              bold: true,
            ),

            ///Multile Graph

            MultiLineCurrentGraph(
              ia: currentDetailModel.iaTimeline?.value??[],
              ib: currentDetailModel.ibTimeline?.value??[],
              ic: currentDetailModel.icTimeline?.value??[]
            ),
          ],
        ),
      ),
    );
  }
}