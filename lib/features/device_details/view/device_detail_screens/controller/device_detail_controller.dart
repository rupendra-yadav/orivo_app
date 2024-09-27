import 'package:auro/features/device_details/view/device_detail_screens/model/graph_data_model_api.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/repository/device_repository.dart';
import '../../../../navigation/view/bottom_nav_screen/model/device_list_model.dart';
import '../model/dart_items.dart';
import '../model/energy_consumption_model.dart';

class DeviceDetailController extends GetxController {
  static DeviceDetailController get instance => Get.find();

  final _deviceReposotory = Get.put(DeviceRepository());

  RxList<DeviceListModel> deviceList = <DeviceListModel>[].obs;
  RxList<DataItems> dataIts = <DataItems>[].obs;
  RxList<GraphData> graphDataList = <GraphData>[].obs;
  Rx<EnergyConsumptionModel> energyConsumptionData =
      EnergyConsumptionModel().obs;

  late DeviceListModel deviceListModel;
  late GraphData graphDataModel;

  final isDeviceDetailLoading = false.obs;
  final isDeviceDataItemsLoading = false.obs;
  final isDeviceGraphDataLoading = false.obs;
  final isEnergyConsumptionLoading = false.obs;

  ///Device Detail Data
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

  ///--------Device Data Items
  Future<void> getDeviceDataItems() async {
    try {
      isDeviceDataItemsLoading.value = true;

      final dataItems = await _deviceReposotory.getDataItems();

      dataIts.assignAll(dataItems);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceDataItemsLoading.value = false;
    }
  }

  ///--------Device Graph Data
  Future<void> getDeviceGraphData(
      String fieldName, deviceId, rangeValue) async {
    try {
      isDeviceGraphDataLoading.value = true;

      final graph =
          await _deviceReposotory.getGraphData(fieldName, deviceId, rangeValue);

      graphDataList.assignAll(graph);
      graphDataModel = graphDataList[0];
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isDeviceGraphDataLoading.value = false;
    }
  }

  ///--------Device Energy Consumption
  Future<void> getEnergyConsumption(String date, deviceId) async {
    try {
      isEnergyConsumptionLoading.value = true;

      final Map<String, dynamic> responsee = await _deviceReposotory.getEnergyConsumption(date, deviceId);
      final energyConsumption = EnergyConsumptionModel.fromJson(responsee);

      // Assign the object to the Rx variable
      energyConsumptionData.value = energyConsumption;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      isEnergyConsumptionLoading.value = false;
    }
  }
}
