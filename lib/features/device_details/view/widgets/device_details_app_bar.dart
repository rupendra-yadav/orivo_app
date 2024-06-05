import 'package:auro/features/device_details/view/device_detail_screens/settings.dart';
import 'package:auro/features/notificaations/view/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class DeviceDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DeviceDetailsAppBar({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TColors.primaryDark2,
      titleSpacing: 0,
      elevation: 5 * TDeviceUtils.sw,
      automaticallyImplyLeading: false,
      leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Iconsax.arrow_left,color: TColors.secondary,size: 30,)),
      title: Container(
        height: TSizes.appBarHeight,
        color: TColors.primaryDark2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                title,
                style: const TextStyle(color: TColors.white, fontSize: 22),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: ()  =>Get.to(()=>const Notifications()),
                  icon: const Icon(
                    Iconsax.notification,
                    color: TColors.white,
                    size: 22,
                  ),
                ),
                IconButton(
                  onPressed: () =>Get.to(()=>const Settings()),
                  icon: const Icon(
                    Iconsax.setting_2,
                    color: TColors.white,
                    size: 22,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);
}