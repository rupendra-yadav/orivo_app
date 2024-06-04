import 'package:auro/features/navigation/view/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/buttons/Button.dart';
import '../../../common/widgets/inputFields/inputText.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/constant/image_string.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/styles/SpacingStyle.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
              const Text(TTexts.createAccount,
                  style: TextStyle(fontSize: 24, color: TColors.white)),
              const Text(TTexts.RegisterCred,
                  style: TextStyle(fontSize: 12, color: TColors.lightGrey)),
              SizedBox(
                height: 20.h,
              ),

              /// email and password input
              const PrefixInputText(
                hint: TTexts.etHintCompanyName,
                preFixIcon: Icon(Iconsax.building),
                keyboardType: TextInputType.text,
              ),
              const PrefixInputText(
                hint: TTexts.etHintFullName,
                preFixIcon: Icon(Iconsax.profile_add),
                keyboardType: TextInputType.name,
              ),
              const PrefixInputText(
                hint: TTexts.etHintMobileNumber,
                preFixIcon: Icon(Iconsax.call_calling),
                keyboardType: TextInputType.number,
              ),
              const PrefixInputText(
                hint: TTexts.etHintEmailAddress,
                preFixIcon: Icon(Icons.mail),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 5.h,
              ),

              SizedBox(
                height: 180.h,
              ),

              ///Login button
              Center(
                child: Button(
                  height: 54,
                  minWidth: 185,
                  title: TTexts.continu,
                  onPressed: () => Get.to(() => const NavigationScreen()),
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
                      TTexts.alreadyHasAcccount,
                      style: TextStyle(color: TColors.white, fontSize: 16),
                    ),
                    Text(
                      TTexts.loginHere,
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
