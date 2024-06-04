import 'package:auro/features/authentication/view/send_otp.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/styles/SpacingStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/buttons/Button.dart';
import '../../../common/widgets/inputFields/inputText.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: Column(
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
              const PrefixInputText(
                hint: TTexts.etHintLoginEmail,
                preFixIcon: Icon(Iconsax.attach_circle),
                keyboardType: TextInputType.text,
              ),
              const PrefixInputText(
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
              SizedBox(
                height: 300.h,
              ),

              ///Login button
               Center(
                child: Button(
                  height: 54,
                  minWidth: 185,
                  title: TTexts.logMeIn,
                  onPressed: () => Get.to(()=> const SendOtp()),
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
                      TTexts.DoYouHaveAccount,
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
        ),
      ),
    );
  }
}


