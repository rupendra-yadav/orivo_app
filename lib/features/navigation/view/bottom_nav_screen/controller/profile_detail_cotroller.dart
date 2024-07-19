import 'package:auro/data/repository/profile_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../authentication/model/user_detail.dart';
import '../model/user_detail_model.dart';

class ProfileDetailController extends GetxController {
  static ProfileDetailController get instance => Get.find();

  final _profileRepository = Get.put(ProfileRepository());
  RxList<UserModel> userModel = <UserModel>[].obs;
  late UserModel userModelData;
  final isUserDataLoading = false.obs;


  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';


  ///use Details
  Future<void> getUserData() async {
    try {
      /// this is to Access data
      Map<String, dynamic> userDataMap =
          _localStorage.readData(_userDataKey) ?? {};
      UserDetail user = UserDetail.fromJson(userDataMap);
      try {
        isUserDataLoading.value = true;
        final userModelResponse = await _profileRepository.getUserData(user.mCustId);
        userModel.assignAll(userModelResponse);
        userModelData =userModel[0];
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
