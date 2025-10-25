import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/legend_name_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/lrgend_name_card_demand.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/lrgend_name_card_govt.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/cost_estimate_details_model.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/helpers/number_formaters.dart';
import '../../../../../utils/preferences/cache_manager.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../controller/device_detail_controller.dart';
import '../home.dart';
import '../widgets/device_detail_shimmer.dart';

class CostEstimate extends StatefulWidget {
  const CostEstimate({super.key, required this.isNotify});

  final bool isNotify;

  @override
  _CostEstimateState createState() => _CostEstimateState();
}

class _CostEstimateState extends State<CostEstimate> {
  // late String deviceId;
  late Map<String, String> args;

  late String deviceId;

  late String deviceName;

  late String startDate;

  late String endDate;

  final DeviceDetailedController controller =
      Get.put(DeviceDetailedController());

  String _selectedDateRange = TTexts.chooseDateRange;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.isNotify == true) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      // Initialize values safely
      // deviceId = args['deviceId'] ?? controller.deviceList[0].userDeviceId;
      deviceName = TTexts.costEstimate;
      DateTime now =
          DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
      DateTime midnight = DateTime(now.year, now.month, now.day);

      startDate = args['startDate'] ??
          DateFormat("yyyy-MM-dd HH:mm:ss").format(midnight);
      endDate =
          args['endDate'] ?? DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

      // Fetch data
      controller.fetchCostEstimateDetail("X2024103", startDate, endDate);
      // controller.getCostEstimateDetails(
      //   startDate,
      //   deviceId,
      //   endDate,
      //   SharedPrefs.getString("userLoad").toString(),
      // );
    } else {
      //deviceId = controller.deviceList[0].mMachineUniqueId;
      deviceName = TTexts.costEstimate;

      DateTime now =
          DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
      DateTime midnight = DateTime(now.year, now.month, now.day);

      startDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(midnight);
      endDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

      // Fetch data
      // controller.getCostEstimateDetails(
      //   startDate,
      //   deviceId,
      //   endDate,
      //   SharedPrefs.getString("userLoad").toString(),
      // );
    }
  }

  @override
  void initState() {
    super.initState();
    DateTime now =
        DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
    DateTime midnight = DateTime(now.year, now.month, now.day);

    startDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(midnight);
    endDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(now);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // controller.fetchCostEstimateDetail(startDate, endDate);
    });
  }

