import 'package:auro/data/repository/device_repository.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../authentication/model/user_detail.dart';

class DeviceListController extends GetxController {
  static DeviceListController get instance => Get.find();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  final _deviceReposotory = Get.put(DeviceRepository());

  RxList<DeviceListModel> deviceList = <DeviceListModel>[].obs;

  final isDeviceLoading = false.obs;

  ///--------Device List
  Future<void> getDeviceList() async {

    /// this is to Access data
    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {

      try {
        isDeviceLoading.value = true;

        final deviceLis = await _deviceReposotory.getDeviceList(user.mCustId);

        deviceList.assignAll(deviceLis);


      if (kDebugMode) {
        print(user.mCustName);
      }
    } catch (e) {

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }




    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    finally{
      isDeviceLoading.value = false;
    }
  }


}
