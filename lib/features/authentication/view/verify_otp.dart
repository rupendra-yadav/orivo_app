import 'package:auro/features/authentication/contoller/verify_otp_controller.dart';
import 'package:auro/features/authentication/view/send_otp.dart';
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

class VerifyOtp extends StatelessWidget {
  VerifyOtp({super.key,
    required this.resetPass,});

  final verifyOtpController = Get.put(VerifyOtpController());

  final int resetPass;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Iconsax.arrow_left,
                color: TColors.secondary,
                size: 35,
              ),
            ),
          )),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            height: TDeviceUtils.screenHeight,
            child: Form(
              key: verifyOtpController.verifyOtpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// BackButton
                      // MaterialButton(
                      //   minWidth: 3.w,
                      //   onPressed: () => Navigator.pop(context),
                      //   child: const Icon(
                      //     Iconsax.arrow_left,
                      //     color: TColors.secondary,
                      //     size: 35,
                      //   ),
                      // ),

                      /// setting image for OTP
                      Center(
                        child: Image.asset(
                          TImages.imgLoginBgNew1,height: 230.h,width: 230.w,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      /// OTP heading
                      const Text(TTexts.verifyOTP,
                          style: TextStyle(fontSize: 24, color: TColors.white)),
                      const Text(TTexts.verifyOtpDetails,
                          style: TextStyle(
                              fontSize: 12, color: TColors.lightGrey)),
                      SizedBox(
                        height: 20.h,
                      ),

                      /// otp input box
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: PinCodeTextField(
                          controller: verifyOtpController.otp,
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
                            onPressed: () {
                              verifyOtpController.verifyOtp(resetPass);
                            }),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      /// Resend OTP
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              TTexts.dontGetTheCode,
                              style:
                              TextStyle(color: TColors.white, fontSize: 16),
                            ),
                            InkWell(
                              onTap: () => Get.off(SendOtp(resetPass: 0,)),
                              child: const Text(
                                TTexts.reSendIt,
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
