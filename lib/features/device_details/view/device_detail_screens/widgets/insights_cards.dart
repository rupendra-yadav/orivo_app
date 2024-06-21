import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class InsightsCards extends StatelessWidget {
  const InsightsCards({
    super.key,
    required this.text,
    this.textColor = TColors.primaryLight1,
    this.cardColor = TColors.primaryDark1,
  });

  final String text;
  final Color textColor,cardColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.r)),
      height: 50.h,
      width: 150.w,
      child: Center(
        child: TextView(
            text: text, textColor:textColor),
      ),
    );
  }
}