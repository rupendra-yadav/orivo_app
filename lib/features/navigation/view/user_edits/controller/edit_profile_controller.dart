import 'dart:io';

import 'package:auro/features/navigation/view/navigation_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../data/repository/profile_repository.dart';
import '../../../../../utils/helpers/network_manager.dart';
import '../../../../../utils/local_storage/storage_utility.dart';
import '../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../utils/popups/loaders.dart';
import '../../../../authentication/model/user_detail.dart';
import '../../bottom_nav_screen/model/user_detail_model.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();

  final _repository = ProfileRepository.instance;
  final NetworkManager networkManager = Get.find<NetworkManager>();

  GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final state = TextEditingController();
  final city = TextEditingController();
  final address = TextEditingController();
  final companyName = TextEditingController();
  final companyType = TextEditingController();
  final gstNumber = TextEditingController();
  final ownersName = TextEditingController();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  RxList<UserModel> userModel = <UserModel>[].obs;

  File? imageData;

  Future<void> updateProfile() async {
    //check internet Connection
    final isConnected = await networkManager.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }
    //form validation
    // if (!updateProfileFormKey.currentState!.validate()) {
    //   TFullScreenLoader.stopLoading();
    //   return;
    // }

    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {
      final response = await _repository.updateUserData(
          user.mCustId,
          name.text.trim().isEmpty?user.mCustName:name.text.trim(),
          state.text.trim().isEmpty?user.mCustState:state.text.trim(),
          city.text.trim().isEmpty?user.mCustCity:city.text.trim(),
          address.text.trim().isEmpty?user.mCustAddress:address.text.trim(),
          companyName.text.trim().isEmpty?user.mCustCompany:companyName.text.trim(),
          companyType.text.trim().isEmpty?user.mCustCompanyType:companyType.text.trim(),
          ownersName.text.trim().isEmpty?user.mCustOwnerName:ownersName.text.trim(),
          gstNumber.text.trim().isEmpty?user.mCustGstno:gstNumber.text.trim(),
          imageData!);

      TFullScreenLoader.stopLoading();

      userModel.assignAll(response);
      TLoaders.successSnackBar(title: "Success",message: "Profile Updated successfully...!");
      Get.offAll(const NavigationScreen());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {}
  }

  Future<void> cameraPermission(BuildContext context) async {
    if (kDebugMode) {
      print("Checking camera permissions");
    }

    PermissionStatus permissionStatus = await Permission.camera.status;
    if (permissionStatus.isGranted) {
      print("Camera permission granted");
      sendImageMessage(true);
    } else {
      print("Requesting camera permission");
      permissionStatus = await Permission.camera.request();
      if (permissionStatus.isGranted) {
        print("Camera permission granted after request");
        sendImageMessage(true);
      } else {
        print("Camera permission denied");
        TLoaders.errorSnackBar(
          title: 'Permission Denied',
          message: "Permission required to capture photos.",
        );
      }
    }
  }

  Future<void> galleryPermission(BuildContext context) async {
    print("Checking gallery permissions");

    // Check for storage permission for older Android versions
    PermissionStatus permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      print("Gallery permission granted");
      await sendImageMessage(false);
    } else {
      print("Requesting gallery permission");
      permissionStatus = await Permission.photos.request();

      if (permissionStatus.isGranted) {
        print("Gallery permission granted after request");
        await sendImageMessage(false);
      } else {
        print("Gallery permission denied");
        TLoaders.errorSnackBar(
          title: 'Permission Denied',
          message: "Permission required to access photos.",
        );
      }
    }
  }


  Future<void> sendImageMessage(bool isCamera) async {
    print("Opening ${isCamera ? 'camera' : 'gallery'}");
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (image != null) {
      if (kDebugMode) {
        print("Image selected: ${image.path}");
      }
      imageData = File(image.path);
      TLoaders.successSnackBar(title: "Image Selected..!", message: "Image Selected Successfully..!");
      // Correctly cast to File
    } else {
      if (kDebugMode) {
        print("No image selected");
      }
      TLoaders.errorSnackBar(
        title: 'No Image Selected',
        message: "Please select an image.",
      );
    }
  }
}
