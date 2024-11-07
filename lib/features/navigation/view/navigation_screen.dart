import 'package:auro/features/notificaations/view/notifications.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/sizes.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/preferences/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../contoller/navigation_controller.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    SharedPrefs.setBool("isLoggedIn", true);
    return Scaffold(
      backgroundColor: TColors.primary,

      /// App bar
      appBar: AppBar(
        backgroundColor: TColors.primary,
        titleSpacing: 0,
        elevation: 5.h,
        automaticallyImplyLeading: false,
        title: Container(
          height: TSizes.appBarHeight,
          color: TColors.primary,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Image(
                  image: const AssetImage(TImages.imgAppBarLogoNew1),
                  height: 150.h,
                  width: 80.w,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Get.to(() => const Notifications()),
                    icon: const Icon(
                      Iconsax.notification,
                      color: TColors.white,
                      size: 22,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),

      ///Bottom Navigation
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
            color: TColors.primaryDark2,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          child: Obx(
            () {
              return BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.selectedIndex.value,
                onTap: (index) => controller.selectedIndex.value = index,
                selectedItemColor: TColors.secondary,
                unselectedItemColor: TColors.primaryLight1,
                backgroundColor: TColors.primaryDark2,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                iconSize: 25,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.cloud_lightning),
                      label: TTexts.device,
                      tooltip: TTexts.device),


                  BottomNavigationBarItem(
                      icon: Icon(Iconsax.profile_add),
                      label: TTexts.profile,
                      tooltip: TTexts.profile),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
