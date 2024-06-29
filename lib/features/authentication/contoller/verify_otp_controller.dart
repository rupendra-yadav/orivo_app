import 'package:auro/features/navigation/view/navigation_screen.dart';
import 'package:auro/features/navigation/view/user_edits/view/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/local_storage/storage_utility.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
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
        id = user.mCustId;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }

      final response = await _repository.verifyOtp(id, otp.text.trim());

      TFullScreenLoader.stopLoading();

      if (response['success'] == true) {
        TLoaders.successSnackBar(
            title: 'Success', message: response['message']);
        if (resetPassword == 1) {
          Get.offAll(() => const ResetPassword());
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

  Future<void> sendOtp(String mobile) async {
    try {
      // TFullScreenLoader.openLoadingDialog('Sending OTP...!');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      /* if (!sendOtpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }*/

      final response = await _repository.sendOtp(mobile);

      TFullScreenLoader.stopLoading();

      if (response['success'] == true) {
        TLoaders.successSnackBar(
            title: 'Success', message: response['message']);
        // Get.to(() =>  VerifyOtp(resetPass: 0,));
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
