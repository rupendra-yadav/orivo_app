import 'package:auro/features/device_details/controller/device_detail_navigation_controller.dart';
import 'package:auro/features/device_details/view/widgets/device_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/device/device_utility.dart';

class DeviceDetailsNavigationScreen extends StatelessWidget {
  const DeviceDetailsNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceDetailNavigationController());
    return Scaffold(
      /// App Bar
      appBar: const DeviceDetailsAppBar(title: TTexts.machineName,),

      /// Bottom Navigation
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
            selectedItemColor: TColors.secondary,
            unselectedItemColor: TColors.primaryLight1,
            backgroundColor: TColors.primaryDark2,
            selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 12 * TDeviceUtils.sw),
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 10 * TDeviceUtils.sw),
            iconSize: 25 * TDeviceUtils.sw,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.home), label: TTexts.home),
              BottomNavigationBarItem(
                  icon: Icon(Icons.stacked_bar_chart), label: TTexts.insights),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.note_14), label: TTexts.history),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.setting_2), label: TTexts.settings),
            ],
          );
        },
      ),
    );
  }
}


