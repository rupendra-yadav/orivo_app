import 'package:get/get.dart';

import '../../../utils/preferences/cache_manager.dart';
import '../../navigation/view/navigation_screen.dart';
import '../view/login.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  screenRedirect() async {
    Future.delayed(const Duration(seconds: 3), () {

      if (SharedPrefs.getBool('isLoggedIn') == true) {
        Get.offAll(const NavigationScreen());
      } else {
        Get.offAll(
            const Login()); //Redirect to login screen if not the first time
      }
    });
  }
}
