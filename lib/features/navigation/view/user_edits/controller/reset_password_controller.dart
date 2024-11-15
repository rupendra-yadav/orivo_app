import 'package:auro/data/repository/profile_repository.dart';
import 'package:auro/features/authentication/view/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../authentication/model/user_detail.dart';
import '../../navigation_screen.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();

  final _repository = ProfileRepository.instance;
  final NetworkManager networkManager = Get.find<NetworkManager>();

  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  final password = TextEditingController();
  final rePassword = TextEditingController();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  Future<void> resetPassword(int state) async {
    TFullScreenLoader.openLoadingDialog('Resettling Password...');

    //check internet Connection
    final isConnected = await networkManager.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }
    //form validation
    if (!passwordFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }
    if (rePassword.text.trim() == password.text.trim()) {
      Map<String, dynamic> userDataMap =
          _localStorage.readData(_userDataKey) ?? {};
      UserDetail user = UserDetail.fromJson(userDataMap);
      try {
        final response = await _repository.updatePassword(
            user.mCustId, password.text.trim(), rePassword.text.trim());

        TFullScreenLoader.stopLoading();

        if (response['success'] == true) {
          TLoaders.successSnackBar(
              title: 'Success', message: response['message']);

          if(state == 2){
            Get.offAll(() => const Login());
          }else{
            Get.offAll(() => const NavigationScreen());
          }

        } else {
          TLoaders.errorSnackBar(title: 'Error', message: response['message']);
          if (kDebugMode) {
            print(response['response']);
          }
        }
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } else {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: " Passwords do NOT match...!");
    }
  }
}
