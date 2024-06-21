import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/profile_options.dart';
import 'package:auro/features/navigation/view/user_edits/view/edit_profile.dart';
import 'package:auro/features/navigation/view/user_edits/view/reset_password.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../web_view/webview.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile
            Stack(
              children: [
                Image(
                  image: const AssetImage(TImages.imgProfileBg),
                  width: MediaQuery.of(context).size.width,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10.h, // Adjust the position as needed
                  left: 20.w, // Adjust the position as needed
                  right: 20.w, // Adjust the position as needed
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: TColors.primaryLight1,
                        minRadius: 50.r,
                        // Adjusted the radius to fit the image better
                        maxRadius: 50.r,
                        // Adjusted the radius to fit the image better
                        child: Image(
                          image: AssetImage(TImages.imgUser),
                          height: 180.h, // Adjusted to fit the CircleAvatar
                          width: 180.w, // Adjusted to fit the CircleAvatar
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      // Added space between avatar and text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TTexts.userName,
                            style:
                                TextStyle(color: TColors.white, fontSize: 24),
                          ),
                          Text(
                            TTexts.userDesignation,
                            style: TextStyle(
                                color: TColors.secondary, fontSize: 12),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // Pushes the IconButton to the right

                      IconButton(
                        onPressed: () => Get.to(() => const EditProfile()),
                        icon: const Icon(
                          Iconsax.edit_2,
                          color: TColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 50.h,
            ),

            /// Options
            Container(
              color: TColors.primaryDark1,
              child: Column(
                children: [
                  ProfileOptions(
                      title: TTexts.helpSupport,
                      onPressed: () => Get.to(() => const CustomWebView(
                            initialUrl: TTexts.appleLink,
                            title: TTexts.helpSupport,
                          ))),
                   Divider(height: 1.h, color: TColors.primaryLight1),
                  ProfileOptions(
                    title: TTexts.aboutUs,
                    onPressed: () => Get.to(() => const CustomWebView(
                        initialUrl: TTexts.appleLink, title: TTexts.aboutUs)),
                  ),
                   Divider(height: 1.h, color: TColors.primaryLight1),
                  ProfileOptions(
                    title: TTexts.privacyPolicy,
                    onPressed: () => Get.to(() => const CustomWebView(
                        initialUrl: TTexts.appleLink,
                        title: TTexts.privacyPolicy)),
                  ),
                   Divider(height: 1.h, color: TColors.primaryLight1),
                  ProfileOptions(
                    title: TTexts.termsOfUse,
                    onPressed: () => Get.to(() => const CustomWebView(
                        initialUrl: TTexts.appleLink,
                        title: TTexts.privacyPolicy)),
                  ),
                   Divider(height: 1.h, color: TColors.primaryLight1),
                  ProfileOptions(
                    title: TTexts.changePassword,
                    onPressed: () => Get.to(() => const ResetPassword()),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: TDeviceUtils.getBottomNavigationBarHeight()),
                child: const Text(
                  TTexts.versionAndDevelopedBy,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColors.primaryLight1, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
