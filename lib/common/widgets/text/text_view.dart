import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';

class TextView extends StatelessWidget {
  const TextView({
    super.key,
    required this.text,
    this.textColor = TColors.white,
    this.fontSize = 16,
    this.bold = false,
  });

  final String text;
  final Color textColor;
  final double fontSize;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: fontSize ,fontWeight: bold ? FontWeight.bold : FontWeight.normal,),
    );
  }
}