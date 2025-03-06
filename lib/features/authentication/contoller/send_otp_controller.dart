import 'package:auro/features/authentication/view/verify_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../../../utils/preferences/cache_manager.dart';

class SendOtpController extends GetxController {
  static SendOtpController get instance => Get.find();

  final _repository = AuthenticationRepository.instance;
  final NetworkManager networkManager = Get.find<NetworkManager>();

  final mobileNumber = TextEditingController();

  GlobalKey<FormState> sendOtpFormKey = GlobalKey<FormState>();

  Future<void> sendOtp(int redirect) async {
    try {
      TFullScreenLoader.openLoadingDialog('Sending OTP...!');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!sendOtpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final response = await _repository.sendOtp(mobileNumber.text.trim());
      SharedPrefs.setString("mobileNumber", mobileNumber.text.trim());
      TFullScreenLoader.stopLoading();

      if (response['success'] == true) {
        TLoaders.successSnackBar(
            title: 'Success', message: response['message']);
        Get.to(() =>  VerifyOtp(resetPass: redirect,));
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

  Future<void> otpSend(int redirect) async {
    try {
      TFullScreenLoader.openLoadingDialog('Sending OTP...!');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!sendOtpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final response = await _repository.sendOtp2(mobileNumber.text.trim(),SharedPrefs.getString("UUID")??"");

      SharedPrefs.setString("mobileNumber", mobileNumber.text.trim());
      TFullScreenLoader.stopLoading();

      if (response['success']== true) {
        TLoaders.successSnackBar(title: 'Success', message: response['message']);
        Get.to(() =>  VerifyOtp(resetPass: redirect,));
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
