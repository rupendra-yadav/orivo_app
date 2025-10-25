import 'package:auro/features/authentication/view/login.dart';
import 'package:auro/features/navigation/view/navigation_screen.dart';
import 'package:auro/features/navigation/view/user_edits/view/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../../utils/preferences/cache_manager.dart';
import '../model/user_detail.dart';

class VerifyOtpController extends GetxController {
  static VerifyOtpController get instance => Get.find();

  final _repository = AuthenticationRepository.instance;
  final NetworkManager networkManager = Get.find<NetworkManager>();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  GlobalKey<FormState> verifyOtpFormKey = GlobalKey<FormState>();

  final otp = TextEditingController();
  String id = '';

  Future<void> verifyOtp(int resetPassword) async {
    try {
      TFullScreenLoader.openLoadingDialog('Verifying OTP...!');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      //
      if (!verifyOtpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> userDataMap =
          _localStorage.readData(_userDataKey) ?? {};
      UserDetail user = UserDetail.fromJson(userDataMap);
      try {
        if (kDebugMode) {
          print(user.mCustName);
        }
        id = user.mCustMobile;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      final response = await _repository.verifyOtp(
          SharedPrefs.getString("mobileNumber"), otp.text.trim());

      TFullScreenLoader.stopLoading();

      SharedPrefs.setString("mobileNumber", "");

      if (response['success'] == true) {
        TLoaders.successSnackBar(
            title: 'Success', message: response['message']);
        if (resetPassword == 1) {
          Get.offAll(() => ResetPassword(
                flow: resetPassword,
              ));
        } else if (resetPassword == 2) {
          Get.offAll(() => ResetPassword(
                flow: resetPassword,
              ));
        } else {
          Get.offAll(() => const NavigationScreen());
        }
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

  Future<void> verifyOtp2(int resetPassword) async {
    try {
      TFullScreenLoader.openLoadingDialog('Verifying OTP...!');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      //
      if (!verifyOtpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> userDataMap =
          _localStorage.readData(_userDataKey) ?? {};
      UserDetail user = UserDetail.fromJson(userDataMap);
      try {
        if (kDebugMode) {
          print(user.mCustName);
        }
        id = user.mCustMobile;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      final response = await _repository.verifyOtp2(
          SharedPrefs.getString("mobileNumber") ?? "",
          otp.text.trim(),
          SharedPrefs.getString("UUID") ?? "",
          SharedPrefs.getString("FCM_TOKEN").toString(),
          SharedPrefs.getString("device_type") ?? "");

      TFullScreenLoader.stopLoading();

      // SharedPrefs.setString("mobileNumber", "");

      if (response['success'] == true) {
        TLoaders.successSnackBar(
            title: 'Success', message: response['message']);
        if (resetPassword == 1) {
          Get.offAll(() => ResetPassword(
                flow: resetPassword,
              ));
        } else if (resetPassword == 2) {
          Get.offAll(() => ResetPassword(
                flow: resetPassword,
              ));
        } else {
          Get.offAll(() => const NavigationScreen());
        }
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
