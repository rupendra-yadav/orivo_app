import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class SubscriptionOptionCard extends StatelessWidget {
  const SubscriptionOptionCard({
    super.key,
    required this.isSelected, // Make isSelected a required parameter
    required this.onTap,
    required this.title,
    required this.subTitle, // Make onTap a required parameter
  });
  final bool isSelected;
  final VoidCallback onTap;
  final String title,subTitle;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Call the onTap callback when tapped
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: TColors.primaryDark1,
          border: Border.all(
            color: isSelected ? TColors.secondary : TColors.white, // Change border color based on selection
            width: 2.0, // Set the width of the border
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: title,
                    textColor: isSelected ? TColors.secondary : TColors.white, // Change text color based on selection
                    fontSize: 20,
                  ),
                  TextView(
                    text: subTitle,
                    textColor: isSelected ? TColors.secondary : TColors.white, // Change text color based on selection
                    fontSize: 15,
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Iconsax.tick_circle,
                color: isSelected ? TColors.secondary : TColors.white,
                size: 25.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
