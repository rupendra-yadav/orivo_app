import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/demand_estimate_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/demand_tiem_line_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/styles/spacing_style.dart';

class DemandEstimateDetail extends StatelessWidget {
  const DemandEstimateDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeviceCardDetailsAppBar(title: TTexts.demandEstimate),
      backgroundColor: TColors.primary,
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Date Range Section
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: TColors.primaryDark1,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  child: const TextView(text: TTexts.dateRange),
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              /// Demand Estimate
              DemandEstimateCard(),

              SizedBox(
                height: 20.h,
              ),

              /// Demand Time Line
              DemandTimeLineCard(),
            ],
          ),
        ),
      ),
    );
  }
}
