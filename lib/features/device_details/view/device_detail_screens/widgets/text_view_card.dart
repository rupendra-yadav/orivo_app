import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: TColors.primaryDark1,
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 50.0.h, horizontal: 5.w),
          child: TextView(text: cardText),
        ),
      ),
    );
  }
}
