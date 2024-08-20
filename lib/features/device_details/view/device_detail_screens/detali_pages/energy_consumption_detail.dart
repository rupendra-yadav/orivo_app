import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/break_down_graph_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/multiple_bar_graph_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart' as pie_chart;

import '../widgets/pie_card.dart';

class EnergyConsumptionDetail extends StatelessWidget {
  const EnergyConsumptionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      const DeviceCardDetailsAppBar(title: TTexts.energyConsumptionDetail),
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

              /// Pie Chart Section
              PieCard(
                totalCount: 100,
                legendPosition: pie_chart.LegendPosition.bottom,
                showLegendsInRow: true,
                onPressed: () => Get.to(() => const EnergyConsumptionDetail()),
              ),

              SizedBox(height: 20.h),

              /// Bar Graphs Section
              const MultipleBarGraphCard(),

              SizedBox(height: 20.h),

              /// Breakdown Card
              const BreakDownGraphCard(),
            ],
          ),
        ),
      ),
    );
  }
}


