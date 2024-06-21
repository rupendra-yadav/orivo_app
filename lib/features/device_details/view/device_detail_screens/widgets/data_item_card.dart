import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class DataItemCard extends StatelessWidget {
  const DataItemCard({
    super.key,
    required this.title,
    required this.value,
    this.colorContainer = TColors.primary,
  });

  final String title;
  final String value;
  final Color colorContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 10.0.h, horizontal: 20.w),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              text: "Uba (v)",
              textColor: TColors.primaryLight1,
            ),
            TextView(
              text: "0",
              textColor: TColors.primaryLight1,
            ),
          ],
        ),
      ),
    );
  }
}