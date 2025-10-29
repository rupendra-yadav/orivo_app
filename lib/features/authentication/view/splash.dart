import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:auro/features/device_details/view/device_detail_screens/controller/device_detail_controller.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/controller/device_list_controller.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:auro/features/navigation/view/navigation_screen.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/local_storage/storage_utility.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:intl/intl.dart';
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
  final DeviceListController controller = Get.put(DeviceListController());
  final DeviceDetailedController devicecontroller =
      Get.put(DeviceDetailedController());

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
    // firstCall();
  }

  // void firstCall() {
  //   controller.getDeviceList2();
  //   // userController.getUserData2();
  //   log(getSavedDeviceList().toString());

  //   DateTime now = DateTime.now();
  //   DateTime utcNow = now.toUtc();
  //   DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));
  //   DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);
  //   String formattedDateMidnight =
  //       DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
  //   String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);

  //   devicecontroller.fetchDeviceDetail(
  //       "X2024103", "HV4", "800", formattedDateMidnight, formattedDate);
  //   devicecontroller.fetchEnergyConsumptionDetail(
  //       "X2024103", formattedDateMidnight, formattedDate);
  //   devicecontroller.fetchCostEstimateDetail(
  //       "X2024103", formattedDateMidnight, formattedDate);

  //   //      "device_id": "X2024103",
  //   // "tariff_plan": "HV4",
  //   // "contract_demand": "800",
  //   // "start": "2025-10-17 00:00:00",
  //   // "stop": "2025-10-17 23:59:59"
  // }

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
      splashController.screenRedirect();

      reFresh();
    } catch (e) {
      debugPrint('Error checking for updates: $e');
      reFresh();
      splashController.screenRedirect();
    }
  }

  void _checkOs() {
    if (Platform.isIOS) {
      SharedPrefs.setString("device_type", "ios");
      if (kDebugMode) {
        print("OS is IOS");
      }
    } else {
      SharedPrefs.setString("device_type", "android");
      if (kDebugMode) {
        print("OS is Android");
      }
    }
  }

  void reFresh() {
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

    if (SharedPrefs.getString(TTexts.prefRefreshToken) != null &&
        SharedPrefs.getString(TTexts.prefAccessToken) != null) {
      splashController.refreshToken(
          SharedPrefs.getString(TTexts.prefRefreshToken) ?? "",
          SharedPrefs.getString((TTexts.prefAccessToken)) ?? "",
          SharedPrefs.getString("UUID") ?? "");
    } else {
      Get.offAll(const Login());
      // Get.offAll(const NavigationScreen());
    }
  }

  Future<List<DeviceListModel>> getSavedDeviceList() async {
    final TLocalStorage _localStorage = TLocalStorage();
    final String? jsonString = await _localStorage.readData("device_list");

    if (jsonString != null && jsonString.isNotEmpty) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((e) => DeviceListModel.fromJson(e)).toList();
    } else {
      return [];
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
