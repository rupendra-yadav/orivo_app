import 'package:auro/features/device_details/view/device_detail_screens/history.dart';
import 'package:auro/features/device_details/view/device_detail_screens/home.dart';
import 'package:auro/features/device_details/view/device_detail_screens/electricity_bill.dart';
import 'package:auro/features/device_details/view/device_detail_screens/setting.dart';
import 'package:get/get.dart';

class DeviceDetailNavigationController extends GetxController {
  static DeviceDetailNavigationController get instance => Get.find();

  final RxString deviceId = "".obs;
  final RxString deviceName = "".obs;
  final RxString deviceInstallationDate = "".obs;
  final RxString deviceModel = "".obs;
  final RxString deviceDesc = "".obs;
  final RxString deviceTariff = "".obs;
  final RxString deviceContractDemand = "".obs;
  final RxString deviceBPNumber = "".obs;

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
    const History(),
    const Insights(),
    const Setting(),
  ];
}
