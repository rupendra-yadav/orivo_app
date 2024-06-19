import 'package:auro/features/navigation/view/bottom_nav_screen/device.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/profile.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
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
    const Device(),
    const Profile(),
  ];
}
