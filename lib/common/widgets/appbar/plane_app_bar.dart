import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constant/colors.dart';

class PlainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlainAppBar({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TColors.primaryDark2,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Iconsax.arrow_left, size: 30.h, color: TColors.secondary),
      ),
      title: Text(
        title,
        style: const TextStyle(color: TColors.white, fontSize: 20),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}