import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contoller/splash_controller.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final splashController = Get.put(SplashController());
    splashController.screenRedirect();
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Image(
        height: TDeviceUtils.screenHeight,
        width: TDeviceUtils.screenWidth,
        image: const AssetImage(TImages.imgSplashNew),
        fit: BoxFit.cover,
      ),
    );
  }
}
