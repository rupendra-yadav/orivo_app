import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class TextViewCard extends StatelessWidget {
  const TextViewCard({
    super.key,
    required this.cardText,
    required this.width,
    required this.cardValue,
    required this.cardAvg,
    required this.cardUnit,
  });

  final String cardText, cardValue, cardAvg, cardUnit;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: TColors.primaryDark1,
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(text: cardText),
              SizedBox(
                height: 5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextView(
                    text: cardValue,
                    fontSize: 30,
                    bold: true,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  TextView(
                    text: cardUnit,
                    fontSize: 18,
                    bold: true,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              // TextView(text: cardAvg),
            ],
          ),
        ),
      ),
    );
  }
}
