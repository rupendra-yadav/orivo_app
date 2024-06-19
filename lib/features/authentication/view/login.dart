import 'package:auro/features/authentication/view/register.dart';
import 'package:auro/features/authentication/view/send_otp.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/validate/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/buttons/button.dart';
import '../../../common/widgets/inputFields/input_text.dart';
import '../contoller/login_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    loginController.screenRedirect();

    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            height: TDeviceUtils.screenHeight,
            child: Form(
              key: loginController.loginFormKey,
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
                      const Text(TTexts.userLogin,
                          style: TextStyle(fontSize: 24, color: TColors.white)),
                      const Text(TTexts.loginCredential,
                          style: TextStyle(
                              fontSize: 12, color: TColors.lightGrey)),
                      SizedBox(
                        height: 20.h,
                      ),

                      /// email and password input
                      /// Email Input
                      PrefixInputText(
                        controller: loginController.phoneNumber,
                        validator:(value) => Validate.validatePhoneNumber(value),
                        hint: TTexts.etHintLoginEmail,
                        preFixIcon: const Icon(Iconsax.attach_circle),
                        keyboardType: TextInputType.text,
                      ),
                      ///password input
                      PrefixInputText(
                        controller: loginController.password,
                        validator: (value) => Validate.validatePassword(value),
                        hint: TTexts.etHintLoginPass,
                        obscureText: true,
                        preFixIcon: const Icon(Iconsax.lock),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),

                      /// Sign in With OTP
                      InkWell(
                        onTap: ()=>Get.to(()=>SendOtp()),
                        child: const Text(TTexts.signInWithOTP,
                            style: TextStyle(
                                fontSize: 16, color: TColors.secondary)),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///Login button
                      Center(
                        child: Button(
                            height: 54.h,
                            minWidth: 185.w,
                            title: TTexts.logMeIn,
                            onPressed: () {
                              loginController.userLogin();
                            }),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      /// Register here
                       Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              TTexts.doYouHaveAccount,
                              style:
                                  TextStyle(color: TColors.white, fontSize: 16),
                            ),
                            InkWell(
                              onTap: () => Get.to(() => Register()),
                              child: const Text(
                                TTexts.registerHere,
                                style: TextStyle(
                                    color: TColors.secondary, fontSize: 16),
                              ),
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
