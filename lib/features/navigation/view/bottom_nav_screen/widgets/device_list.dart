import 'package:auro/features/device_details/view/device_detail_navigation_screen.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/controller/device_list_controller.dart';
import 'package:auro/utils/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/loaders/image_loader.dart';
import '../../../../../utils/constant/image_string.dart';
import 'device_card.dart';
import 'device_list_shimmer.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceListController());

    return Obx(() {
      if (controller.isDeviceLoading.value) return const DeviceListShimmer();

      if (controller.deviceList.isEmpty) {
        return const TImageLoaderWidget(
            text: 'Whoops! No Device available...!',
            animation: TImages.imgLoginBg,
            showAction: false);
      }

      return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.deviceList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) {
            ///
            return DeviceCard(
              deviceListModel: controller.deviceList[index],
              onPressed: () {
                Get.to(() => DeviceDetailsNavigationScreen(
                    deviceListModel: controller.deviceList[index]));
              },
              isNetworkImage: true,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: TSizes.defaultSpace);
          });
    });
  }
}
