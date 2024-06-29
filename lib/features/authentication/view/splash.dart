import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contoller/splash_controller.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());
    splashController.screenRedirect();
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Image(
        height: TDeviceUtils.screenHeight,
        width: TDeviceUtils.screenWidth,
        image: const AssetImage(TImages.imgSplash),
        fit: BoxFit.cover,
      ),
    );
  }
}