/*  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    DateTime utcNow = now.toUtc();

    DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));

    DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);

    String formattedDateMidnight =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
    String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);

  if (deviceId != null && deviceId!.isNotEmpty) {
      deviceId = deviceId!;
    } else {
      deviceId = controller.deviceList[0].mMachineUniqueId;
    }

    if (deviceName != null && deviceName!.isNotEmpty) {
      deviceName = deviceName!;
    } else {
      deviceName = TTexts.costEstimate;
    }

    if (startDate != null && startDate!.isNotEmpty) {
      startDate = startDate!;
    } else {
      startDate = formattedDateMidnight;
    }

    if (endDate != null && endDate!.isNotEmpty) {
      endDate = endDate!;
    } else {
      endDate = formattedDate;
    }

    controller.getCostEstimateDetails(startDate, deviceId, endDate,
        SharedPrefs.getString("userLoad").toString());
  }*/

  infoDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: TColors.primaryDark1,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: TextView(
                  text: "Example ## ${TTexts.energyConsumption}",
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                )),

                SizedBox(
                  height: 15.h,
                ),

                TextView(
                  text: TTexts.timeOfDay,
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextView(
                  text: "1. ${TTexts.normalSlot}",
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: TextView(
                    text: TTexts.normalPeakSlotDesc,
                    textColor: TColors.white,
                    fontSize: 18,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextView(
                  text: "2. ${TTexts.offPeakSlot}",
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: TextView(
                    text: TTexts.offPeakSlotDesc,
                    textColor: TColors.white,
                    fontSize: 18,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextView(
                  text: '3. ${TTexts.onPeakSlot}',
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: TextView(
                    text: TTexts.onPeakSlotDesc,
                    textColor: TColors.white,
                    fontSize: 18,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),

                /// Close OK
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: TextView(
                      text: TTexts.dialogOk,
                      textColor: TColors.white,
                      fontSize: 18,
                      bold: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeviceCardDetailsAppBar(
        title: deviceName,
      ),
      backgroundColor: TColors.primary,
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    String formattedStartDate =
                        DateFormat('d-MM-yyyy').format(pickedDateRange.start);
                    String formattedStartDate1 =
                        DateFormat("yyyy-MM-dd HH:mm:ss")
                            .format(pickedDateRange.start);

                    String formattedEndDate =
                        DateFormat('d-MM-yyyy').format(pickedDateRange.end);
                    String formattedEndDate1 = DateFormat("yyyy-MM-dd HH:mm:ss")
                        .format(pickedDateRange.end);

                    if (formattedStartDate == formattedEndDate) {
                      DateTime pickedDateRange =
                          DateTime.parse(formattedEndDate1);
                      DateTime updatedDateTime = pickedDateRange.copyWith(
                          hour: 23, minute: 59, second: 59);
                      formattedEndDate1 = DateFormat('yyyy-MM-dd HH:mm:ss')
                          .format(updatedDateTime);

                      if (kDebugMode) {
                        print("Start and End dates are the same.");
                      }
                    } else {
                      if (kDebugMode) {
                        print("Start and End dates are different.");
                      }
                    }

                    setState(() {
                      _selectedDateRange =
                          "From $formattedStartDate To $formattedEndDate";

                      controller.fetchCostEstimateDetail(
                          "X2024103", formattedStartDate1, formattedEndDate1);
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

              // Pie chart and other widgets below
              Obx(() {
                if (controller.isCostEstimateDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }

                final data = controller.costEstimateData.value;

                final double totalCount =
                    double.parse(data?.totalCost?.value ?? "0.0");

                final double energyCost =
                    double.tryParse(data?.totalEnergyCost?.value ?? "0.0") ??
                        0.0;
                final double govtCost = double.tryParse(
                        data?.governmentCosts?.total?.value ?? "0.0") ??
                    0.0;
                final double demandCost =
                    double.tryParse(data?.demandCosts?.total?.value ?? "0.0") ??
                        0.0;
                final double otherCost =
                    double.tryParse(data?.otherCosts?.value ?? "0.0") ?? 0.0;

// final double totalCount = energyCost + govtCost + demandCost;

                Map<String, double> dataMap = {
                  "Energy": energyCost,
                  "Govt": govtCost,
                  "Demand": demandCost,
                  "other": otherCost,
                };

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: TColors.primaryDark1,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 10.w),
                            child: InkWell(
                              onTap: () {
                                infoDialog(context);
                              },
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.info_outline,
                                    color: TColors.white,
                                  )),
                            ),
                          ),
                          // SizedBox(height: 20.h),
                          PieChart(
                            dataMap: dataMap,
                            animationDuration:
                                const Duration(milliseconds: 800),
                            chartLegendSpacing: 32.w,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            colorList: [
                              fixedColors["Energy"]!,
                              fixedColors["Govt"]!,
                              fixedColors["Demand"]!,
                              fixedColors["other"]!,
                            ],
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 15.w,
                            centerWidget: Container(
                              width: 87.w,
                              height: 87.w,
                              decoration: BoxDecoration(
                                color: TColors.primaryDark1,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Center(
                                child: TextView(
                                  text:
                                      "${NumberFormater().numberComma(number: totalCount)} Rs",
                                  textColor: Colors.white,
                                  bold: true,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            legendOptions: const LegendOptions(
                              showLegends: false,
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: false,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              chartValueBackgroundColor: TColors.primary,
                              decimalPlaces: 1,
                            ),
                          ),
                          SizedBox(height: 20.h),

                          // Assign colors based on sorted data
                          Builder(
                            builder: (context) {
                              // final sortedColors =
                              //     getSortedColors(updatedDataMap2, colorList2);

                              return Column(
                                children: [
                                  // Majority
                                  LegendNameCard(
                                    totalEnergyCost:
                                        data?.totalEnergyCost?.value ?? "0.0",
                                    tariffBreakdown:
                                        data?.tariffBreakdown ?? [],
                                    colo: fixedColors["Energy"]!,
                                  ),

                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  // Secondary
                                  LegendNameCardGovt(
                                    governmentCosts: data?.governmentCosts ??
                                        GovernmentCosts(),
                                    color: fixedColors["Govt"]!,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  // Least
                                  LegendNameCardDemand(
                                    demandCosts:
                                        data?.demandCosts ?? DemandCosts(),
                                    color: fixedColors["Demand"]!,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),

                                  /// OTHER COSTS
                                  OtherCostsWidget(
                                    value: data?.otherCosts?.value,
                                    unit: data?.otherCosts?.unit,
                                    color: fixedColors["other"]!,
                                  ),

                                  SizedBox(
                                    height: 15.h,
                                  ),

                                  CostDistributionCard(
                                    color: TColors.white,
                                    costDistribution: data?.costDistribution ??
                                        CostDistribution(),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

final Map<String, Color> fixedColors = {
  "Energy": const Color(0xff3dd598),
  "Govt": const Color(0xff0062ff),
  "Demand": const Color(0xffff974a),
  "other": const Color(0xffffc542),
};
