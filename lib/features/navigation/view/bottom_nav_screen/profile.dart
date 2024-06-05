import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/profile_options.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

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
                      const CircleAvatar(
                        backgroundColor: TColors.primaryLight1,
                        minRadius: 60,
                        // Adjusted the radius to fit the image better
                        maxRadius: 60,
                        // Adjusted the radius to fit the image better
                        child: Image(
                          image: AssetImage(TImages.imgUser),
                          height: 180, // Adjusted to fit the CircleAvatar
                          width: 180, // Adjusted to fit the CircleAvatar
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
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
                        onPressed: () {},
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
              child: const Column(
                children: [
                  ProfileOptions(title: TTexts.helpSupport,),
                  Divider(
                    height: 1,
                    color: TColors.primaryLight1,
                  ),
                  ProfileOptions(title: TTexts.aboutUs,),
                  Divider(
                    height: 1,
                    color: TColors.primaryLight1,
                  ),
                  ProfileOptions(title: TTexts.privacyPolicy,),
                  Divider(
                    height: 1,
                    color: TColors.primaryLight1,
                  ),
                  ProfileOptions(title: TTexts.termsOfUse,),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: TDeviceUtils.getBottomNavigationBarHeight()),
                child: const Text(
                  "Version 1.01\nDesigned & Developed By Logixhunt",
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

