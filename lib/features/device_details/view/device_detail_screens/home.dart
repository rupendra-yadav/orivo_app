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
    controller.getDeviceDetail(navigationController.deviceId.value);
    controller.getDeviceDataItems();
    controller.getDeviceGraphData("f", "3071123300001", "-0d");
    if (kDebugMode) {
      print(navigationController.deviceId.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    originalDataMap.forEach((key, value) {
      updatedDataMap['$key: $value'] = value;
    });

    originalDataMap2.forEach((key, value) {
      updatedDataMap2['$key: $value'] = value;
    });

    double totalCount =
        updatedDataMap.values.reduce((a, b) => a + b); // Calculate total count
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
                    PieCard(
                      totalCount: totalCount,
                      legendPosition: LegendPosition.right,
                      onPressed: () =>
                          Get.to(() => const EnergyConsumptionDetail()),
                    ),

                    ///Cost Estimate
                    CostEstimateCard(totalCount: totalCount),

                    ///Demand
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.h),
                      child: const PowerDemandCard(),
                    ),
                    ///Total Power Factors

                    const TotalPowerFactorsCard(),

                    /// this is the device detail data
                    Row(
                      children: [
                        Expanded(
                          child: TextViewCard(
                            cardText: TTexts.frequency,
                            width: TDeviceUtils.screenWidth / 2,
                            cardValue: TTexts.cardValue1,
                            cardAvg: TTexts.avgValue1,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: TextViewCard(
                            cardText: TTexts.totalVoltage,
                            width: TDeviceUtils.screenWidth / 2,
                            cardValue: TTexts.cardValue2,
                            cardAvg: TTexts.avgValue2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextViewCard(
                            cardText: TTexts.totalCurrent,
                            width: TDeviceUtils.screenWidth / 2,
                            cardValue: TTexts.cardValue3,
                            cardAvg: TTexts.avgValue3,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: TextViewCard(
                            cardText: TTexts.totalHD,
                            width: TDeviceUtils.screenWidth / 2,
                            cardValue: TTexts.cardValue4,
                            cardAvg: TTexts.avgValue4,
                          ),
                        ),
                      ],
                    ),
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

Map<String, double> originalDataMap = {
  "Flutter": 30,
  "java": 50,
  "React Native": 70,
};

Map<String, double> updatedDataMap = {};

final colorList = <Color>[
  const Color(0xff8f8eff),
  const Color(0xffa9a8ff),
  const Color(0xffc5c4ff),
];

Map<String, double> originalDataMap2 = {
  "Flutter": 30,
  "java": 50,
  "React Native": 70,
  "Python": 100,
};
Map<String, double> updatedDataMap2 = {};
final colorList2 = <Color>[
  const Color(0xff0062ff),
  const Color(0xffffc542),
  const Color(0xffff974a),
  const Color(0xff3dd598),
];