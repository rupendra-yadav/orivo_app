import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';

class TextView extends StatelessWidget {
  const TextView({
    super.key,
    required this.text,
    this.textColor = TColors.white,
    this.fontSize = 20,
  });

  final String text;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: fontSize),
    );
  }
}