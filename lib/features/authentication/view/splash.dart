import 'dart:io';

import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:uuid/uuid.dart';

import '../../../myapp.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/preferences/cache_manager.dart';
import '../contoller/splash_controller.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, required this.isNotify});

  final bool isNotify;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashController = Get.put(SplashController());

  late Map<String, String> arguments;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.isNotify == true) {
      arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      String route = arguments['route'] ?? "";
      String deviceId = arguments['deviceId'] ?? "";
      String startDate = arguments['startDate'] ?? "";
      String endDate = arguments['endDate'] ?? "";

      navigatorKey.currentState?.pushNamed(
        route,
        arguments: {
          'deviceId': deviceId,
          'startDate': startDate,
          'endDate': endDate,
        },
      );
    }
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    _checkAndUpdate();

    _checkOs();

    super.initState();
  }

  String generateUuid() {
    final uuid = Uuid();
    SharedPrefs.setString("UUID", uuid.v4());
    return uuid.v4(); // Generates a v4 UUID
  }

  Future<void> _checkAndUpdate() async {
    try {
      final updateInfo = await InAppUpdate.checkForUpdate();

      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        final result = await InAppUpdate.performImmediateUpdate();
        if (result == AppUpdateResult.userDeniedUpdate) {
          exit(0);
          return;
        }
      }
      //splashController.screenRedirect();

      reFresh();

    } catch (e) {
      debugPrint('Error checking for updates: $e');
      reFresh();
     // splashController.screenRedirect();
    }
  }


  void _checkOs(){
    if(Platform.isIOS){
      if (kDebugMode) {
        print("OS is IOS");
      }
    }else{
      if (kDebugMode) {
        print("OS is Android");
      }
    }
  }

  void reFresh (){

    if (SharedPrefs.getString("UUID") == null) {
      generateUuid();
      if (kDebugMode) {
        print('New UUID.v4 --> ${generateUuid()}');
      }
    } else {
      if (kDebugMode) {
        print('Old UUID.v4 --> ${SharedPrefs.getString("UUID")}');
      }
    }

    if (SharedPrefs.getString(TTexts.prefRefreshToken) != null && SharedPrefs.getString(TTexts.prefAccessToken) != null) {
      splashController.refreshToken(
          SharedPrefs.getString(TTexts.prefRefreshToken)??"",
          SharedPrefs.getString((TTexts.prefAccessToken))??"",
          SharedPrefs.getString("UUID")??"");
    }else{
      Get.offAll(const Login());
    }
  }

  @override
  Widget build(BuildContext context) {
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
