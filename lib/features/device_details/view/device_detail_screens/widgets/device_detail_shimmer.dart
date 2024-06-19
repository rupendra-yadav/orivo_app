import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/device/device_utility.dart';

class DeviceDetailShimmer extends StatelessWidget {
  const DeviceDetailShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        /// Daily Summary
        TShimmerEffect(width: 120.w, height: 10.h),
        SizedBox(height: 20.h),

        ///card
        TShimmerEffect(width: double.infinity, height: 130.h),
        SizedBox(height: 20.h),
        ///Alerts
        TShimmerEffect(width: 120.w, height: 10.h),
        SizedBox(height: 20.h),
        ///cards
        Row(
          children: [
            Expanded(
              child: TShimmerEffect(
                  width: TDeviceUtils.screenWidth / 2.w,
                  height: 130.h),
            ),
            SizedBox(width: 5.w),
            Expanded(
                child: TShimmerEffect(
                    width: TDeviceUtils.screenWidth / 2.w,
                    height: 130.h)),
          ],
        ),
      ],
    );
  }
}