import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../home.dart';

class CostEstimate extends StatelessWidget {
  const CostEstimate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeviceCardDetailsAppBar(title: TTexts.costEstimate),
        backgroundColor: TColors.primary,
        body: Padding(
          padding: SpacingStyle.paddingWithDefaultSpace,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: TColors.primaryDark1,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      child: TextView(text: TTexts.dateRange),
                    ),
                  ),
                ),

                /// Pie chart below
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: InkWell(
                    onTap: () => Get.to(() => CostEstimate()),
                    child: Container(
                        decoration: BoxDecoration(
                          color: TColors.primaryDark1,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 10.w),
                          child: Column(
                            children: [
                              TextView(text: TTexts.costEstimation),

                              SizedBox(
                                height: 20.h,
                              ),

                              ///Pie Chart
                              PieChart(
                                dataMap: updatedDataMap2,
                                animationDuration:
                                Duration(milliseconds: 800),
                                chartLegendSpacing: 32.w,
                                chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                                colorList: colorList2,
                                initialAngleInDegree: 0,
                                chartType: ChartType.ring,
                                ringStrokeWidth: 10.w,
                                centerWidget: Container(
                                  width: 87.w,
                                  height: 87.w,
                                  decoration: BoxDecoration(
                                      color: TColors.primaryDark1,
                                      borderRadius:
                                      BorderRadius.circular(100.r)),
                                  child: Center(
                                    child: TextView(
                                      text: "500",
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ),
                                legendOptions: LegendOptions(
                                  showLegends: false
                                ),
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: false,
                                  showChartValuesInPercentage: false,
                                  showChartValuesOutside: false,
                                  chartValueBackgroundColor: TColors.primary,
                                  decimalPlaces: 1,
                                ),
                              ),


                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: colorList2.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    Color color = entry.value;
                                    String legendText = updatedDataMap2.keys.toList()[index];

                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: LegendCard(
                                        legendText: legendText,
                                        legendColor: color,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),

                SizedBox(height: 20.h),

                /// Legend Cards below

              ],
            ),
          ),
        ));
  }
}




class LegendCard extends StatelessWidget {
  final String legendText;
  final Color legendColor;

  const LegendCard({
    Key? key,
    required this.legendText,
    required this.legendColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: TColors.primaryDark2,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                color: legendColor,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10.w),
            Text(
              legendText,
              style: TextStyle(
                fontSize: 16,
                color: legendColor,
              ),
            ),

            Spacer(),
            Icon(PhosphorIcons.arrow_right_thin,color: Colors.white,)////////////////////
          ],
        ),
      ),
    );
  }
}
