import 'package:auro/features/device_details/controller/device_detail_navigation_controller.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/current_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/frequency_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/totla_power_factor_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/voltage_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/base_metric_response_model.dart';
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
  const PowerQualityDetail({super.key, required this.isNotify});

  final bool isNotify;

  @override
  State<PowerQualityDetail> createState() => _PowerQualityDetailState();
}

class _PowerQualityDetailState extends State<PowerQualityDetail> {
  late Map<String, String> args;

  late String deviceId;

  late String deviceName;

  late String startDate;

  late String endDate;

  final DeviceDetailedController controller =
      Get.put(DeviceDetailedController());

  final DeviceDetailNavigationController navigationcontroller =
      Get.put(DeviceDetailNavigationController());

  String _selectedDateRange = TTexts.chooseDateRange;
  int sameDate = 0;
  String EndDate = "";

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (widget.isNotify == true) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      // deviceId = args['deviceId'] ?? controller.deviceList[0].userDeviceId;

      DateTime now = DateTime.now();
      DateTime utcNow = now.toUtc();

      // Convert UTC date and time to IST
      DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));

      // Set the time to 00:00:00 (midnight) in IST for the same date
      DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);

      // Format the date and time to the desired format

      startDate = args['startDate'] ??
          DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
      endDate =
          args['endDate'] ?? DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

      // controller.getPfDetails(startDate, deviceId, endDate);

      // controller.getFrequencyDetails(startDate, deviceId, endDate);

      // controller.getVoltageDetails(startDate, deviceId, endDate);

      // controller.getCurrentDetails(startDate, deviceId, endDate);
    } else {
      DateTime now = DateTime.now();
      DateTime utcNow = now.toUtc();

      // Convert UTC date and time to IST
      DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));

      // Set the time to 00:00:00 (midnight) in IST for the same date
      DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);

      // Format the date and time to the desired format
      String formattedDateMidnight =
          DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
      String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);

      // deviceId = controller.deviceList[0].userDeviceId;
      startDate = formattedDateMidnight;
      endDate = formattedDate;

      // controller.getPfDetails(startDate, deviceId, endDate);

      // controller.getFrequencyDetails(startDate, deviceId, endDate);

      // controller.getVoltageDetails(startDate, deviceId, endDate);

      // controller.getCurrentDetails(startDate, deviceId, endDate);
    }
  }

  /* @override
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

    controller.getPfDetails(formattedDateMidnight, controller.deviceList[0].mMachineUniqueId, formattedDate);

    controller.getFrequencyDetails(formattedDateMidnight, controller.deviceList[0].mMachineUniqueId, formattedDate);

    controller.getVoltageDetails(formattedDateMidnight, controller.deviceList[0].mMachineUniqueId, formattedDate);

    controller.getCurrentDetails(formattedDateMidnight, controller.deviceList[0].mMachineUniqueId, formattedDate);
  }*/

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
    String formattedDateMidnight =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
    String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // controller.fetchBaseMeric(formattedDateMidnight, formattedDate);
    });
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
                    String formattedStartDate =
                        DateFormat('d-MM-yyyy').format(pickedDateRange.start);

                    String StartDate = DateFormat("yyyy-MM-dd HH:mm:ss")
                        .format(pickedDateRange.start);

                    String formattedEndDate =
                        DateFormat('d-MM-yyyy').format(pickedDateRange.end);

                    EndDate = DateFormat("yyyy-MM-dd HH:mm:ss")
                        .format(pickedDateRange.end);

                    setState(() {
                      _selectedDateRange =
                          "From $formattedStartDate To $formattedEndDate";
                    });

                    if (formattedStartDate == formattedEndDate) {
                      sameDate = 1;

                      DateTime pickedDateRange =
                          DateTime.parse(EndDate); // Original date and time

                      DateTime updatedDateTime = pickedDateRange.copyWith(
                          hour: 23, minute: 59, second: 59);
                      EndDate = DateFormat('yyyy-MM-dd HH:mm:ss')
                          .format(updatedDateTime);
                      print("EndDateCHECK");
                      print(EndDate);

                      print("Start and End dates are the same.");
                    } else {
                      sameDate = 0;
                      print("Start and End dates are different.");
                    }

                    // controller.getPfDetails(StartDate, deviceId, EndDate);

                    // controller.getVoltageDetails(StartDate, deviceId, EndDate);

                    // controller.getCurrentDetails(StartDate, deviceId, EndDate);

                    // controller.getFrequencyDetails(
                    //     StartDate, deviceId, EndDate);

                    controller.fetchBaseMeric(
                        navigationcontroller.deviceId.value,
                        navigationcontroller.deviceTariff.value,
                        navigationcontroller.deviceContractDemand.value,
                        formattedStartDate,
                        formattedEndDate);
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
                            Flexible(
                              child: Text(
                                _selectedDateRange,
                                maxLines: 2,
                                overflow: TextOverflow
                                    .ellipsis, // Optional: adds "..." if too long
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
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
                if (controller.isBaseMetricLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return TotalPowerFactorCard(
                  pfDetailModel:
                      controller.baseMetricData.value?.powerQuality ??
                          PowerQualityMetrics(
                              highestPf: null, averagePf: null, timeline: []),
                  dateType: sameDate,
                );
              }),

              SizedBox(height: 20.h),

              /// Voltage
              Obx(() {
                if (controller.isBaseMetricLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return VoltageCard(
                  voltageMetric: controller.baseMetricData.value?.voltage ??
                      VoltageMetrics(timeline: []),
                  dateType: sameDate,
                );
              }),

              SizedBox(height: 20.h),

              // /Curent
              Obx(() {
                if (controller.isBaseMetricLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return CurrentCard(
                  currentMatrics: controller.baseMetricData.value?.current ??
                      CurrentMetrics(
                        current: null,
                      ),
                  dateType: sameDate,
                );
              }),

              SizedBox(height: 20.h),

              ///Frequency
              Obx(() {
                if (controller.isBaseMetricLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return FrequencyCard(
                  frequencyMetrics:
                      controller.baseMetricData.value?.frequency ??
                          FrequencyMetrics(
                            current: null,
                            average: null,
                            highest: null,
                            timeline: [],
                          ),
                  dateType: sameDate,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
