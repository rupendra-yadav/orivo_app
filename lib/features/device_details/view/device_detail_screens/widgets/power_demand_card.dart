import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/demand_estimate_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../model/demand_model.dart';
import 'custom_bars.dart';

class PowerDemandCard extends StatelessWidget {
  const PowerDemandCard({super.key, required this.demandModel});

  final DemandModel demandModel;

  @override
  Widget build(BuildContext context) {

    int vall = demandModel.avgDemand?.value?.toInt() ?? 0;
    int total = demandModel.currentDemand?.value?.toInt() ?? 1; // Set to 1 to avoid division by zero

    int reVal = (total != 0) ? ((vall / total) * 100).toInt() : 0;
    int value = ((reVal / 100) * 33).toInt();

    return InkWell(
      onTap: () => (Get.to(() => const DemandEstimateDetail())),
      child: Container(
        height: 200.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextView(
                text: TTexts.demand,
                bold: true,
                fontSize: 20,
              ),
              const SizedBox(height: 8),
              TextView(
                text: "${demandModel.currentDemand?.value?.toString() ?? "NA"} ${demandModel.currentDemand?.unit?.toString() ?? "NA"}",

                bold: true,
                fontSize: 35,
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomBar(
                        max: 33,
                        value: value,
                      ),
                    ),
                    // Other widgets can be added here
                  ],
                ),
              ),
              const SizedBox(height: 8),
              TextView(
                text: "Avg Demand : ${demandModel.avgDemand?.value?.round().toString() ??
                        '0'} ${demandModel.avgDemand?.unit?.toString() ?? ''}",
                // Ensure unit is also handled
                bold: false,
                fontSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
