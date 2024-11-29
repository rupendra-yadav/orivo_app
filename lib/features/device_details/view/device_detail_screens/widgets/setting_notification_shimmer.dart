import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/constant/colors.dart';

class SettingNotificationShimmer extends StatelessWidget {
  const SettingNotificationShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
            color: TColors.primaryDark1,
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    TShimmerEffect(width: 30.w, height: 30.w,radius: 50.r,),
                    SizedBox(
                      width: 2.w,
                    ),
                    TShimmerEffect(width: 90.w, height: 20.w,),
                  ],
                ),
              ),
              Expanded(flex: 1, child: TShimmerEffect(width:30.w, height: 20.w,),)
            ],
          ),
        ),
      ),
    );
  }
}