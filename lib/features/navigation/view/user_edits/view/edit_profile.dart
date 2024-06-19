import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/plane_app_bar.dart';
import '../../../../../common/widgets/buttons/button.dart';
import '../../../../../common/widgets/inputFields/input_text.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/validate/validate.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const PlainAppBar(
        title: TTexts.editProfile,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithDefaultSpace,

          ///main Column
          child: SizedBox(
            height: TDeviceUtils.screenHeight-150.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        ///Profile Image
                        const CircleAvatar(
                          backgroundColor: TColors.primaryLight1,
                          minRadius: 50,
                          // Adjusted the radius to fit the image better
                          maxRadius: 50,
                          // Adjusted the radius to fit the image better
                          child: Image(
                            image: AssetImage(TImages.imgUser),
                            height: 180, // Adjusted to fit the CircleAvatar
                            width: 180, // Adjusted to fit the CircleAvatar
                            fit: BoxFit.cover,
                          ),
                        ),

                        ///TextButton
                        TextButton(
                            onPressed: () {},
                            child: const Text("Click here to change\nprofile image",
                                style: TextStyle(
                                  color: TColors.secondary,
                                  fontSize: 15,
                                )))
                      ],
                    ),

                    /// Edit Area
                    ///  Input Fields
                    ///  Company name
                    SizedBox(
                      height: 20.h,
                    ),
                    PrefixInputText(
                      // controller: registerController.companyName,
                      validator: (value) => Validate.validateEmptyText(value),
                      hint: TTexts.etHintCompanyName,
                      preFixIcon: const Icon(Iconsax.building),
                      keyboardType: TextInputType.text,
                    ),

                    /// Full Name
                    PrefixInputText(
                      // controller: registerController.fullName,
                      validator: (value) => Validate.validateEmptyText(value),
                      hint: TTexts.etHintFullName,
                      preFixIcon: const Icon(Iconsax.profile_add),
                      keyboardType: TextInputType.name,
                    ),

                    ///Mobile Number

                    PrefixInputText(
                      // controller: registerController.mobileNumber,
                      validator: (value) => Validate.validatePhoneNumber(value),
                      hint: TTexts.etHintMobileNumber,
                      preFixIcon: const Icon(Iconsax.call_calling),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),

                    ///Email Address
                    PrefixInputText(
                      // controller: registerController.emailAddress,
                      validator: (value) => Validate.validateEmail(value),
                      hint: TTexts.etHintEmailAddress,
                      preFixIcon: const Icon(Icons.mail),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
                Center(
                  child: Button(
                    height: 54.h,
                    minWidth: 185.w,
                    title: TTexts.saveDetails,
                    onPressed: () =>Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
