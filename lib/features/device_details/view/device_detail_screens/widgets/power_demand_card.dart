import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/demand_estimate_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import 'custom_bars.dart';

class PowerDemandCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (Get.to(() => DemandEstimateDetail())),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: TTexts.demand,
                bold: true,
                fontSize: 20,
              ),

              const SizedBox(height: 8),

              TextView(
                text: TTexts.kva,
                bold: true,
                fontSize: 35,
              ),

              const SizedBox(height: 8),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomBar(),
              ), // Custom progress bar

              const SizedBox(height: 8),

              TextView(
                text: TTexts.averageDemand,
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
