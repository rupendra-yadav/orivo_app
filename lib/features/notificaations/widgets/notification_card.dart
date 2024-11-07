import 'package:auro/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/text/text_view.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(text: "Today"),
          SizedBox(height: 5.h,),
          Container(
            padding: EdgeInsets.all(12.0.h),
            decoration: BoxDecoration(
              color: TColors.primaryDark1, // Dark background color
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               TextView(text: "Hurry Grab Before Sale is Over !!",bold: true,fontSize: 18,),
                SizedBox(height: 8.h),
                TextView(text: "End of year sale is here grab coupons for your iot devices",fontSize: 14,textColor: TColors.primaryLight1,),
                Align(
                  alignment: Alignment.bottomRight,
                  child:TextView(text: "18:00",bold: true,fontSize: 14,textColor: TColors.secondary,),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}