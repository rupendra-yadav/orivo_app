import 'package:auro/features/authentication/view/send_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/repository/authentication_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final _repository = AuthenticationRepository.instance;
  final NetworkManager networkManager = Get.find<NetworkManager>();

  final mobileNumber = TextEditingController();
  final fullName = TextEditingController();
  final emailAddress = TextEditingController();
  final companyName = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Registering User...');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation

      if (!registerFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final response = await _repository.registerUser(
        companyName.text.trim(),
        fullName.text.trim(),
        mobileNumber.text.trim(),
        emailAddress.text.trim(),
        password.text.trim(),
      );

      TFullScreenLoader.stopLoading();

      if (response['success'] == true) {
        TLoaders.successSnackBar(
            title: 'Success', message: response['message']);
        Get.to(() => SendOtp());
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
