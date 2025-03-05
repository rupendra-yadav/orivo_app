import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../myapp.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../../utils/preferences/cache_manager.dart';
import '../../navigation/view/navigation_screen.dart';
import '../model/user_detail.dart';
import '../view/login.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();
  final _repository = AuthenticationRepository.instance;


  final NetworkManager networkManager = Get.find<NetworkManager>();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';



  screenRedirect() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (SharedPrefs.getBool('isLoggedIn') == true) {
          Get.offAll(const NavigationScreen());
      } else {
        Get.offAll(const Login()); //Redirect to login screen if not the first time
      }
    });
  }


  Future<void> refreshToken(String reFreshToken,String accessToken,String uuid) async {
    try {

      //TFullScreenLoader.openLoadingDialog('Logging you in...');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        //TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      // if (!loginFormKey.currentState!.validate()) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }

      // Login user using number and password
      final response = await _repository.reFresh(reFreshToken,accessToken,uuid);

      //TFullScreenLoader.stopLoading();

      if (response['success'] == true) {

        /// this is to Access data
        Map<String, dynamic> userDataMap = _localStorage.readData(_userDataKey) ?? {};
        UserDetail user = UserDetail.fromJson(userDataMap);
        try {
          if (kDebugMode) {
            print(user.mCustName);
          }
        } catch (e) {

          TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        }

        /// to navigate page to Navigation Screen
        TLoaders.successSnackBar(title: 'Success', message: response['message']);
        Get.offAll(() => const NavigationScreen());

      }else{
        TLoaders.errorSnackBar(title: 'Error', message: response['message']);
        if (kDebugMode) {
          print(response['response']);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }


}
