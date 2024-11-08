import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/current_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/frequency_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/totla_power_factor_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/voltage_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/loaders/image_loader.dart';
import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../controller/device_detail_controller.dart';
import '../widgets/device_detail_shimmer.dart';

class PowerQualityDetail extends StatefulWidget {
  const PowerQualityDetail({super.key});

  @override
  State<PowerQualityDetail> createState() => _PowerQualityDetailState();
}

class _PowerQualityDetailState extends State<PowerQualityDetail> {
  final DeviceDetailController controller = Get.put(DeviceDetailController());
  String _selectedDateRange = TTexts.chooseDateRange;
   int sameDate = 0;
  String EndDate ="";

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    DateTime utcNow = now.toUtc();

    // Convert UTC date and time to IST
    DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));

    // Set the time to 00:00:00 (midnight) in IST for the same date
    DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);

    // Format the date and time to the desired format
    String formattedDateMidnight = DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
    String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);

    controller.getPfDetails(formattedDateMidnight, controller.deviceListModel.mMachineUniqueId, formattedDate);

    controller.getFrequencyDetails(formattedDateMidnight, controller.deviceListModel.mMachineUniqueId, formattedDate);

    controller.getVoltageDetails(formattedDateMidnight, controller.deviceListModel.mMachineUniqueId, formattedDate);

    controller.getCurrentDetails(formattedDateMidnight, controller.deviceListModel.mMachineUniqueId, formattedDate);
  }

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
                    String formattedStartDate = DateFormat('d-MM-yyyy').format(pickedDateRange.start);

                    String StartDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(pickedDateRange.start);

                    String formattedEndDate = DateFormat('d-MM-yyyy').format(pickedDateRange.end);

                     EndDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(pickedDateRange.end);

                    setState(() {
                      _selectedDateRange =
                          "From $formattedStartDate To $formattedEndDate";
                    });

                    if (formattedStartDate == formattedEndDate) {
                      sameDate = 1;

                      DateTime pickedDateRange = DateTime.parse(EndDate); // Original date and time

                      DateTime updatedDateTime = pickedDateRange.copyWith(hour: 23, minute: 59, second: 59);
                      EndDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(updatedDateTime);
                      print("EndDateCHECK");
                      print(EndDate);

                      print("Start and End dates are the same.");
                    } else {
                      sameDate = 0;
                      print("Start and End dates are different.");
                    }


                    controller.getPfDetails(StartDate,controller.deviceListModel.mMachineUniqueId, EndDate);

                    controller.getVoltageDetails(StartDate,controller.deviceListModel.mMachineUniqueId, EndDate);

                    controller.getCurrentDetails(StartDate,controller.deviceListModel.mMachineUniqueId, EndDate);

                    controller.getFrequencyDetails(StartDate, controller.deviceListModel.mMachineUniqueId, EndDate);

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

              SizedBox(height: 20.h),

              /// Total Power Factors
              Obx(() {
                if (controller.isPfDetailsLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return TotalPowerFactorCard(pfDetailModel: controller.pfDetailModel.value,dateType: sameDate,);
              }),

              SizedBox(height: 20.h),

              /// Voltage
              Obx((){
                if (controller.isVoltageDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return  VoltageCard(voltageDetailModel: controller.voltageDetailsModel.value,dateType: sameDate,);
              }),


              SizedBox(height: 20.h),

              ///Curent
              Obx((){
                if (controller.isCurrentDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return CurrentCard(currentDetailModel: controller.currentDetailsModel.value,dateType: sameDate,);
              }),

              SizedBox(height: 20.h),

              ///Frequency
              Obx((){     if (controller.isFrequencyDetailLoading.value) {
                return const DeviceDetailShimmer();
              }
              return FrequencyCard(frequencyDetailsModel: controller.frequencyDetailsModel.value,dateType: sameDate,);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
