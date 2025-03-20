import 'dart:io';

import 'package:auro/features/authentication/model/user_detail.dart';
import 'package:auro/features/navigation/view/navigation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../../utils/preferences/cache_manager.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  final NetworkManager networkManager = Get.find<NetworkManager>();

  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final _repository = AuthenticationRepository.instance;

  Future<void> userLogin() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Login user using number and password
      final response = await _repository.userLogin(
          phoneNumber.text.trim(), password.text.trim());

      TFullScreenLoader.stopLoading();

      if (response['success'] == true) {
        /// this is to Access data
        Map<String, dynamic> userDataMap =
            _localStorage.readData(_userDataKey) ?? {};
        UserDetail user = UserDetail.fromJson(userDataMap);
        try {
          if (kDebugMode) {
            print(user.mCustName);
          }
        } catch (e) {
          TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        }

        /// to navigate page to Navigation Screen
        TLoaders.successSnackBar(
            title: 'Success', message: response['message']);
        Get.offAll(() => const NavigationScreen());
      } else {
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

  Future<void> login() async {
    try {
      String deviceType = "";
      TFullScreenLoader.openLoadingDialog('Logging you in...');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (Platform.isIOS) {
        deviceType = "ios";
        if (kDebugMode) {
          print("OS is IOS");
        }
      } else {
        deviceType = "android";
        if (kDebugMode) {
          print("OS is Android");
        }
      }

      // Login user using number and password
      final response = await _repository.login(
          phoneNumber.text.trim(),
          password.text.trim(),
          SharedPrefs.getString("UUID") ?? "",
          SharedPrefs.getString("FCM_TOKEN").toString(),
          deviceType);

      TFullScreenLoader.stopLoading();

      if (response['success'] == true) {
        SharedPrefs.setString("mobileNumber", phoneNumber.text.trim());
        /* /// this is to Access data
        Map<String, dynamic> userDataMap = _localStorage.readData(_userDataKey) ?? {};
        UserDetail user = UserDetail.fromJson(userDataMap);
        try {
          if (kDebugMode) {
            print(user.mCustName);
          }
        } catch (e) {

          TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        }*/

        /// to navigate page to Navigation Screen
        TLoaders.successSnackBar(
            title: 'Success', message: response['message']);
        Get.offAll(() => const NavigationScreen());
      } else {
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
