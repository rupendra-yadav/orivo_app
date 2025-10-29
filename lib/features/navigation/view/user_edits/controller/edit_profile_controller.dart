import 'dart:io';

import 'package:auro/features/navigation/view/navigation_screen.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
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
  final pinCode = TextEditingController();

  final TLocalStorage _localStorage = TLocalStorage();
  static const String _userDataKey = 'user_data';

  RxList<UserModel> userModel = <UserModel>[].obs;

  // File? imageData;
  Rx<File?> imageData = Rx<File?>(null);

  Future<void> updateProfile() async {
    //check internet Connection
    final isConnected = await networkManager.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }
    // form validation
    // if (!updateProfileFormKey.currentState!.validate()) {
    //   TFullScreenLoader.stopLoading();
    //   return;
    // }

    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {
      /* final File? imageFile = imageData.value;

      if (imageFile == null) {
        if (kDebugMode) {
          print("Error: No image selected.");
        }
        return;
      }*/

      final response = await _repository.updateUserData(
          // user.mCustId,
          "9470092352",
          name.text.trim().isEmpty ? user.mCustName : name.text.trim(),
          companyName.text.trim().isEmpty
              ? user.mCustCompany
              : companyName.text.trim(),
          city.text.trim().isEmpty ? user.mCustCity : city.text.trim(),
          state.text.trim().isEmpty ? user.mCustState : state.text.trim(),
          address.text.trim().isEmpty ? user.mCustAddress : address.text.trim(),
          companyType.text.trim().isEmpty
              ? user.mCustCompanyType
              : companyType.text.trim(),
          pinCode.text.trim().isEmpty
              ? user.mCustOwnerName
              : pinCode.text.trim(),
          gstNumber.text.trim().isEmpty
              ? user.mCustGstno
              : gstNumber.text.trim(),
          SharedPrefs.getString(TTexts.prefAccessToken) ?? "",
          imageData.value!);

      TFullScreenLoader.stopLoading();

      // userModel.assignAll(response);
      TLoaders.successSnackBar(title: "Success", message: "$response");
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
      if (kDebugMode) {
        print("Camera permission granted");
      }
      sendImageMessage(true);
    } else if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    } else {
      if (kDebugMode) {
        print("Requesting camera permission");
      }
      permissionStatus = await Permission.camera.request();
      if (permissionStatus.isGranted) {
        if (kDebugMode) {
          print("Camera permission granted after request");
        }
        sendImageMessage(true);
      } else {
        if (kDebugMode) {
          print("Camera permission denied");
        }
        TLoaders.errorSnackBar(
          title: 'Permission Denied',
          message: "Permission required to capture photos.",
        );
      }
    }
  }

  Future<void> galleryPermission(BuildContext context) async {
    if (kDebugMode) {
      print("Checking gallery permissions");
    }

    // Check for storage permission for older Android versions
    PermissionStatus permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      if (kDebugMode) {
        print("Gallery permission granted");
      }
      await sendImageMessage(false);
    } else if (permissionStatus.isPermanentlyDenied) {
      openAppSettings();
    } else {
      if (kDebugMode) {
        print("Requesting gallery permission");
      }
      permissionStatus = await Permission.photos.request();

      if (permissionStatus.isGranted) {
        if (kDebugMode) {
          print("Gallery permission granted after request");
        }
        await sendImageMessage(false);
      } else {
        if (kDebugMode) {
          print("Gallery permission denied");
        }
        TLoaders.errorSnackBar(
          title: 'Permission Denied',
          message: "Permission required to access photos.",
        );
      }
    }
  }

  Future<void> sendImageMessage(bool isCamera) async {
    if (kDebugMode) {
      print("Opening ${isCamera ? 'camera' : 'gallery'}");
    }
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
      imageData.value = File(image.path);
      TLoaders.successSnackBar(
          title: "Image Selected..!",
          message: "Image Selected Successfully..!");
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
