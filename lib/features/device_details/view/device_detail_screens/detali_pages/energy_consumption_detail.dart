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
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart' as pie_chart;

import '../controller/device_detail_controller.dart';
import '../widgets/detail_pie_card.dart';
import '../widgets/device_detail_shimmer.dart';
import '../widgets/pie_card.dart';

class EnergyConsumptionDetail extends StatefulWidget {
  const EnergyConsumptionDetail({super.key});

  @override
  State<EnergyConsumptionDetail> createState() =>
      _EnergyConsumptionDetailState();
}

class _EnergyConsumptionDetailState extends State<EnergyConsumptionDetail> {
  final DeviceDetailController controller = Get.put(DeviceDetailController());
  
  String _selectedDateRange = TTexts.chooseDateRange;
  
  
  @override
  Widget build(BuildContext context) {
    controller.getEnergyDetailsConsumption("2024-08-01", "3071123300001", "2024-08-03");
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
              GestureDetector(
                onTap: () async {
                  // Open the DateRangePickerDialog
                  DateTimeRange? pickedDateRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDateRange: DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now(),
                    ),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: TColors.primaryDark2,
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: TColors.primaryDark1,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDateRange != null) {
                    // Formatting the date to 1-08-2024 format
                    String formattedStartDate =
                        DateFormat('d-MM-yyyy').format(pickedDateRange.start);
                    String formattedEndDate =
                        DateFormat('d-MM-yyyy').format(pickedDateRange.end);

                    setState(() {
                      _selectedDateRange =
                          "From $formattedStartDate To $formattedEndDate";
                    });
                  }
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColors.primaryDark1,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.calendar_2,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            TextView(text: _selectedDateRange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Obx(() {
                if (controller.isEnergyConsumptionDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }

                double onPeak = controller.consumptionDetails.value.onPeakUnit?.value?? 0.0;
                double offPeak = controller.consumptionDetails.value.offPeakUnit?.value?? 0.0;
                double normal  = controller.consumptionDetails.value.normalUnit?.value?? 0.0;
                double totalCount =  onPeak + offPeak + normal;


                /* if (controller.energyConsumptionData.value.normalUnit != null) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/

                return Column(
                  children: [
                    SizedBox(height: 20.h),

                    /// Pie Chart Section
                    DetailPieCard(
                      totalCount: totalCount,
                      legendPosition: pie_chart.LegendPosition.bottom,
                      showLegendsInRow: true,
                      onPressed: () =>
                          Get.to(() => const EnergyConsumptionDetail()),
                      consumptionDetail: controller.consumptionDetails.value,
                    ),

                    SizedBox(height: 20.h),

                    /// Bar Graphs Section
                     MultipleBarGraphCard(consumptionDetail: controller.consumptionDetails.value, ),

                    SizedBox(height: 20.h),

                    /// Breakdown Card
                    const BreakDownGraphCard(),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
