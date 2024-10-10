import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/device_details/view/device_detail_screens/electric_bill/electric_bill.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/setting_device_details_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/setting_notification_detjails_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/buttons/button.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/device/device_utility.dart';
import '../../controller/device_detail_navigation_controller.dart';
import 'controller/device_detail_controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceDetailController controller = Get.put(DeviceDetailController());
    final DeviceDetailNavigationController navigationController =
        DeviceDetailNavigationController.instance;

    controller.getDeviceDetail(navigationController.deviceId.value,"","");

    return Scaffold(
      backgroundColor: TColors.primary,
      body: SizedBox(
        height: TDeviceUtils.screenHeight,
        width: TDeviceUtils.screenWidth,
        child: Stack(
          children: [
            ///BackGround Image
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image(
                    width: TDeviceUtils.screenWidth,
                    fit: BoxFit.cover,
                    height: 140.h,
                    image: const AssetImage(TImages.imgProfileBg))),

            /// Content
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: SpacingStyle.paddingWithDefaultSpace,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///Electric Bill Button
                     GestureDetector(
                         onTap: () => Get.to(() => const ElectricBill()),
                         child: const TextView(text: "Eletricity Bill",fontSize: 25,textColor: TColors.accent,)),

                      SizedBox(height: 20,),

                      /// DeviceInfo
                      const TextView(
                        text: TTexts.deviceAInfo,
                        fontSize: 20,
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.deviceAName,
                        text: controller.deviceListModel.mMachineTitle,
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.installationDate,
                        text: controller.deviceListModel.mMachineAddedon,
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.deviceModalNumber,
                        text: controller.deviceListModel.mMachineModelNumber,
                      ),
                      SizedBox(height: 20.h,),

                      ///User Details
                      const TextView(
                        text: TTexts.userDetails,
                        fontSize: 20,
                      ),
                      const SettingDeviceDetailCard(
                        title: TTexts.deviceAName,
                        text:  TTexts.totalLoad
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.installationDate,
                        text: controller.deviceListModel.mMachineAddedon,
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.deviceModalNumber,
                        text: controller.deviceListModel.mMachineModelNumber,
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.deviceModalNumber,
                        text: controller.deviceListModel.mMachineModelNumber,
                      ),
                      SizedBox(height: 20.h,),

                      /// Notifications Settings
                      const TextView(
                        text: TTexts.notification,
                        fontSize: 20,
                      ),
                      const SettingNotificationDetailsCard(
                        title: TTexts.dumNumber,
                      ),
                      const SettingNotificationDetailsCard(
                        title: TTexts.clickToAddNumber,
                      ),
                      const SettingNotificationDetailsCard(
                        title: TTexts.clickToAddNumber,
                      ),
                      const SettingNotificationDetailsCard(
                        title: TTexts.dumNumber,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
