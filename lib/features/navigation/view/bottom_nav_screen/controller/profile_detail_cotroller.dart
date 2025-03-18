import 'package:auro/data/repository/profile_repository.dart';
import 'package:auro/features/authentication/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../../utils/preferences/cache_manager.dart';
import '../../../../authentication/model/user_detail.dart';
import '../model/user_detail_model.dart';
import '../model/user_detail_model2.dart';

class ProfileDetailController extends GetxController {
  static ProfileDetailController get instance => Get.find();

  final NetworkManager networkManager = Get.find<NetworkManager>();
  final _profileRepository = Get.put(ProfileRepository());
  RxList<UserModel> userModel = <UserModel>[].obs;
  late UserModel userModelData;

  final isUserDataLoading = false.obs;
  final isUserNumberUpdateLoading = false.obs;

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  final TLocalStorage _localStorage1 = TLocalStorage();
  static const String _userDataKey1 = 'user_data';

  final phoneNumber = TextEditingController();

  ///use Details
  Future<void> getUserData() async {
    try {
      /// this is to Access data
      Map<String, dynamic> userDataMap = _localStorage.readData(_userDataKey) ?? {};
      UserDetail user = UserDetail.fromJson(userDataMap);
      try {
        isUserDataLoading.value = true;
        final userModelResponse = await _profileRepository.getUserData(user.mCustId);
        userModel.assignAll(userModelResponse);
        userModelData = userModel[0];

        SharedPrefs.setString("userLoad", userModel[0].custTotalload.toString());
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isUserDataLoading.value = false;
    }
  }

  ///update Phone number
  Future<void> updatePhone(int typ) async {
    final userModelResponse;
    try {
      /// this is to Access data
      Map<String, dynamic> userDataMap =
          _localStorage.readData(_userDataKey) ?? {};
      UserDetail user = UserDetail.fromJson(userDataMap);
      try {
        isUserNumberUpdateLoading.value = true;
        if (typ == 1) {
          userModelResponse = await _profileRepository.updatePhoneNumber(
              user.mCustId,
              phoneNumber.text.trim(),
              user.mCustAltWhatsapp.toString());
        } else {
          userModelResponse = await _profileRepository.updatePhoneNumber(
              user.mCustId,
              user.mCustWhatsapp.toString(),
              phoneNumber.text.trim());
        }

        userModel.assignAll(userModelResponse);
        userModelData = userModel[0];

        getUserData();

        TLoaders.successSnackBar(
            title: "Successfully Updated",
            message: "Number Updated Successfully");
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isUserNumberUpdateLoading.value = false;
    }
  }

  ///update Phone Status
  Future<void> updatePhoneStatus(int typ, int active) async {
    final userModelResponse;
    try {
      /// this is to Access data
      Map<String, dynamic> userDataMap =
          _localStorage.readData(_userDataKey) ?? {};
      UserDetail user = UserDetail.fromJson(userDataMap);
      try {
        isUserNumberUpdateLoading.value = true;

        if (typ == 0) {
          userModelResponse = await _profileRepository.updatePhoneNumberStatus(
              user.mCustId,
              active.toString(),
              userModel[0].mCustWhatsappActive.toString(),
              userModel[0].mCustAltWhatsappActive.toString());
        } else if (typ == 1) {
          userModelResponse = await _profileRepository.updatePhoneNumberStatus(
              user.mCustId,
              userModel[0].mCustMobileActive.toString(),
              active.toString(),
              userModel[0].mCustAltWhatsappActive.toString());
        } else {
          userModelResponse = await _profileRepository.updatePhoneNumberStatus(
            user.mCustId,
            userModel[0].mCustMobileActive.toString(),
            userModel[0].mCustWhatsappActive.toString(),
            active.toString(),
          );
        }

        userModel.assignAll(userModelResponse);
        userModelData = userModel[0];

        getUserData();

        TLoaders.successSnackBar(
            title: "Successfully Updated",
            message: "Number Status Updated Successfully");
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isUserNumberUpdateLoading.value = false;
    }
  }

//////////////////////// Gen 2 /////////////////////////////////////////////////
  ///use Details
  Future<void> logout() async {
    try {

      TFullScreenLoader.openLoadingDialog('Logging you Out...');

      //check internet Connection
      final isConnected = await networkManager.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      final response = await _profileRepository.logout(SharedPrefs.getString("refreshToken")??"",SharedPrefs.getString("UUID")??"");

      TFullScreenLoader.stopLoading();

      if (response['success'] == true) {

        /// to navigate page to Login Screen
        TLoaders.successSnackBar(title: 'Success', message: response['message']);
        SharedPrefs.clear();
        Get.offAll(() => const Login());

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

  ///use Details2
  Future<void> getUserData2() async {
    try {
      /// this is to Access data
      Map<String, dynamic> userDataMap = _localStorage.readData(_userDataKey) ?? {};
      UserModel2 user = UserModel2.fromJson(userDataMap);
      try {
        isUserDataLoading.value = true;
        final userModelResponse = await _profileRepository.getUserData2(SharedPrefs.getString("mobileNumber")??"",SharedPrefs.getString(TTexts.prefAccessToken)??"");
        userModel.assignAll(userModelResponse as Iterable<UserModel>);
        userModelData = userModel[0];

        SharedPrefs.setString("userLoad", userModel[0].custTotalload.toString());
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isUserDataLoading.value = false;
    }
  }

}
