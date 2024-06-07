import 'package:auro/features/navigation/view/navigation_screen.dart';
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
import '../../../utils/styles/spacing_style.dart';
import '../../../utils/validate/validate.dart';

class Register extends StatelessWidget {
   Register({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      const Text(TTexts.createAccount,
                          style: TextStyle(fontSize: 24, color: TColors.white)),
                      const Text(TTexts.register_cred,
                          style: TextStyle(
                              fontSize: 12, color: TColors.lightGrey)),
                      SizedBox(
                        height: 10.h,
                      ),

                      /// email and password input
                       PrefixInputText(
                        controller:_textController ,
                        validator: Validate.validateEmptyText,
                        hint: TTexts.etHintCompanyName,
                        preFixIcon: Icon(Iconsax.building),
                        keyboardType: TextInputType.text,
                      ),

                       PrefixInputText(
                        controller: _textController,
                        validator: Validate.validateEmptyText,
                        hint: TTexts.etHintFullName,
                        preFixIcon: Icon(Iconsax.profile_add),
                        keyboardType: TextInputType.name,
                      ),
                       PrefixInputText(
                        controller: _phoneController,
                        validator: Validate.validatePhoneNumber,
                        hint: TTexts.etHintMobileNumber,
                        preFixIcon: Icon(Iconsax.call_calling),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                      ),
                       PrefixInputText(
                        controller: _emailController,
                        validator: Validate.validateEmail,
                        hint: TTexts.etHintEmailAddress,
                        preFixIcon: Icon(Icons.mail),
                        keyboardType: TextInputType.emailAddress,
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
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              Get.to(() => const NavigationScreen());
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
                              TTexts.alreadyHasAcccount,
                              style:
                                  TextStyle(color: TColors.white, fontSize: 16),
                            ),
                            Text(
                              TTexts.loginHere,
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
