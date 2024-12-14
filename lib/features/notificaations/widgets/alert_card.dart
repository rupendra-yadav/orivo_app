import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/text/text_view.dart';
import '../../../utils/helpers/date_helper.dart';
import '../Model/device_alert_notification_model.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({
    super.key,
    required this.deviceAlertNotificationModel,
  });

  final DeviceAlertNotificationModel deviceAlertNotificationModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Date
        TextView(text: DateHelper().formatDateToday(deviceAlertNotificationModel.mNotifDate.toString())),
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
              TextView(text: deviceAlertNotificationModel.mNotifTitle.toString(),bold: true,fontSize: 18,),
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
             TextView(text: deviceAlertNotificationModel.mNotifMessage.toString(),bold: true,fontSize: 18,),
              SizedBox(height: 8.0),
              TextView(text: deviceAlertNotificationModel.mNotifSubText.toString(),fontSize: 14,textColor: TColors.secondary,),
              Align(
                alignment: Alignment.bottomRight,
                child:TextView(text: DateHelper().getTime(deviceAlertNotificationModel.mNotifAddedon.toString()),bold: true,fontSize: 14,textColor: TColors.primaryLight1,),

              ),
            ],
          ),
        ),
      ],
    );
  }
}