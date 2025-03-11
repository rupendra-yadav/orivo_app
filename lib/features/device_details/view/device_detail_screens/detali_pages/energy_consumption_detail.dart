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

import '../controller/device_detail_controller.dart';
import '../widgets/detail_pie_card.dart';
import '../widgets/device_detail_shimmer.dart';

class EnergyConsumptionDetail extends StatefulWidget {
  const EnergyConsumptionDetail({super.key, required this.isNotify});

  final bool isNotify;

  @override
  State<EnergyConsumptionDetail> createState() =>
      _EnergyConsumptionDetailState();
}

class _EnergyConsumptionDetailState extends State<EnergyConsumptionDetail> {
  late Map<String, String> args;

  late String deviceId;

  late String deviceName;

  late String startDate;

  late String endDate;

  final DeviceDetailController controller = Get.put(DeviceDetailController());

  String _selectedDateRange = TTexts.chooseDateRange;
  String formattedEndDateInYears = "";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (widget.isNotify == true) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      deviceId = args['deviceId'] ?? controller.deviceList[0].userDeviceId;
      DateTime now = DateTime.now();
      DateTime utcNow = now.toUtc();
      DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));
      DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);
      startDate = args['startDate'] ??
          DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
      endDate =
          args['endDate'] ?? DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

      // controller.getEnergyDetailsConsumption(startDate, deviceId, endDate);
    } else {
      DateTime now = DateTime.now();
      DateTime utcNow = now.toUtc();
      DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));
      DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);
      String formattedDateMidnight =
          DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
      startDate = formattedDateMidnight;
      String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);
      endDate = formattedDate;
      // deviceId = controller.deviceList[0].mMachineUniqueId;

      // controller.getEnergyDetailsConsumption(startDate, deviceId, endDate);
    }
  }



  @override
  Widget build(BuildContext context) {
    //controller.getEnergyDetailsConsumption("2024-08-01", "3071123300001", "2024-08-03");
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
                    String formattedStartDateInYears =
                        DateFormat("yyyy-MM-dd HH:mm:ss")
                            .format(pickedDateRange.start);

                    String formattedEndDate =
                        DateFormat('d-MM-yyyy').format(pickedDateRange.end);
                    formattedEndDateInYears = DateFormat("yyyy-MM-dd HH:mm:ss")
                        .format(pickedDateRange.end);

                    if (formattedStartDate == formattedEndDate) {
                      DateTime pickedDateRange =
                          DateTime.parse(formattedEndDateInYears);
                      DateTime updatedDateTime = pickedDateRange.copyWith(
                          hour: 23, minute: 59, second: 59);
                      formattedEndDateInYears =
                          DateFormat('yyyy-MM-dd HH:mm:ss')
                              .format(updatedDateTime);

                      print("Start and End dates are the same.");
                    } else {
                      print("Start and End dates are different.");
                    }

                    setState(() {
                      _selectedDateRange =
                          "From $formattedStartDate To $formattedEndDate";

                      startDate = formattedStartDateInYears;
                      endDate = formattedEndDateInYears;

                      controller.getEnergyDetailsConsumption(
                          startDate, deviceId, endDate);
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

                double onPeak =
                    controller.consumptionDetails.value.onPeakUnit?.value ??
                        0.0;
                double offPeak =
                    controller.consumptionDetails.value.offPeakUnit?.value ??
                        0.0;
                double normal =
                    controller.consumptionDetails.value.normalUnit?.value ??
                        0.0;
                double totalCount = onPeak + offPeak + normal;

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
                      // legendPosition: pie_chart.LegendPosition.bottom,
                      showLegendsInRow: true,
                      onPressed: () {},
                      consumptionDetail: controller.consumptionDetails.value,
                    ),

                    SizedBox(height: 20.h),

                    /// Bar Graphs Section
                    MultipleBarGraphCard(
                      consumptionDetail: controller.consumptionDetails.value,
                    ),

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
