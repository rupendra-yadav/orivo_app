import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../constant/colors.dart';
import '../helpers/helper_functions.dart';


class TFullScreenLoader {

  static void openLoadingDialog(String text,) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => const PopScope(
        canPop: false,
        child: Center(child: CircularProgressIndicator(color: TColors.secondary,)),
      ),
    );
  }

  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); //Close the dialog using Navigator
  }
}
