import 'package:auro/features/navigation/view/bottom_nav_screen/controller/device_list_controller.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/device_list.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/preferences/cache_manager.dart';

class Device extends StatelessWidget {
  const Device({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceListController());
    controller.getDeviceList();

    ///Setting Pref For Login
    SharedPrefs.setBool("isLoggedIn", true);

    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithDefaultSpace,
          child: const DeviceList(),

        ),
      ),
    );
  }
}
