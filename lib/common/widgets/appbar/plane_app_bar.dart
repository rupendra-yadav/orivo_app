import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';

class PlainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlainAppBar({
    super.key,
    required this.title,
    this.colorTitle = TColors.white,
    this.colorIcon = TColors.secondary,
    this.colorAppBar = TColors.primary,
    this.sizeIcon = 30,
    this.sizeTitle = 22,
  });

  final String title;
  final Color colorTitle, colorIcon, colorAppBar;
  final double sizeIcon, sizeTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorAppBar,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Iconsax.arrow_left, size: sizeIcon, color: colorIcon),
      ),
      title: Text(
        title,
        style: TextStyle(color: colorTitle, fontSize: sizeTitle),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
