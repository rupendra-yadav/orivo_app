import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/constant/image_string.dart';


class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: const AssetImage(TImages.imgProfileBg),
          width: MediaQuery.of(context).size.width,
          height: 140.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 10.h, // Adjust the position as needed
          left: 20.w, // Adjust the position as needed
          right: 20.w, // Adjust the position as needed
          child: Row(
            children: [
              TShimmerEffect(width: 90.w, height: 90.h,radius: 100.r,),
              SizedBox(width: 10.w),
              // Added space between avatar and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TShimmerEffect(width: 120.w, height: 25.h),
                  SizedBox(height: 10.h),
                  TShimmerEffect(width: 60.w, height: 15.h),
                ],
              ),
              const Spacer(),
              // Pushes the IconButton to the right
              TShimmerEffect(width: 20.w, height:20,radius: 5,),
            ],
          ),
        ),
      ],
    );
  }
}