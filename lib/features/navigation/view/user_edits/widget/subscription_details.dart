import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class SubscriptionDetails extends StatelessWidget {
  const SubscriptionDetails({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Iconsax.tick_circle,color: TColors.secondary,),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: TextView(text: text),
        ),
      ],
    );
  }
}