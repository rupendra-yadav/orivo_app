import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/temperature_scale.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/multiline_frequency_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../model/frequency_detail_model.dart';
import 'multi_line_total_power_factor_graph.dart';
class FrequencyCard extends StatelessWidget {
  const FrequencyCard({
    super.key,
    required this.frequencyDetailsModel, required this.dateType,
  });

  final FrequencyDetailsModel frequencyDetailsModel;
  final int dateType ;

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
              text: TTexts.frequency,
              fontSize: 20,
              bold: true,
            ),

            TextView(
              text: frequencyDetailsModel.freq?.value?.toStringAsFixed(2) ?? "NA",
              fontSize: 30,
              bold: true,
              textColor: TColors.green,
            ),

            /// Temperature Scale

            /*TemperatureScale(totalValue: frequencyDetailsModel.highestFreq?.value??00,pointerValue: frequencyDetailsModel.freq?.value??00,),

            Row(
              children: [
                TextView(text: TTexts.bad),
                Spacer(),
                TextView(text: TTexts.good),
              ],
            ),*/

            TextView(
              text:"Average Frequency ----- ${frequencyDetailsModel.avgFreq?.value?.toStringAsFixed(2) ?? "NA"}",

              fontSize: 20,
              bold: true,
            ),

            ///Multile Graph

            MultiLineFrequencyGraph(onPeakGraph: frequencyDetailsModel.freqTimeline?.value??[],dateType: dateType,),
          ],
        ),
      ),
    );
  }
}