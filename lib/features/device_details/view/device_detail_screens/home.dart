import 'package:auro/common/widgets/shimmer/shimmer.dart';
import 'package:auro/features/device_details/view/device_detail_screens/controller/device_detail_controller.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/data_item_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/device_detail_shimmer.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/device_details_itme.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/graph.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/text_view_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/loaders/image_loader.dart';
import '../../../../common/widgets/text/text_view.dart';
import '../../../../utils/constant/image_string.dart';
import '../../controller/device_detail_navigation_controller.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceDetailController());
    final navigationController = DeviceDetailNavigationController.instance;
    controller.getDeviceDetail(navigationController.deviceId.value);
    controller.getDeviceDataItems();
    controller.getDeviceGraphData();

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
                    /// Daily Summary
                    const TextView(
                      text: TTexts.dailySummary,
                    ),

                    ///card
                    TextViewCard(
                      cardText: controller.deviceListModel.mMachineTitle,
                      width: double.infinity,
                    ),

                    ///Alerts
                    const TextView(
                      text: TTexts.alerts,
                    ),

                    ///cards
                    Row(
                      children: [
                        Expanded(
                          child: TextViewCard(
                              cardText:
                                  controller.deviceListModel.mMachineTitle,
                              width: TDeviceUtils.screenWidth / 2.w),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: TextViewCard(
                              cardText:
                                  controller.deviceListModel.mMachineAddedon,
                              width: TDeviceUtils.screenWidth / 2.w),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),

          /// Draggable Scroll View
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.93,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                    color: TColors.primaryDark1,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40), bottom: Radius.zero)),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      ///icon to Drag
                      const Center(
                        child: Icon(
                          Iconsax.minus,
                          color: TColors.white,
                          size: 70,
                        ),
                      ),

                      ///Graph
                      Obx(() {
                        if (controller.isDeviceGraphDataLoading.value) {
                          return const GraphShimmer();
                        }

                        if (controller.graphDataList.isEmpty) {
                          return const TImageLoaderWidget(
                              text: 'Whoops! No Device available...!',
                              animation: TImages.imgLoginBg,
                              showAction: false);
                        }

                        return const Graph();
                      }),

                      /// Select Data item
                      const Center(
                        child: TextView(
                          text: TTexts.selectDataItems,
                          fontSize: 14,
                        ),
                      ),

                      /// list view and card
                      Obx(() {
                        if (controller.isDeviceDataItemsLoading.value) {
                          return const DeviceItemShimmer();
                          ();
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 10.w,
                                      crossAxisSpacing: 10.h,
                                      childAspectRatio: 1),
                              itemCount: controller.dataIts.length-1,
                              itemBuilder: (_, index) {
                                return DataItemCard(
                                  dataItems: controller.dataIts[index+1],
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GraphShimmer extends StatelessWidget {
  const GraphShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: SpacingStyle.paddingWithDefaultSpace,child: TShimmerEffect(width: 300.w, height: 250.h),);
  }
}
