import 'package:auro/features/authentication/view/send_otp.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/sizes.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:auro/utils/validate/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/buttons/button.dart';
import '../../../common/widgets/inputFields/input_text.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                  const Text(TTexts.userLogin,
                      style: TextStyle(fontSize: 24, color: TColors.white)),
                  const Text(TTexts.loginCredential,
                      style: TextStyle(fontSize: 12, color: TColors.lightGrey)),
                  SizedBox(
                    height: 20.h,
                  ),

                  /// email and password input
                  PrefixInputText(
                    controller: _phoneController,
                    validator: Validate.validatePhoneNumber,
                    hint: TTexts.etHintLoginEmail,
                    preFixIcon: Icon(Iconsax.attach_circle),
                    keyboardType: TextInputType.text,
                  ),
                   PrefixInputText(
                    controller: _passwordController ,
                    validator: Validate.validatePassword,
                    hint: TTexts.etHintLoginPass,
                    preFixIcon: Icon(Iconsax.lock),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),

                  /// Sign in With OTP
                  const Text(TTexts.signInWithOTP,
                      style: TextStyle(fontSize: 16, color: TColors.secondary)),

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
                          if (_formKey.currentState!.validate()) {
                          Get.to(() =>  SendOtp());
                          }
                        }
                        ),
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
                          style: TextStyle(color: TColors.white, fontSize: 16),
                        ),
                        Text(
                          TTexts.registerHere,
                          style: TextStyle(color: TColors.secondary, fontSize: 16),
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

