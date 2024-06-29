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

  RxString imageData = ''.obs;

  Future<void> updateProfile() async {
    //check internet Connection
    final isConnected = await networkManager.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }
    //form validation
    if (!updateProfileFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }

    Map<String, dynamic> userDataMap =
        _localStorage.readData(_userDataKey) ?? {};
    UserDetail user = UserDetail.fromJson(userDataMap);
    try {
      final response = await _repository.updateUserData(
          user.mCustId,
          name.text.trim(),
          state.text.trim(),
          city.text.trim(),
          address.text.trim(),
          companyName.text.trim(),
          companyType.text.trim(),
          ownersName.text.trim(),
          gstNumber.text.trim(),
          "");

      TFullScreenLoader.stopLoading();

      userModel.assignAll(response);
      Get.offAll(const NavigationScreen());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {}
  }

  /// Function to request and check permissions
  Future<void> cameraPermission(BuildContext context) async {
    if (kDebugMode) {
      print("Checking camera permissions");
    }
    // Check if permission is granted
    PermissionStatus permissionStatus = await Permission.camera.status;
    if (permissionStatus.isGranted) {
      print("Camera permission granted");
      // Permission is already granted, proceed with calling selectImage
      sendImageMessage(true);
    } else {
      print("Requesting camera permission");
      // Permission is not granted, request permission
      permissionStatus = await Permission.camera.request();
      if (permissionStatus.isGranted) {
        print("Camera permission granted after request");
        // Permission granted, proceed with calling selectImage
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

  /// Function to request and check permissions
  Future<void> galleryPermission(BuildContext context) async {
    print("Checking gallery permissions");
    // Check if permission is granted
    PermissionStatus permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      print("Gallery permission granted");
      // Permission is already granted, proceed with calling selectImage
      sendImageMessage(false);
    } else {
      print("Requesting gallery permission");
      // Permission is not granted, request permission
      permissionStatus = await Permission.photos.request();
      if (permissionStatus.isGranted) {
        print("Gallery permission granted after request");
        // Permission granted, proceed with calling selectImage
        sendImageMessage(false);
      } else {
        print("Gallery permission denied");
        TLoaders.errorSnackBar(
          title: 'Permission Denied',
          message: "Permission required to access photos.",
        );
      }
    }
  }

  ///send Image Message
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
      print("Image selected: ${image.path}");
      // imageData.value = image.path;
      // Implement your image upload and messaging logic here
      // For example:
      // final imageUrl = await _messageRepository.uploadImage('Chats/Images/', image);
      // await _messageRepository.sendImageMessage(userData().userId, therapistId, imageUrl);
      Future.delayed(
        const Duration(seconds: 1),
        () {} /*=> scrollDown()*/,
      );
    } else {
      print("No image selected");
      TLoaders.errorSnackBar(
        title: 'No Image Selected',
        message: "Please select an image.",
      );
    }
  }
}
