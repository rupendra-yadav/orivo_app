import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/text/text_view.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Date
          TextView(text: "Today"),
          SizedBox(height: 5.h,),

          /// Head Title
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.0.h),
            decoration: BoxDecoration(
              color: TColors.alertRed, // Dark background color
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Image(image: AssetImage(TImages.imgAlertTriangle),height: 20.h,width: 20.w,),
                SizedBox(width: 5.w,),
                TextView(text: "P.F Alert",bold: true,fontSize: 18,),
                Spacer(),
                Icon(Icons.info_outline,color: TColors.white,)
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          /// Message
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.0.h),
            decoration: BoxDecoration(
              color: TColors.primaryDark1, // Dark background color
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               TextView(text: "Your P.F Is Low !!!",bold: true,fontSize: 18,),
                SizedBox(height: 8.0),
                TextView(text: "P.F - 0.75",fontSize: 14,textColor: TColors.secondary,),
                Align(
                  alignment: Alignment.bottomRight,
                  child:TextView(text: "18:00",bold: true,fontSize: 14,textColor: TColors.primaryLight1,),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}