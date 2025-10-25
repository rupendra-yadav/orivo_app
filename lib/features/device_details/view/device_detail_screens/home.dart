import 'dart:math';

import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/device_details/view/device_detail_screens/controller/device_detail_controller.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/energy_consumption_detail.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/consumption_detail_normal_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/cost_estimate_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/model/energy_consumption_model.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/cost_estimate_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/device_detail_shimmer.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/pie_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/power_demand_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/text_view_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/total_power_factor_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/helpers/date_helper.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../utils/preferences/cache_manager.dart';
import '../../../navigation/view/bottom_nav_screen/controller/profile_detail_cotroller.dart';
import '../../controller/device_detail_navigation_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final DeviceDetailController controller = Get.put(DeviceDetailController());
  final DeviceDetailedController devicecontroller =
      Get.put(DeviceDetailedController());
  final DeviceDetailNavigationController navigationController =
      DeviceDetailNavigationController.instance;

  final userController = Get.put(ProfileDetailController());

  String timeStamp = "";

  @override
  void initState() {
    //_refreshData();
    // firstCall();
    super.initState();
  }

  void firstCall() {
    userController.getUserData2();

    DateTime now = DateTime.now();
    DateTime utcNow = now.toUtc();
    DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));
    DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);
    String formattedDateMidnight =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
    String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);

    setState(() {
      timeStamp = DateFormat("d MMMM h:mm a").format(istNow);
    });
    devicecontroller.fetchDeviceDetail(
        "X2024103", formattedDateMidnight, formattedDate);
    // controller.getDeviceDetail(
    //     navigationController.deviceId.value,
    //     formattedDate,
    //     formattedDateMidnight,
    //     SharedPrefs.getString("userLoad") ?? "0");
  }

  // Refresh method
  Future<void> _refreshData() async {
    // userController.getUserData();

    DateTime now = DateTime.now();
    DateTime utcNow = now.toUtc();
    DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));
    DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);
    String formattedDateMidnight =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
    String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);

    setState(() {
      timeStamp = DateFormat("d MMMM h:mm a").format(istNow);
    });
    devicecontroller.fetchDeviceDetail(
        "X2024103", formattedDateMidnight, formattedDate);

    // controller.getDeviceDetail(
    //     "navigationController.deviceId.value",
    //     formattedDate,
    //     formattedDateMidnight,
    //     userController.userModel[0].custTotalload?.toString() ?? "0");
    //await controller.getDeviceDataItems();
  }

  @override
  Widget build(BuildContext context) {
    originalDataMap2.forEach((key, value) {
      updatedDataMap2['$key: $value'] = value;
    });

    return Scaffold(
      backgroundColor: TColors.primary,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Padding(
            padding: SpacingStyle.paddingWithDefaultSpace,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //               /// updated at date time
                //               Obx(() {

                //                 if (kDebugMode) {
                //                   print("date format Exceptions");
                //                   print(controller.energyConsumptionData.value.latestDataTs?.value.toString());
                //                 }

                //                 final deviceData = devicecontroller.deviceDetailData.value;

                //                 return Row(
                //                   children: [
                //                     Spacer(),
                // Text("Last Updated: ${deviceData?.latestDataTs ?? "NA"}"),
                //     Text("Total Energy Cost: ₹${deviceData?.totalEnergyCost ?? "NA"}"),                        // text: "Updated : " +
                //                     TextView(text: "",
                //                       //     (controller.energyConsumptionData.value.latestDataTs?.value != null &&
                //                       //         controller.energyConsumptionData.value.latestDataTs!.value!.isNotEmpty &&
                //                       //         controller.energyConsumptionData.value.latestDataTs!.value != "N/A"
                //                       //         ? DateHelper().formatDateTime(
                //                       //         controller.energyConsumptionData.value.latestDataTs!.value!)
                //                       //         : controller.energyConsumptionData.value.latestDataTs?.value ?? ""),

                //                       fontSize: 11,
                //                     )
                //                   ],
                //                 );
                //               }),
                /// inside build()

                /// updated at date time
                Obx(() {
                  if (kDebugMode) {
                    print("date format Exceptions");
                    // print(controller
                    //     .energyConsumptionData.value.latestDataTs?.value
                    //     .toString());
                    print(devicecontroller
                        .deviceDetailData.value?.latestDataTs?.value
                        .toString());
                  }

                  final deviceData = devicecontroller.deviceDetailData.value;

                  return Row(
                    children: [
                      const Spacer(),
                      Text(
                        "Updated: " +
                            ((deviceData?.latestDataTs?.value != null &&
                                    deviceData?.latestDataTs?.value
                                            .toString() !=
                                        "N/A")
                                ? DateFormat('dd MMM yyyy hh:mm a').format(
                                    DateTime.tryParse(deviceData
                                                ?.latestDataTs?.value
                                                .toString() ??
                                            "") ??
                                        DateTime.now())
                                : "NA"),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                    ],
                  );
                }),

                ///Energy Consumption

                Obx(() {
                  if (devicecontroller.isDeviceDetailLoading.value) {
                    return const DeviceDetailShimmer();
                  }
                  final deviceData = devicecontroller.deviceDetailData.value;

                  double onPeak = double.tryParse(deviceData
                              ?.tariffConsumptionData
                              ?.breakdown[0]
                              .consumption ??
                          '') ??
                      0.0;
                  double offPeak = double.tryParse(deviceData
                              ?.tariffConsumptionData
                              ?.breakdown[1]
                              .consumption ??
                          '') ??
                      0.0;
                  double normal = double.tryParse(deviceData
                              ?.tariffConsumptionData
                              ?.breakdown[2]
                              .consumption ??
                          '') ??
                      0.0;
                  double totalCount = onPeak + offPeak + normal;

                  return PieCard(
                    energyConsumptionModel: deviceData!.tariffConsumptionData!,
                    totalCount: totalCount,
                    legendPosition: LegendPosition.right,
                    onPressed: () => Get.to(() => const EnergyConsumptionDetail(
                          isNotify: false,
                        )),
                  );
                }),

                ///Cost Estimate
                Obx(() {
                  final deviceData = devicecontroller.deviceDetailData.value;

                  if (devicecontroller.isDeviceDetailLoading.value) {
                    return const DeviceDetailShimmer();
                  }

                  double energy = deviceData?.totalEnergyCost?.value is double
                      ? deviceData?.totalEnergyCost?.value as double
                      : double.tryParse(
                              deviceData?.totalEnergyCost?.value?.toString() ??
                                  '') ??
                          0.0;
                  double govt = deviceData?.totalGovCost?.value is double
                      ? deviceData?.totalGovCost?.value as double
                      : double.tryParse(
                              deviceData?.totalGovCost?.value?.toString() ??
                                  '') ??
                          0.0;
                  double demand = deviceData?.demandCost?.value is double
                      ? deviceData?.demandCost?.value as double
                      : double.tryParse(
                              deviceData?.demandCost?.value?.toString() ??
                                  '') ??
                          0.0;
                  // double others =
                  // controller.costEstimateModel.value.other?.value ?? 0.0;
                  double totalCont = energy + govt + demand;

                  return CostEstimateCard(
                      // costEstimateModel: CostEstimateModel()
                      energy: energy,
                      govt: govt,
                      demand: demand,
                      totalCount: totalCont);
                }),

                ///Demand
                Obx(() {
                  final deviceData = devicecontroller.deviceDetailData.value;

                  if (devicecontroller.isDeviceDetailLoading.value) {
                    return const DeviceDetailShimmer();
                  }
                  // if (userController.isUserDataLoading.value) {
                  //   return const DeviceDetailShimmer();
                  // }

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: PowerDemandCard(
                      // demandModel: controller.demandModel.value,
                      avg: deviceData?.demand?.value ?? "0.0",
                      totalLoad: deviceData?.demand?.value ?? "0.0",
                      avgUnit: deviceData?.demand?.unit ?? "KVA",
                      // totalLoad: userController.userModel[0].custTotalload
                      //         ?.toString() ??
                      //     "1.0",
                    ),
                  );
                }),

                ///Total Power Factors
                Obx(() {
                  final deviceData = devicecontroller.deviceDetailData.value;

                  if (devicecontroller.isDeviceDetailLoading.value) {
                    return const DeviceDetailShimmer();
                  }

                  return TotalPowerFactorsCard(
                    // powerFactorModel: controller.powerFactorModel.value,
                    Pf: deviceData?.pf?.value ?? '0.0',
                  );
                }),

                /// this is the device detail data
                Obx(() {
                  final deviceData = devicecontroller.deviceDetailData.value;

                  if (devicecontroller.isDeviceDetailLoading.value) {
                    return const DeviceDetailShimmer();
                  }

                  return Row(
                    children: [
                      Expanded(
                          child: TextViewCard(
                        cardText: TTexts.frequency,
                        width: TDeviceUtils.screenWidth / 2,
                        cardValue: deviceData?.frequency?.value ?? "NA",
                        cardUnit: deviceData?.frequency?.unit ?? "NA",
                        // "${controller.baseMetricModel.value.freq?.value?.toStringAsFixed(2) ?? "NA"} ${controller.baseMetricModel.value.freq?.unit?.toString() ?? "NA"}",
                        cardAvg: "",
                        // "Avg : ${controller.frequencyDetailsModel.value.avgFreq?.value?.toStringAsFixed(2) ?? "NA"}${controller.frequencyDetailsModel.value.avgFreq?.unit?.toString() ?? "NA"}"
                      )),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: TextViewCard(
                            cardText: TTexts.totalVoltage,
                            width: TDeviceUtils.screenWidth / 2,
                            cardValue: deviceData?.voltage?.value ?? "NA",
                            cardUnit: deviceData?.voltage?.unit ?? "NA",
                            // cardValue:
                            //     "${controller.baseMetricModel.value.volt?.value?.toStringAsFixed(2) ?? "NA"} ${controller.baseMetricModel.value.volt?.unit?.toString() ?? "NA"}",
                            cardAvg: ""
                            // "Avg : ${controller.voltageDetailsModel.value.avgVolt?.value?.toStringAsFixed(2) ?? "NA"}${controller.voltageDetailsModel.value.avgVolt?.unit?.toString() ?? "NA"}",
                            ),
                      ),
                    ],
                  );
                }),

                ///Power Factors Data
                Obx(() {
                  final deviceData = devicecontroller.deviceDetailData.value;

                  if (devicecontroller.isDeviceDetailLoading.value) {
                    return const DeviceDetailShimmer();
                  }

                  /* if (controller.energyConsumptionData.value.normalUnit.isNull) {
                      return const TImageLoaderWidget(
                          text: 'Whoops! No Device available...!',
                          animation: TImages.imgLoginBg,
                          showAction: false);
                    }*/

                  return Row(
                    children: [
                      Expanded(
                        child: TextViewCard(
                          cardText: TTexts.totalCurrent,
                          width: TDeviceUtils.screenWidth / 2,
                          // cardValue:
                          //     "${controller.baseMetricModel.value.current?.value?.toStringAsFixed(1) ?? "NA"} ${controller.baseMetricModel.value.current?.unit?.toString() ?? "NA"}",
                          cardValue: deviceData?.current?.value ?? "NA",
                          cardUnit: deviceData?.current?.unit ?? "NA",
                          cardAvg: "",
                          // "${controller.powerFactorModel.value.pf?.value?.toStringAsFixed(2) ?? "NA"}${controller.powerFactorModel.value.pf?.unit?.toString() ?? "NA"}",
                        ),
                      ),
                      SizedBox(width: 5.w),
                      /* Expanded(
                          child: TextViewCard(
                            cardText: TTexts.totalHD,
                            width: TDeviceUtils.screenWidth / 2,
                            cardValue:  "${(controller.powerFactorModel.value.totalPf?.value ?? 0.0).toStringAsFixed(1)}${controller.powerFactorModel.value.totalPf?.unit?.toString() ?? "0.0"}",
                            cardAvg:  "${(controller.powerFactorModel.value.avgPf?.value ?? 0.0).toStringAsFixed(1)}${controller.powerFactorModel.value.avgPf?.unit?.toString() ?? "0.0"}",
                          ),
                        ),*/
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////

///Below data is for the pie charts

final colorList = <Color>[
  const Color(0xFFFEB546),
  const Color(0xFFFFC0BB),
  const Color(0XFF344BFD),
];

Map<String, double> originalDataMap2 = {
  "On Peak": 30,
  "Off Peak": 50,
  "Normal": 70,
};
Map<String, double> updatedDataMap2 = {};
