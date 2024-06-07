import 'package:auro/features/authentication/view/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/buttons/button.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/constant/image_string.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/styles/spacing_style.dart';
import '../../../common/widgets/inputFields/input_text.dart';
import '../../../utils/validate/validate.dart';

class SendOtp extends StatelessWidget {
  SendOtp({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: SizedBox(
            height: TDeviceUtils.screenHeight,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// setting image for login
                      Center(
                        child: Image.asset(
                          TImages.imgLoginBg,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      /// User login heading
                      const Text(TTexts.sendOTPHead,
                          style: TextStyle(fontSize: 24, color: TColors.white)),
                      const Text(TTexts.sendOtpCred,
                          style: TextStyle(
                              fontSize: 12, color: TColors.lightGrey)),
                      SizedBox(
                        height: 20.h,
                      ),

                      /// email input
                      PrefixInputText(
                        controller: _phoneController,
                        validator: Validate.validatePhoneNumber,
                        hint: TTexts.etHintLoginEmail,
                        preFixIcon: Icon(Iconsax.attach_circle),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),

                      /// Sign in With password
                      const Text(TTexts.signInWithPassword,
                          style: TextStyle(
                              fontSize: 16, color: TColors.secondary)),
                    ],
                  ),
                  Column(
                    children: [
                      ///Login button
                      Center(
                        child: Button(
                            height: 54.h,
                            minWidth: 185.w,
                            title: TTexts.send_otp,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Get.to(() => VerifyOtp());
                              }
                            }),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      /// Register here
                      const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              TTexts.doYouHaveAccount,
                              style:
                                  TextStyle(color: TColors.white, fontSize: 16),
                            ),
                            Text(
                              TTexts.registerHere,
                              style: TextStyle(
                                  color: TColors.secondary, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
