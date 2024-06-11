import 'package:auro/features/notificaations/view/notifications.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/sizes.dart';
import 'package:auro/utils/constant/text_strings.dart';
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
    return Scaffold(
      /// App bar
      appBar: AppBar(
        backgroundColor: TColors.primaryDark2,
        titleSpacing: 0,
        elevation: 5.h,
        automaticallyImplyLeading: false,
        title: Container(
          height: TSizes.appBarHeight,
          color: TColors.primaryDark2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Image(
                  image: const AssetImage(TImages.imgAppBarLogo),
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
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
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
                  icon: Icon(Iconsax.cloud_lightning), label: TTexts.device),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.profile_add), label: TTexts.profile),
              BottomNavigationBarItem(
                  icon: Icon(Iconsax.setting_2), label: TTexts.settings),
            ],
          );
        },
      ),
    );
  }
}
