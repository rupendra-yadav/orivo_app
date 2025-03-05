import 'package:auro/features/authentication/contoller/register_controller.dart';
import 'package:auro/features/authentication/view/login.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/buttons/button.dart';
import '../../../common/widgets/inputFields/input_text.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/constant/image_string.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/validate/validate.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final registerController = Get.put(RegisterController());

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
              key: registerController.registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// setting image for login
                      Center(
                        child: Image.asset(
                          TImages.imgLoginNew
                          ,height: 230.h,width: 230.w,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      /// User login heading
                      const Text(TTexts.createAccount,
                          style: TextStyle(fontSize: 24, color: TColors.white)),
                      const Text(TTexts.registerCred,
                          style: TextStyle(
                              fontSize: 12, color: TColors.lightGrey)),
                      SizedBox(
                        height: 10.h,
                      ),

                      ///  Input Fields
                      ///  Company name
                      PrefixInputText(
                        controller: registerController.companyName,
                        validator:(value) => Validate.validateEmptyText(value),
                        hint: TTexts.etHintCompanyName,
                        preFixIcon: const Icon(Iconsax.building),
                        keyboardType: TextInputType.text,
                      ),
                      /// Full Name
                      PrefixInputText(
                        controller: registerController.fullName,
                        validator:(value) => Validate.validateEmptyText(value),
                        hint: TTexts.etHintFullName,
                        preFixIcon: const Icon(Iconsax.profile_add),
                        keyboardType: TextInputType.name,
                      ),
                      ///Mobile Number

                      PrefixInputText(
                        controller: registerController.mobileNumber,
                        validator:(value) => Validate.validatePhoneNumber(value),
                        hint: TTexts.etHintMobileNumber,
                        preFixIcon: const Icon(Iconsax.call_calling),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                      ),
                      ///Email Address
                      PrefixInputText(
                        controller: registerController.emailAddress,
                        validator:(value) => Validate.validateEmail(value),
                        hint: TTexts.etHintEmailAddress,
                        preFixIcon: const Icon(Icons.mail),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      /// Password
                      PrefixInputText(
                        controller: registerController.password,
                        validator:(value) => Validate.validatePassword(value),
                        hint: TTexts.etHintCreatePassword,
                        preFixIcon: const Icon(Iconsax.key),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ///Login button
                      Center(
                        child: Button(
                            height: 54.h,
                            minWidth: 185.w,
                            title: TTexts.continu,
                            onPressed: () {
                              registerController.registerUser();
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
                              TTexts.alreadyHasAcccount,
                              style:
                                  TextStyle(color: TColors.white, fontSize: 16),
                            ),
                            InkWell(
                              onTap: () => Get.to(() => const Login()),
                              child: const Text(
                                TTexts.loginHere,
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
