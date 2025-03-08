import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/legend_name_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/lrgend_name_card_demand.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/lrgend_name_card_govt.dart';
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

  final DeviceDetailController controller = Get.put(DeviceDetailController());

  String _selectedDateRange = TTexts.chooseDateRange;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.isNotify == true) {
      args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      // Initialize values safely
      deviceId = args['deviceId'] ?? controller.deviceList[0].mMachineUniqueId;
      deviceName =  TTexts.costEstimate;
      DateTime now = DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
      DateTime midnight = DateTime(now.year, now.month, now.day);

      startDate = args['startDate'] ?? DateFormat("yyyy-MM-dd HH:mm:ss").format(midnight);
      endDate = args['endDate'] ?? DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

      // Fetch data
      controller.getCostEstimateDetails(
        startDate,
        deviceId,
        endDate,
        SharedPrefs.getString("userLoad").toString(),
      );
    }else{
      //deviceId = controller.deviceList[0].mMachineUniqueId;
      deviceName =  TTexts.costEstimate;

      DateTime now =
      DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
      DateTime midnight = DateTime(now.year, now.month, now.day);

      startDate =
          DateFormat("yyyy-MM-dd HH:mm:ss").format(midnight);
      endDate =
           DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

      // Fetch data
      // controller.getCostEstimateDetails(
      //   startDate,
      //   deviceId,
      //   endDate,
      //   SharedPrefs.getString("userLoad").toString(),
      // );
    }
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
      barrierDismissible: true,
      // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: TColors.primaryDark1,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: TextView(text: TTexts.energyConsumption, textColor: TColors.white, fontSize: 18, bold: true,)),

                SizedBox(height: 15.h,),

                TextView(text: TTexts.timeOfDay, textColor: TColors.white, fontSize: 18, bold: true,),
                SizedBox(height: 15.h,),
                TextView(text: "1. ${TTexts.normalSlot}", textColor: TColors.white, fontSize: 18, bold: true,),
                SizedBox(height: 5.h,),
                Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.normalPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                SizedBox(height: 15.h,),
                TextView(text: "2. ${TTexts.offPeakSlot}", textColor: TColors.white, fontSize: 18, bold: true,),
                SizedBox(height: 5.h,),
                Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.offPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                SizedBox(height: 15.h,),
                TextView(text: '3. ${TTexts.onPeakSlot}', textColor: TColors.white, fontSize: 18, bold: true,),
                SizedBox(height: 5.h,),
                Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.onPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                SizedBox(height: 20.h,),


                /// Close OK
                Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: TextView(text: TTexts.dialogOk, textColor: TColors.white, fontSize: 18, bold: true,),
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

                      controller.getCostEstimateDetails(
                          formattedStartDate1,
                          deviceId,
                          formattedEndDate1,
                          SharedPrefs.getString("userLoad").toString());
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

              // Pie chart and other widgets below
              Obx(() {
                if (controller.isCostEstimateDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }

                Map<String, double> originalDataMap = {
                  "Energy": controller.costEstimateDetailsModel.value
                          .totalEnergyCost?.value ??
                      0.0,
                  "Govt": controller
                          .costEstimateDetailsModel.value.govCost?.value ??
                      0.0,
                  "Demand": controller.costEstimateDetailsModel.value
                          .totolDemandCost?.value ??
                      0.0,
                };

                Map<String, double> updatedDataMap2 = {};

                originalDataMap.forEach((key, value) {
                  updatedDataMap2['$key: $value'] = value;
                });

                double onPeak = controller.costEstimateDetailsModel.value
                        .totolDemandCost?.value ??
                    0.0;
                double offPeak = controller.costEstimateDetailsModel.value
                        .totalEnergyCost?.value ??
                    0.0;
                double normal =
                    controller.costEstimateDetailsModel.value.govCost?.value ??
                        0.0;
                double totalCount = onPeak + offPeak + normal;

                List<MapEntry<String, Color>> getSortedColors(
                    Map<String, double> dataMap, List<Color> colorList) {
                  if (dataMap.isEmpty || colorList.isEmpty) return [];

                  // Combine dataMap keys and values with colors
                  List<MapEntry<String, double>> dataEntries =
                      dataMap.entries.toList();

                  // Sort data entries by value in descending order
                  dataEntries.sort((a, b) => b.value.compareTo(a.value));

                  // Map the sorted data entries to colors
                  return List<MapEntry<String, Color>>.generate(dataEntries.length, (index) => MapEntry(dataEntries[index].key, colorList[index]),
                  );
                }

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

                        horizontal: 10.w,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.w),
                            child: InkWell(
                              onTap: (){
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
                            dataMap: updatedDataMap2,
                            animationDuration:
                                const Duration(milliseconds: 800),
                            chartLegendSpacing: 32.w,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            colorList: colorList2,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 10.w,
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
                              final sortedColors =
                                  getSortedColors(updatedDataMap2, colorList2);

                              return Column(
                                children: [
                                  // Majority
                                  LegendNameCard(
                                    costEstimateDetailModel: controller
                                        .costEstimateDetailsModel.value,
                                    colo: sortedColors.isNotEmpty
                                        ? sortedColors[0].value
                                        : Colors.transparent,
                                  ),

                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  // Secondary
                                  LegendNameCardGovt(
                                    costEstimateDetailModel: controller
                                        .costEstimateDetailsModel.value,
                                    color: sortedColors.length > 1
                                        ? sortedColors[1].value
                                        : Colors.transparent,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  // Least
                                  LegendNameCardDemand(
                                    costEstimateDetailModel: controller
                                        .costEstimateDetailsModel.value,
                                    color: sortedColors.length > 2
                                        ? sortedColors[2].value
                                        : Colors.transparent,
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

                /*Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: TColors.primaryDark1,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      child: Column(
                        children: [
                          // Pie Chart
                          SizedBox(height: 20.h),
                          PieChart(
                            dataMap: updatedDataMap2,
                            animationDuration:
                                const Duration(milliseconds: 800),
                            chartLegendSpacing: 32.w,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.2,
                            colorList: colorList2,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 10.w,
                            centerWidget: Container(
                              width: 87.w,
                              height: 87.w,
                              decoration: BoxDecoration(
                                color: TColors.primaryDark1,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Center(
                                child: TextView(
                                  text: "${totalCount.toStringAsFixed(2)} Rs",
                                  textColor: Colors.white,
                                  bold: true,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            legendOptions:
                                const LegendOptions(showLegends: false),
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

                          // Legend Cards with Colors
                          LegendNameCard(
                            costEstimateDetailModel:
                                controller.costEstimateDetailsModel.value,
                            color: colorList2[0], // Pass appropriate color
                          ),
                          LegendNameCardGovt(
                            costEstimateDetailModel:
                                controller.costEstimateDetailsModel.value,
                            color: colorList2[1], // Pass appropriate color
                          ),
                          LegendNameCardDemand(
                            costEstimateDetailModel:
                                controller.costEstimateDetailsModel.value,
                            color: colorList2[2], // Pass appropriate color
                          ),
                        ],
                      ),
                    ),
                  ),
                )*/
                ;
              }),
            ],
          ),
        ),
      ),
    );
  }
}

final colorList2 = <Color>[
  const Color(0xff3dd598),
  const Color(0xff0062ff),
  const Color(0xffff974a),
];
