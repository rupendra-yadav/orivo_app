import 'dart:async';

import 'package:auro/features/authentication/contoller/send_otp_controller.dart';
import 'package:auro/features/authentication/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/widgets/buttons/button.dart';
import '../../../common/widgets/inputFields/input_text.dart';
import '../../../common/widgets/text/text_view.dart';
import '../../../utils/constant/colors.dart';
import '../../../utils/constant/image_string.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/validate/validate.dart';
import '../contoller/verify_otp_controller.dart';

class SendOtp extends StatefulWidget {
  SendOtp({super.key, required this.resetPass});

  final int resetPass;

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  final sendOtpController = Get.put(SendOtpController());
  final verifyOtpController = Get.put(VerifyOtpController());

  int _start = 180; // 3 minutes in seconds
  bool _canResend = false;
  Timer? _timer;
  String counterText = "";

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _canResend = true;
            counterText = 'Resend OTP';
          });
        } else {
          setState(() {
            _start--;
            int minutes = (_start / 60).floor();
            int seconds = _start % 60;
            counterText =
                'Resend OTP in ${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}';
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            height: TDeviceUtils.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///  image for login
                    Center(
                      child: Image.asset(
                        TImages.imgOTPNew1,
                        height: 147.h,
                        width: 342.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// User login heading
                    const Text(TTexts.sendOTPHead,
                        style: TextStyle(fontSize: 24, color: TColors.white)),
                    InkWell(
                      onLongPress: () {
                        newUserDialog(context);
                      },
                      child: const Text(TTexts.sendOtpCred,
                          style: TextStyle(
                              fontSize: 12, color: TColors.lightGrey)),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// email input
                    Form(
                      key: sendOtpController.sendOtpFormKey,
                      child: PrefixInputText(
                        controller: sendOtpController.mobileNumber,
                        validator: (value) =>
                            Validate.validatePhoneNumber(value),
                        hint: TTexts.etHintLoginMobile,
                        preFixIcon: const Icon(Iconsax.mobile),
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    /// Sign in With password
                    InkWell(
                      onTap: () => Get.to(const Login()),
                      child: const Text(TTexts.signInWithPassword,
                          style: TextStyle(
                              fontSize: 16, color: TColors.secondary)),
                    ),

                    SizedBox(
                      height: 40.h,
                    ),

                    Form(
                      key: verifyOtpController.verifyOtpFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (sendOtpController.isOtpSend.value)
                            Text(TTexts.enterOTP,
                                style: TextStyle(
                                    fontSize: 24, color: TColors.white)),
                          SizedBox(
                            height: 10.h,
                          ),
                          if (sendOtpController.isOtpSend.value)
                            PinCodeTextField(
                              controller: verifyOtpController.otp,
                              textStyle:
                                  const TextStyle(color: TColors.white),
                              appContext: context,
                              length: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              onCompleted: (pin) {
                                // verifyOtpController.verifyOtp(resetPass);
                                verifyOtpController
                                    .verifyOtp2(widget.resetPass);
                              },
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
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
                          title: !sendOtpController.isOtpSend.value
                              ? TTexts.sendOtpToWhatsApp
                              : TTexts.verify,
                          onPressed: () {
                            // sendOtpController.sendOtp(resetPass);
                            if (sendOtpController.isOtpSend.value) {
                              verifyOtpController.verifyOtp2(widget.resetPass);
                            } else {
                              sendOtpController.otpSend(widget.resetPass);
                              startTimer();
                            }
                          }),
                    ),

                    SizedBox(
                      height: 10.h,
                    ),

                    if (sendOtpController.isOtpSend.value)
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              TTexts.dontGetTheCode,
                              style: TextStyle(
                                  color: TColors.white, fontSize: 16),
                            ),
                            InkWell(
                              onTap: () {
                                if (_canResend) {
                                 // Get.off(SendOtp(resetPass: 0));
                                  if (sendOtpController.isOtpSend.value) {
                                    sendOtpController.otpSend(widget.resetPass);
                                    startTimer();
                                  }
                                }
                              },
                              child: Text(
                                counterText,
                                style: TextStyle(
                                    color: TColors.secondary, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),

                    /// Register here
                    /*const Center(
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
                    ),*/
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

newUserDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // Prevents closing the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: TColors.primaryLight1,
        title: const TextView(
          text: TTexts.accessRequired,
          textColor: TColors.primary,
          fontSize: 25,
          bold: true,
        ),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextView(
                text: TTexts.alertNewUser,
                textColor: TColors.primary,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const TextView(
              text: TTexts.dialogOk,
              textColor: TColors.primaryDark2,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
