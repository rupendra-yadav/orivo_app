import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/shimmer/shimmer.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';

class DeviceListShimmer extends StatelessWidget {
  const DeviceListShimmer({
    super.key,  this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Material(
              color: TColors.darkerGrey,
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      flex:1,
                      child: TShimmerEffect(width: 100.h, height: 100.h),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Title
                            TShimmerEffect(width: 150.h, height: 20.h),

                            /// model code
                            Row(
                              children: [
                                TShimmerEffect(width: 20.h, height: 10.h),

                                TShimmerEffect(width: 40.h, height: 10.h),
                              ],
                            ),
                            SizedBox(height: 10.h),

                            ///status
                            Row(
                              children: [
                                TShimmerEffect(width: 30.h, height: 10.h,radius: 10.r,),
                                SizedBox(width: 10.w),
                                TShimmerEffect(width: 30.h, height: 10.h,radius: 10.r,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: TSizes.defaultSpace);
        });
  }
}