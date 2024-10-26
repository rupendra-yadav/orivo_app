import 'package:auro/features/device_details/view/device_detail_screens/controller/device_detail_controller.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/energy_consumption_detail.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/cost_estimate_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/device_detail_shimmer.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/pie_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/power_demand_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/text_view_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/total_power_factor_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../common/widgets/loaders/image_loader.dart';
import '../../../../utils/constant/image_string.dart';
import '../../controller/device_detail_navigation_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DeviceDetailController controller = Get.put(DeviceDetailController());
  final DeviceDetailNavigationController navigationController =
      DeviceDetailNavigationController.instance;

  List<int> selectedIndices = [0];

  void handleCardTap(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        if (selectedIndices.length >= 4) {
          selectedIndices.removeAt(0);
        }
        selectedIndices.add(index);
      }
    });
  }

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

    controller.getDeviceDetail(
        navigationController.deviceId.value, formattedDate,formattedDateMidnight);
    controller.getDeviceDataItems();

    if (kDebugMode) {
      print(navigationController.deviceId.value);
      print("checkDateOutCome");
      print(formattedDate);
      print(formattedDateMidnight);
    }
  }


  @override
  Widget build(BuildContext context) {
    originalDataMap2.forEach((key, value) {
      updatedDataMap2['$key: $value'] = value;
    });

    double totalCount2 =
        updatedDataMap2.values.reduce((a, b) => a + b); // Calculate total count
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: SpacingStyle.paddingWithDefaultSpace,
              child: Obx(() {
                if (controller.isDeviceDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }

                if (controller.deviceList.isEmpty) {
                  return const TImageLoaderWidget(
                      text: 'Whoops! No Device available...!',
                      animation: TImages.imgLoginBg,
                      showAction: false);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Energy Consumption

                    Obx(() {
                      if (controller.isEnergyConsumptionLoading.value) {
                        return const DeviceDetailShimmer();
                      }

                      double onPeak = controller
                              .energyConsumptionData.value.onPeakUnit?.value ??
                          0.0;
                      double offPeak = controller
                              .energyConsumptionData.value.offPeakUnit?.value ??
                          0.0;
                      double normal = controller
                              .energyConsumptionData.value.normalUnit?.value ??
                          0.0;
                      double totalCount = onPeak + offPeak + normal;

                      /* if (controller.energyConsumptionData.value.normalUnit.isNull) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/
                      return PieCard(
                        energyConsumptionModel: controller.energyConsumptionData.value,
                        totalCount: totalCount,
                        legendPosition: LegendPosition.right,
                        onPressed: () =>
                            Get.to(() => const EnergyConsumptionDetail()),
                      );
                    }),


                    ///Cost Estimate
                    Obx(() {
                      if (controller.isCostEstimateLoading.value) {
                        return const DeviceDetailShimmer();
                      }


                      double energy = controller
                          .costEstimateModel.value.normEnergy?.value ??
                          0.0;
                      double govt = controller
                          .costEstimateModel.value.govCost?.value ??
                          0.0;
                      double demand = controller
                          .costEstimateModel.value.demand?.value ??
                          0.0;
                      double others = controller
                          .costEstimateModel.value.other?.value ??
                          0.0;
                      double totalCont = energy + govt + demand+ others;


                      /* if (controller.energyConsumptionData.value.normalUnit.isNull) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/
                      return CostEstimateCard(
                              costEstimateModel: controller.costEstimateModel.value,
                              totalCount: totalCont);
                    }),

                    ///Demand
                    Obx(() {
                      if (controller.isDemandLoading.value) {
                        return const DeviceDetailShimmer();
                      }

                      /* if (controller.energyConsumptionData.value.normalUnit.isNull) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/

                      return


                          Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: PowerDemandCard(
                          demandModel: controller.demandModel.value,
                        ),
                      );
                    }),

                    ///Total Power Factors
                    Obx(() {
                      if (controller.isPowerFactorLoading.value) {
                        return const DeviceDetailShimmer();
                      }

                     /*  if (controller.powerFactorModel.value.pf?.value.isNullOrBlank == false) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }
*/

                      return TotalPowerFactorsCard(
                        powerFactorModel: controller.powerFactorModel.value,
                      );
                    }),

                    /// this is the device detail data
                    Obx(() {
                      if (controller.isBaseMetricLoading.value) {
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
                                  cardText: TTexts.frequency,
                                  width: TDeviceUtils.screenWidth / 2,
                                  cardValue:
                                      "${controller.baseMetricModel.value.freq?.value?.toStringAsFixed(2) ?? "0.0"}${controller.baseMetricModel.value.freq?.unit?.toString() ?? "0.0"}",
                                  cardAvg: "Avg : ${controller.frequencyDetailsModel.value.avgFreq?.value?.toStringAsFixed(2) ?? "0.0"}${controller.frequencyDetailsModel.value.avgFreq?.unit?.toString() ?? "0.0"}")),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: TextViewCard(
                              cardText: TTexts.totalVoltage,
                              width: TDeviceUtils.screenWidth / 2,
                              cardValue:
                                  "${controller.baseMetricModel.value.volt?.value?.toStringAsFixed(2) ?? "0.0"}${controller.baseMetricModel.value.volt?.unit?.toString() ?? "0.0"}",
                              cardAvg:
                                  "Avg : ${controller.voltageDetailsModel.value.avgVolt?.value?.toStringAsFixed(2) ?? "0.0"}${controller.voltageDetailsModel.value.avgVolt?.unit?.toString() ?? "0.0"}",
                            ),
                          ),
                        ],
                      );
                    }),


                    ///Power Factors Data
                    Obx(() {
                      if (controller.isBaseMetricLoading.value) {
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
                              cardValue:
                                  "${(controller.baseMetricModel.value.current?.value ?? 0.0).toStringAsFixed(1)}${controller.baseMetricModel.value.current?.unit?.toString() ?? "0.0"}",
                              cardAvg:
                                  "${controller.powerFactorModel.value.pf?.value?.toStringAsFixed(2) ?? "0.0"}${controller.powerFactorModel.value.pf?.unit?.toString() ?? "0.0"}",
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
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////

///Below data is for the pie charts

final colorList = <Color>[
  const Color(0xff8F8EFF),
  const Color(0xffA9A8FF),
  const Color(0xffC5C4FF),
];

Map<String, double> originalDataMap2 = {
  "On Peak": 30,
  "Off Peak": 50,
  "Normal": 70,
};
Map<String, double> updatedDataMap2 = {};
