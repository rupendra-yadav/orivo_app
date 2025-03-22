import 'dart:async';

import 'package:auro/features/navigation/view/bottom_nav_screen/controller/device_list_controller.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/device_list.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/preferences/cache_manager.dart';

class Device extends StatefulWidget {
  const Device({super.key});

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  // Initialize the controller using GetX
  final DeviceListController controller = Get.put(DeviceListController());

  // Fetch the device list when the widget is built
  // controller.getDeviceList();
  // controller.getDeviceList2();
  // controller.updateFcm();

  String _timerStatus = "Timer Not Started";
  bool _timerRunning = false;

  void timer() {
    setState(() {
      _timerStatus = "Running...";
      _timerRunning = true;
    });

    Timer.run(() {
      Future.delayed(const Duration(minutes: 15), () {
        // This code will execute after 15 minutes in the background.

        controller.getDeviceList2();
        // Update the UI on the main thread when the timer completes.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            // Check if the widget is still in the tree
            setState(() {
              _timerStatus = "Completed!";
              _timerRunning = false;
            });
          }
        });
      });
    });
  }

  void passwordResetNotification() {
    if (SharedPrefs.getBool("firstLaunch") == true) {
    } else {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: "basic_chanel",
              title: "Change Password..!",
              body: "For your account’s safety,Update your password.\nClick on the Change Password in Profile."));
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    controller.loadDeviceListFromPrefs();
    timer();
    passwordResetNotification();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
