import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/styles/spacing_style.dart';
class DeviceItemShimmer extends StatelessWidget {
  const DeviceItemShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SpacingStyle.paddingWithDefaultSpace,
      child: SizedBox(
        height: 400.h,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h,
              childAspectRatio: 1),
          itemCount: 24,
          itemBuilder: (_, index) {
            return TShimmerEffect( height: 20.h,width: 20.w,);
            // return DataItemCard(
            //   dataItems: controller.dataIts[index],
            // );
          },
        ),
      ),
    );
  }
}