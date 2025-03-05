import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/colors.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: TColors.primaryLight1, fontSize: 16),
            ),
            const Spacer(),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(Iconsax.arrow_right_3,color: TColors.primaryLight1,))
          ],
        ),
      ),
    );
  }
}