import 'package:auro/features/device_details/controller/device_detail_navigation_controller.dart';
import 'package:auro/features/device_details/view/widgets/device_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/text_strings.dart';
import '../../navigation/view/bottom_nav_screen/model/device_list_model.dart';

class DeviceDetailsNavigationScreen extends StatelessWidget {
  const DeviceDetailsNavigationScreen({
    super.key,
    required this.deviceListModel,
  });

  final DeviceListModel deviceListModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceDetailNavigationController());
    controller.deviceId.value=deviceListModel.mMachineId;
    return Scaffold(
      backgroundColor: TColors.primaryDark1,
      /// App Bar
      appBar:  DeviceDetailsAppBar(
        title: deviceListModel.mMachineTitle,
      ),

      /// Bottom Navigation
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
            color: TColors.primaryDark2,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          child: Obx(
            () {
              return BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.selectedIndex.value,
                onTap: (index) => controller.selectedIndex.value = index,
                selectedItemColor: TColors.secondary,
                unselectedItemColor: TColors.primaryLight1,
                backgroundColor: TColors.primaryDark2,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                iconSize: 25,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.home), label: TTexts.home,tooltip: TTexts.home),

                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.note_14), label: TTexts.history,tooltip: TTexts.history),

                  BottomNavigationBarItem(
                      icon: Icon(Icons.stacked_bar_chart), label: TTexts.insights,tooltip: TTexts.insights),

                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.setting_2), label: TTexts.settings,tooltip: TTexts.settings),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

