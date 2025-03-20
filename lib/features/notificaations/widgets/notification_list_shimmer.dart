import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/shimmer/shimmer.dart';
import '../../../utils/constant/colors.dart';

class NotificationListShimmer extends StatelessWidget {
  const NotificationListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.height,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context,index){
            return  Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h,),
                  TShimmerEffect(width: 90.w, height: 10.h,color: TColors.darkerGrey,),

                  SizedBox(height: 5.h,),
                  Container(

                    padding: EdgeInsets.all(12.0.h),
                    decoration: BoxDecoration(
                      color: TColors.lightGrey, // Dark background color
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TShimmerEffect(width: 120.w, height: 12.h,color: TColors.darkerGrey,),
                        SizedBox(height: 10.h,),
                        TShimmerEffect(width: 90.w, height: 9.h,color: TColors.darkerGrey,),
                        SizedBox(height: 8.h),
                        TShimmerEffect(width: 80.w, height: 9.h,color: TColors.darkerGrey,),
                        SizedBox(height: 5.h),
                        Align(
                          alignment: Alignment.bottomRight,
                          child:
                          TShimmerEffect(width: 50.w, height: 8.h,color: TColors.darkerGrey,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
