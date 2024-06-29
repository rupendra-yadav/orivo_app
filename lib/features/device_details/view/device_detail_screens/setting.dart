import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/setting_device_details_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/setting_notification_detjails_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constant/image_string.dart';
import '../../../../utils/device/device_utility.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SizedBox(
        height: TDeviceUtils.screenHeight,
        width: TDeviceUtils.screenWidth,
        child: Stack(
          children: [
            ///BackGround Image
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image(
                    width: TDeviceUtils.screenWidth,
                    fit: BoxFit.cover,
                    height: 140.h,
                    image: const AssetImage(TImages.imgProfileBg))),

            /// Content
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: SpacingStyle.paddingWithDefaultSpace,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: TTexts.deviceAInfo,
                        fontSize: 20,
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.deviceAName,
                        text: TTexts.deviceAName,
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.installationDate,
                        text: TTexts.date_27_01_2024,
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.deviceModalNumber,
                        text: TTexts.modelNumber,
                      ),
                      TextView(
                        text: TTexts.notification,
                        fontSize: 20,
                      ),
                      SettingNotificationDetailsCard(
                        title: TTexts.dumNumber,
                      ),
                      SettingNotificationDetailsCard(
                        title: TTexts.clickToAddNumber,
                      ),
                      SettingNotificationDetailsCard(
                        title: TTexts.clickToAddNumber,
                      ),
                      SettingNotificationDetailsCard(
                        title: TTexts.dumNumber,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
