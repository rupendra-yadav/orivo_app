import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class TextViewCard extends StatelessWidget {
  const TextViewCard({
    super.key,
    required this.cardText,
    required this.width,
  });

  final String cardText;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: TColors.primaryDark1,
            borderRadius: BorderRadius.circular(10)),
        child:  Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
          child: TextView(text: cardText),
        ),
      ),
    );
  }
}