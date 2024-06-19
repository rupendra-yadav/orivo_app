import 'package:auro/data/repository/device_repository.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DeviceListController extends GetxController {
  static DeviceListController get instance => Get.find();

  final _deviceReposotory = Get.put(DeviceRepository());

  RxList<DeviceListModel> deviceList = <DeviceListModel>[].obs;

  final isDeviceLoading = false.obs;

  ///--------Device List
  Future<void> getDeviceList() async {
    try {
      isDeviceLoading.value = true;

      final deviceLis = await _deviceReposotory.getDeviceList();

      deviceList.assignAll(deviceLis);

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
