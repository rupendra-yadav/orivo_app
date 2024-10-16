import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class SubscriptionCardButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionCardButton({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: TColors.primary,
            border: Border.all(
              color: isSelected ? TColors.secondary : TColors.white, // Change color when selected
              width: 2.0,
            ),
          ),
          child: Center(
            child: TextView(
              text: "Gold",
              textColor: isSelected ? TColors.secondary : TColors.white, // Change text color when selected
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}

