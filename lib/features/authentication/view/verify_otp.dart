
import 'package:auro/features/authentication/view/register.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/widgets/buttons/button.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/constant/image_string.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/styles/spacing_style.dart';


class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithAppBarHeight,
          child: SizedBox(
            height: TDeviceUtils.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                /// BackButton
                MaterialButton(
                  minWidth: 3.w,
                  onPressed: () => Navigator.pop(context),
                  child: const Icon(
                    Iconsax.arrow_left,
                    color: TColors.secondary,
                    size: 35,
                  ),
                ),

                /// setting image for OTP
                Center(
                  child: Image.asset(
                    TImages.imgLoginBg,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                /// OTP heading
                const Text(TTexts.verifyOTP,
                    style: TextStyle(fontSize: 24, color: TColors.white)),
                const Text(TTexts.verifyOtpDetails,
                    style: TextStyle(fontSize: 12, color: TColors.lightGrey)),
                SizedBox(
                  height: 20.h,
                ),

                /// otp input box
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: PinCodeTextField(
                    textStyle: const TextStyle(color: TColors.white),
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    animationType: AnimationType.slide,
                    autoFocus: true,
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 45.h,
                      fieldWidth: 40.w,
                      selectedColor: TColors.white,
                      inactiveFillColor: TColors.primaryDark2,
                      selectedFillColor: TColors.primaryDark2,
                      activeFillColor: TColors.primaryDark2,
                      activeColor: TColors.secondary,
                      inactiveColor: TColors.lightGrey,
                    ),
                  ),
                ),

                  ],
                ),

                Column(
                  children: [


                ///verify button
                Center(
                  child: Button(
                    height: 54.h,
                    minWidth: 185.w,
                    title: TTexts.verify,
                    onPressed: () => Get.to(() =>  Register()),
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                /// Resend OTP
                 const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TTexts.dontGetTheCode,
                        style: TextStyle(color: TColors.white, fontSize: 16),
                      ),
                      Text(
                        TTexts.reSendIt,
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
    );
  }
}
