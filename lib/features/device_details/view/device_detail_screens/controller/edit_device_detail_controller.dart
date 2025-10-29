import 'dart:io';

import 'package:auro/data/repository/device_repository.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:auro/features/navigation/view/navigation_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';

class EditDeviceDetailController extends GetxController {
  static EditDeviceDetailController get instance => Get.find();

  final _repository = DeviceRepository.instance;
  final NetworkManager networkManager = Get.find<NetworkManager>();

  GlobalKey<FormState> updateDeviceDetails = GlobalKey<FormState>();

  final userDeviceId = TextEditingController();
  final publicDeviceId = TextEditingController();
  final model = TextEditingController();
  final name = TextEditingController();
  final description = TextEditingController();
  final installationDate = TextEditingController();
  final status = TextEditingController();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  RxList<DeviceListModel> deviceListModel = <DeviceListModel>[].obs;

  // File? imageData;
  Rx<File?> imageData = Rx<File?>(null);

  Future<void> editDeviceDetails() async {
    // Validate form first
    if (!updateDeviceDetails.currentState!.validate()) return;

    // Check internet
    final isConnected = await networkManager.isConnected();
    if (!isConnected) {
      TLoaders.errorSnackBar(
        title: "No Internet",
        message: "Please check your connection and try again.",
      );
      return;
    }

    try {
      // Show loader
      TFullScreenLoader.openLoadingDialog(
        "Saving device details...",
      );

      // Build request object
      final DeviceListModel device = DeviceListModel(
        userDeviceId: userDeviceId.text.trim().isEmpty
            ? (deviceListModel.isNotEmpty
                ? deviceListModel[0].userDeviceId
                : "")
            : userDeviceId.text.trim(),
        name: name.text.trim().isEmpty
            ? (deviceListModel.isNotEmpty ? deviceListModel[0].name : "")
            : name.text.trim(),
        description: description.text.trim().isEmpty
            ? (deviceListModel.isNotEmpty ? deviceListModel[0].description : "")
            : description.text.trim(),
        publicDeviceId: '',
        imagePath: '',
        model: '',
        installationDate: '',
        status: '',
        internalDeviceId: '',
        tariffPlanName: '',
        contactLoad: '',
        factoryId: '',
        bpNumber: '',
      );

      // Call repo
      final response = await _repository.editDeviceDetails(device);

      // Stop loader
      TFullScreenLoader.stopLoading();

      // Update local list
      // deviceListModel.value = <DeviceListModel>[response];

      // Success feedback
      TLoaders.successSnackBar(
        title: "Success",
        message: "Device detail updated successfully!",
      );

      Get.off(() => NavigationScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
      );
    }
  }
}
