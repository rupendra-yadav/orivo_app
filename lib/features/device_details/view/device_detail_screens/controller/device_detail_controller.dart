import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/repository/device_repository.dart';
import '../../../../navigation/view/bottom_nav_screen/model/device_list_model.dart';

class DeviceDetailController extends GetxController {
  static DeviceDetailController get instance => Get.find();

  final _deviceReposotory = Get.put(DeviceRepository());

  RxList<DeviceListModel> deviceList = <DeviceListModel>[].obs;

  late DeviceListModel deviceListModel;

  Rx<DeviceListModel> deviceListModel2 = DeviceListModel.fromJson({}).obs;

  final isDeviceDetailLoading = false.obs;

  ///Device Detail
  Future<void> getDeviceDetail(String deviceId) async {
    try {
      isDeviceDetailLoading.value = true;

      final deviceLis = await _deviceReposotory.getDeviceDetail(deviceId);

      deviceList.assignAll(deviceLis);
      deviceListModel = deviceList[0];
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceDetailLoading.value = false;
    }
  }
}
