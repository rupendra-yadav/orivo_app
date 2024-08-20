import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/totla_power_factor_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/voltage_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/styles/spacing_style.dart';

class PowerQualityDetail extends StatelessWidget {
  const PowerQualityDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DeviceCardDetailsAppBar(title: TTexts.powerQuality),
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

              SizedBox(height: 20.h),

              /// Total Power Factors

              const TotalPowerFactorCard(),

              SizedBox(height: 20.h),

              /// Voltage
              const VoltageCard(),
            ],
          ),
        ),
      ),
    );
  }
}


