import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constant/colors.dart';

class TextButtonWithContainer extends StatelessWidget {
  const TextButtonWithContainer({
    super.key,
    required this.text,
    required this.onPressed,
    this.containerColor = TColors.primary,
    this.textColor = TColors.white,
  });

  final String text;
  final void Function() onPressed;
  final Color containerColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: TColors.primary,
              borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            child: Text(
              text,
              style: const TextStyle(color: TColors.white),
            ),
          ),
        ));
  }
}