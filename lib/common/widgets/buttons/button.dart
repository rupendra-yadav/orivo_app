import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';


class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.height,
    required this.minWidth,
    this.onPressed,
    required this.title,
  });

  final double height;
  final double minWidth;
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: minWidth,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
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
