import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';

class TextView extends StatelessWidget {
  const TextView({
    super.key,
    required this.text,
    this.textColor = TColors.white,
    this.fontSize = 16,
    this.bold = false,
    this.i = 2,
  });

  final String text;
  final Color textColor;
  final double fontSize;
  final bool bold;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: i,
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
