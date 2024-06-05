import 'package:auro/features/device_details/view/device_detail_screens/history.dart';
import 'package:auro/features/device_details/view/device_detail_screens/home.dart';
import 'package:auro/features/device_details/view/device_detail_screens/insights.dart';
import 'package:auro/features/device_details/view/device_detail_screens/settings.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DeviceDetailNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  RxDouble xOffset = 0.0.obs;
  RxDouble yOffset = 0.0.obs;
  RxDouble scaleFactor = 1.0.obs;
  RxBool isDrawerOpen = false.obs;

  void toggleDrawer() {
    if (isDrawerOpen.value) {
      xOffset.value = 0;
      yOffset.value = 0;
      scaleFactor.value = 1;
      isDrawerOpen.value = false;
    } else {
      xOffset.value = 200;
      yOffset.value = 100;
      scaleFactor.value = 0.4;
      isDrawerOpen.value = true;
    }
  }

  final screens = [
    const Home(),
    const Insights(),
    const History(),
    const Settings(),

  ];
}