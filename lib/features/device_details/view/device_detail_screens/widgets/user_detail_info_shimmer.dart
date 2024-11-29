import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
class UserDetailsInfoShimmer extends StatelessWidget {
  const UserDetailsInfoShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Container(
            decoration: BoxDecoration(color: TColors.lightGrey,borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 18.h),
              child:  Row(
                children: [
                  Expanded(flex:  1,child: TShimmerEffect(width: 50.w, height: 10.h)),

                  const Expanded(flex: 1, child: Center(child: TextView(text: TTexts.a_,textColor: TColors.primaryLight1,))),

                  Expanded(flex: 1, child: TShimmerEffect(width: 50.w, height: 10.h)),


                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Container(
            decoration: BoxDecoration(color: TColors.lightGrey,borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 18.h),
              child:  Row(
                children: [
                  Expanded(flex:  1,child: TShimmerEffect(width: 50.w, height: 10.h)),

                  const Expanded(flex: 1, child: Center(child: TextView(text: TTexts.a_,textColor: TColors.primaryLight1,))),

                  Expanded(flex: 1, child: TShimmerEffect(width: 50.w, height: 10.h)),


                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Container(
            decoration: BoxDecoration(color: TColors.lightGrey,borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 18.h),
              child:  Row(
                children: [
                  Expanded(flex:  1,child: TShimmerEffect(width: 50.w, height: 10.h)),

                  const Expanded(flex: 1, child: Center(child: TextView(text: TTexts.a_,textColor: TColors.primaryLight1,))),

                  Expanded(flex: 1, child: TShimmerEffect(width: 50.w, height: 10.h)),


                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Container(
            decoration: BoxDecoration(color: TColors.lightGrey,borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 18.h),
              child:  Row(
                children: [
                  Expanded(flex:  1,child: TShimmerEffect(width: 50.w, height: 10.h)),

                  const Expanded(flex: 1, child: Center(child: TextView(text: TTexts.a_,textColor: TColors.primaryLight1,))),

                  Expanded(flex: 1, child: TShimmerEffect(width: 50.w, height: 10.h)),


                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}