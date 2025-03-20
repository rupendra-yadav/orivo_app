import 'package:auro/features/navigation/view/bottom_nav_screen/controller/device_list_controller.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/device_list.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant/text_strings.dart';
import '../../../../utils/preferences/cache_manager.dart';

class Device extends StatelessWidget {
  const Device({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    final DeviceListController controller = Get.put(DeviceListController());

    // Fetch the device list when the widget is built
    // controller.getDeviceList();
    // controller.getDeviceList2();
    controller.loadDeviceListFromPrefs();
   // controller.updateFcm();





    SharedPrefs.getString(TTexts.prefAccessToken);

    if (SharedPrefs.getBool("firstLaunch") == true) {
    } else {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: "basic_chanel",
              title: "Change Password..!",
              body: "For your account’s safety,Update your password.\nClick on the Change Password in Profile."));
    }

    // Set the login preference
    SharedPrefs.setBool("isLoggedIn", true);
    SharedPrefs.setBool("firstLaunch", true);

    return Scaffold(
      backgroundColor: TColors.primary,
      body: Stack(
        children: [
          // Background image
          Image(
            image: AssetImage(TImages.imgListBg),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // RefreshIndicator wraps the scrollable widget
          RefreshIndicator(
            // The onRefresh callback triggers the controller's getDeviceList method
            onRefresh: () async {
             // await controller.getDeviceList();
              await controller.getDeviceList2();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              // Ensures that the scroll view can always be scrolled to trigger the refresh
              child: Padding(
                padding: SpacingStyle.paddingWithDefaultSpace,
                child: const DeviceList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
