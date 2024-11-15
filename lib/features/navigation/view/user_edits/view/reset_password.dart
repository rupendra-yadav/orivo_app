import 'package:auro/common/widgets/appbar/plane_app_bar.dart';
import 'package:auro/common/widgets/buttons/button.dart';
import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/navigation/view/user_edits/controller/reset_password_controller.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/inputFields/input_text.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/validate/validate.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key,
    required this.flow});

  final int flow;

  @override
  Widget build(BuildContext context) {
    final resetPasswordController = Get.put(ResetPasswordController());

    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const PlainAppBar(title: TTexts.resetPassword),
      body: SingleChildScrollView(
        child: Form(
          key: resetPasswordController.passwordFormKey,
          child: Padding(
            padding: SpacingStyle.paddingWithDefaultSpace,
            child: SizedBox(
              height: TDeviceUtils.screenHeight - 150.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
          
                      /// Image
                      Center(
                          child: Image(
                        image: const AssetImage(TImages.resetPasswordImagePath),
                        height: 150.h,
                        width: double.infinity,
                      )),
                      SizedBox(
                        height: 50.h,
                      ),
          
                      ///heading
                      const TextView(
                        text: TTexts.createNewPassword,
                        fontSize: 25,
                      ),
          
                      /// Input Fields
                      PrefixInputText(
                         controller: resetPasswordController.password,
                        validator: (value) => Validate.validatePassword(value),
                        hint: TTexts.enterNewPassword,
                        preFixIcon: const Icon(Iconsax.key),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      PrefixInputText(
                        controller: resetPasswordController.rePassword,
                        validator: (value) => Validate.validatePassword(value),
                        hint: TTexts.confirmNewPassword,
                        preFixIcon: const Icon(Iconsax.key),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ],
                  ),
          
                  /// Button
                  Column(
                    children: [
                      Center(
                          child: Button(
                              height: 57.h,
                              minWidth: 180.w,
                              onPressed: () => resetPasswordController.resetPassword(flow),
                              title: TTexts.updatePassword))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
