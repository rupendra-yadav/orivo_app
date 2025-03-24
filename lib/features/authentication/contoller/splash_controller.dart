import 'package:auro/data/repository/profile_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../../utils/popups/loaders.dart';
import '../../../utils/preferences/cache_manager.dart';
import '../../navigation/view/bottom_nav_screen/model/user_detail_model2.dart';
import '../../navigation/view/navigation_screen.dart';
import '../view/login.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();
  final _repository = AuthenticationRepository.instance;
  final _repositoryProfile = ProfileRepository.instance;

  final NetworkManager networkManager = Get.find<NetworkManager>();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  late UserModel2 userModelData2;

  final isUserDataLoading = false.obs;

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

  Future<void> refreshToken(
      String reFreshToken, String accessToken, String uuid) async {
    try {
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TLoaders.errorSnackBar(
            title: "No Internet",
            message: "Please check your internet connection.");
        return;
      }

      final response = await _repository.reFresh(reFreshToken, accessToken, uuid);

      if (response['success'] == true) {

        getUserData();

        // Navigate based on your app's logic (only navigate if refresh is successful). You can choose one of these:
        // Get.offAll(() => const NavigationScreen());
        // Get.offAll(() => const Alerts(id: ''));
        // Get.offAll(() => const EnergyConsumptionDetail(isNotify: false));
        // Get.offAll(() => const CostEstimate(isNotify: false));
      } else {
        TLoaders.errorSnackBar(title: "Logged Out", message: "You have been logged out!");
        Get.offAll(const Login());
      }
    } catch (e) {
      if (kDebugMode) {
        print("Refresh token error: ${e.toString()}");
      }
      TLoaders.errorSnackBar(title: "Error", message: "Something Went Wrong...!"); // More generic error message
      Get.offAll(const Login());
    }
  }

  Future<void> getUserData() async {
    isUserDataLoading.value = true;

    try {
      final userModelResponse = await _repositoryProfile.getUserData2(
        SharedPrefs.getString("mobileNumber") ?? "",
        SharedPrefs.getString(TTexts.prefAccessToken) ?? "",
      );

      userModelData2 = userModelResponse;

      Get.offAll(() => const NavigationScreen());

      // Save user data locally (optional)
      //_localStorage.saveData(_userDataKey, userModelData!.toJson());

      SharedPrefs.setString("userLoad", userModelData2!.name.toString()); // Access properties like this
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Logged Out", message: "You have been logged out...!");
      Get.offAll(const Login());
      //TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isUserDataLoading.value = false;
    }
  }
}
