import 'package:auro/common/widgets/shimmer/shimmer.dart';
import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/authentication/view/login.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/controller/profile_detail_cotroller.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/profile_options.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/profile_shimmer.dart';
import 'package:auro/features/navigation/view/user_edits/view/edit_profile.dart';
import 'package:auro/features/navigation/view/user_edits/view/subscription_page.dart';
import 'package:auro/features/navigation/view/user_edits/view/transactions_page.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/helpers/get_version.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../common/widgets/loaders/image_loader.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/preferences/cache_manager.dart';
import '../../../authentication/view/send_otp.dart';
import '../../../web_view/webview.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String version = "Loading...";

  @override
  void initState() {
    // TODO: implement initState
    fetchVersion();
    super.initState();
  }

  Future<void> fetchVersion() async {
    String appVersion = await getAppInfo(); // Call your function
    setState(() {
      version = appVersion; // Update the state with the fetched version
    });
  }

  Future<String> getAppInfo() async {
    // Retrieve package information
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // Extract the version
    return packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileDetailController());

    final TLocalStorage _localStorage = TLocalStorage();

    controller.getUserData();


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
                height: 90.h,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10.h,
                left: 20.w,
                right: 20.w,
                child: Row(
                  children: [
                    Obx(() {
                       if (controller.isUserDataLoading.value) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: TShimmerEffect(width: 80.w, height: 80.h),
                        );
                      }

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: CachedNetworkImage(
                          imageUrl: TImages.userImagePath +
                              controller.userModel[0].mCustImage,
                          // Provide a fallback empty string if null or empty
                          width: 80.w,
                          height: 80.h,
                          fit: BoxFit.fill,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) {
                            // Check gender and provide appropriate default image
                            return Image.asset(
                              TImages.imgUser,
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      );
                    }),
                    SizedBox(width: 10.w),
                    Obx(() {
                        if (controller.isUserDataLoading.value) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TShimmerEffect(width: 66.w, height: 15.h),
                            SizedBox(height: 10.h,),
                            TShimmerEffect(width: 33.w, height: 10.h),
                          ],
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userModel[0].mCustName,
                            style: const TextStyle(
                                color: TColors.white, fontSize: 24),
                          ),
                          Text(
                            controller.userModel[0].mCustCompany,
                            style: const TextStyle(
                                color: TColors.secondary, fontSize: 12),
                          ),
                        ],
                      );
                    }),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Get.to(() => EditProfile(
                            userModel: controller.userModelData,
                          )),
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

          /*Padding(
            padding: SpacingStyle.paddingWithDefaultSpace,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: TColors.primaryDark1,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 7.w, top: 7.h),
                      child: const TextView(
                        text: TTexts.noActiveSubscription,
                        bold: true,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => SubscriptionPage());
                        },
                        child: const TextView(
                          text: TTexts.subscribe,
                          textColor: TColors.secondary,
                          bold: true,
                        ))
                  ],
                ),
              ),
            ),
          ),*/

          SizedBox(
            height: 20.h,
          ),

          /// Options
          Container(
            color: TColors.primaryDark1,
            child: Column(
              children: [
                /// Transaction Option
                /* ProfileOptions(
                      title: TTexts.transactions,
                      onPressed: () {
                        Get.to(() => const TransactionsPage());
                      },
                    ),*/

                // Divider(height: 1.h, color: TColors.primaryLight1),

                /// Help & Support
                ProfileOptions(
                    title: TTexts.helpSupport,
                    onPressed: () => Get.to(() => const CustomWebView(
                          initialUrl: TTexts.contactUsLink,
                          title: TTexts.helpSupport,
                        ))),
                Divider(height: 1.h, color: TColors.primaryLight1),

                /// About Us
                ProfileOptions(
                  title: TTexts.aboutUs,
                  onPressed: () => Get.to(() => const CustomWebView(
                      initialUrl: TTexts.aboutUsLink, title: TTexts.aboutUs)),
                ),
                Divider(height: 1.h, color: TColors.primaryLight1),

                /// Privacy Policy
                ProfileOptions(
                  title: TTexts.privacyPolicy,
                  onPressed: () => Get.to(() => const CustomWebView(
                      initialUrl: TTexts.privacyPolicyLink,
                      title: TTexts.privacyPolicy)),
                ),
                Divider(height: 1.h, color: TColors.primaryLight1),

                ///Terms Of Use
                ProfileOptions(
                  title: TTexts.termsOfUse,
                  onPressed: () => Get.to(() => const CustomWebView(
                      initialUrl: TTexts.termsOfUseLink,
                      title: TTexts.privacyPolicy)),
                ),
                Divider(height: 1.h, color: TColors.primaryLight1),

                /// Change Password
                ProfileOptions(
                  title: TTexts.changePassword,

                  ///button
                  onPressed: () => Get.to(() => SendOtp(resetPass: 1)),
                ),
                Divider(height: 1.h, color: TColors.primaryLight1),

                ///Logout
                ProfileOptions(
                  title: TTexts.logout,
                  onPressed: () {
                    _localStorage.clearAll();

                    showMyDialog(
                        context); // Show the dialog when button is pressed
                  },
                ),
              ],
            ),
          ),

          /// Bottom Label
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  top: TDeviceUtils.getBottomNavigationBarHeight()),
              child:  Text(
                'Version ${version} \n${TTexts.versionAndDevelopedBy}',
                textAlign: TextAlign.center,
                style: TextStyle(color: TColors.primaryLight1, fontSize: 10),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

/// function for Logout Dialog

showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // Prevents closing the dialog by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: TColors.primaryLight1,
        title: const TextView(
          text: TTexts.dialogLogout,
          textColor: TColors.primary,
          fontSize: 25,
          bold: true,
        ),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextView(
                text: TTexts.dialogMessage,
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
              SharedPrefs.setBool("isLoggedIn", false);
              Get.offAll(() => const Login());
              // Handle OK action
            },
          ),
          TextButton(
            child: const TextView(
              text: TTexts.dialogCancel,
              textColor: TColors.accentDark1,
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
