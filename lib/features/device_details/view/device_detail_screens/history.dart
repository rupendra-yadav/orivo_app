import 'package:auro/common/widgets/buttons/button.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/data_item_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/device_details_itme.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/graph.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/graph_shimmer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/buttons/text_button.dart';
import '../../../../common/widgets/inputFields/input_text.dart';
import '../../../../common/widgets/loaders/image_loader.dart';
import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/text_strings.dart';
import '../../../../utils/styles/spacing_style.dart';
import '../../../../utils/validate/validate.dart';
import '../../controller/device_detail_navigation_controller.dart';
import 'controller/device_detail_controller.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final DeviceDetailController controller = Get.put(DeviceDetailController());
  final DeviceDetailNavigationController navigationController = DeviceDetailNavigationController.instance;

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

    if (selectedIndices.contains(index)) {
      controller.getDeviceGraphData(controller.dataIts[index + 1].field, "3071123300001", "-0d");
      // TLoaders.customToast(message: navigationController.deviceId.value + "\n" +controller.dataIts[index + 1].field);
    }
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
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Container(
          color: TColors.primaryDark1,
          child: Column(
            children: [
              /// Graph
              Obx(() {
                if (controller.isDeviceGraphDataLoading.value) {
                  return const GraphShimmer();
                }

                if (controller.graphDataList.isEmpty) {
                  return const TImageLoaderWidget(
                      text: 'Whoops! No Graph available...!',
                      animation: TImages.imgLoginBg,
                      showAction: false);
                }

                return const Graph();
              }),

              /// Graph Filter
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButtonWithContainer(
                        text: TTexts.day1, onPressed: () {}),
                    TextButtonWithContainer(
                        text: TTexts.week1, onPressed: () {}),
                    TextButtonWithContainer(
                        text: TTexts.month1, onPressed: () {}),
                    TextButtonWithContainer(
                        text: TTexts.year1, onPressed: () {}),
                    TextButtonWithContainer(
                        text: TTexts.years5, onPressed: () {}),
                    TextButtonWithContainer(text: TTexts.all, onPressed: () {}),
                  ],
                ),
              ),

              /// Tabs and TabBarView
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: TColors.secondary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: TColors.secondary,
                      unselectedLabelColor: TColors.primaryLight1,
                      dividerColor: TColors.primaryLight1,
                      dividerHeight: 2.h,
                      tabs: const [
                        Tab(text: TTexts.selectDataItem),
                        Tab(text: TTexts.parameters),
                      ],
                    ),
                    Container(
                      color: TColors.primary,
                      height: 400.h, // Adjust height as necessary
                      child: TabBarView(
                        children: [
                          ///select data items Page
                          Obx(() {
                            if (controller.isDeviceDataItemsLoading.value) {
                              return const DeviceItemShimmer();
                            }

                            if (controller.dataIts.isEmpty) {
                              return const TImageLoaderWidget(
                                  text: 'Whoops! No Device available...!',
                                  animation: TImages.imgLoginBg,
                                  showAction: false);
                            }

                            return Padding(
                              padding: SpacingStyle.paddingWithDefaultSpace,
                              child: SizedBox(
                                height: 400.h,
                                child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 10.w,
                                      crossAxisSpacing: 10.h,
                                      childAspectRatio: 1),
                                  itemCount: controller.dataIts.length - 1,
                                  itemBuilder: (_, index) {
                                    return DataItemCard(
                                      colorContainer: TColors.primaryDark2,
                                      dataItems: controller.dataIts[index + 1],
                                      isSelected: selectedIndices.contains(index),
                                      onTap: () => handleCardTap(index),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),

                          ///Parameters
                          Padding(
                            padding: SpacingStyle.paddingWithDefaultSpace,
                            child: Column(
                              children: [
                                PrefixInputText(
                                  // controller: registerController.password,
                                  validator: (value) =>
                                      Validate.validateEmptyText(value),
                                  hint: TTexts.selectFromDate,
                                  preFixIcon: const Icon(Iconsax.calendar_2),
                                  obscureText: false,
                                  keyboardType: TextInputType.datetime,
                                ),

                                PrefixInputText(
                                  // controller: registerController.password,
                                  validator: (value) =>
                                      Validate.validateEmptyText(value),
                                  hint: TTexts.selectToDate,
                                  preFixIcon: const Icon(Iconsax.calendar_2),
                                  obscureText: false,
                                  keyboardType: TextInputType.datetime,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Button(
                                    height: 45.h,
                                    minWidth: 100.w,
                                    onPressed: () {},
                                    title: TTexts.apply)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
