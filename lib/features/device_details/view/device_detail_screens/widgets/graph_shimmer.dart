import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/styles/spacing_style.dart';
class GraphShimmer extends StatelessWidget {
  const GraphShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SpacingStyle.paddingWithDefaultSpace,
      child: TShimmerEffect(width: 300.w, height: 250.h),
    );
  }
}