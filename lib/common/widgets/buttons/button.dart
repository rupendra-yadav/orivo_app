import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.height,
    required this.minWidth,
    required this.onPressed,
    required this.title,
    this.radius = 20,
  });

  final double height;
  final double minWidth;
  final void Function() onPressed;
  final String title;
  final int radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: minWidth,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      ),
      color: TColors.secondary,
      child: Text(
        title,
        style: const TextStyle(
            color: TColors.primary, fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }
}
