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
