import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';

class NotificationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppBar({
    super.key,
    this.title = "Notifications",
    this.colorAppBar = TColors.primary,
    this.colorTitleContainer = TColors.primary,
    this.colorText = TColors.white,
    this.colorNotification = TColors.white,
    this.colorBackArrow = TColors.secondary,
    this.sizeTitleSpacing = 0,
    this.sizeBackArrow = 30,
    this.sizeTitle = 22,
    this.sizeNotificationIcon =25,
  });

  final String title;
  final Color colorAppBar,
      colorTitleContainer,
      colorText,
      colorNotification,
      colorBackArrow;

  final double sizeTitleSpacing,
      sizeBackArrow,
      sizeTitle,
      sizeNotificationIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorAppBar,
      titleSpacing: sizeTitleSpacing,
      elevation: 5.h,
      automaticallyImplyLeading: false,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:  Icon(
            Iconsax.arrow_left,
            color: colorBackArrow,
            size: sizeBackArrow,
          )),
      title: Container(
        height: TSizes.appBarHeight,
        color: colorTitleContainer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                title,
                style:  TextStyle(color: colorText, fontSize: sizeTitle),
              ),
            ),
           /* Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => Get.to(() => const Notifications()),
                  icon: Icon(
                    Iconsax.notification,
                    color: colorNotification,
                    size: sizeNotificationIcon,
                  ),
                ),
              ],
            )*/
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);
}