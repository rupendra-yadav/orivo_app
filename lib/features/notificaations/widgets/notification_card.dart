import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/helpers/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/text/text_view.dart';
import '../Model/notification_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.deviceListModel,
  });


  final NotificationModel deviceListModel;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(text:  DateHelper().formatDateToday(deviceListModel.mNotifDate.toString())),
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
               TextView(text: deviceListModel.mNotifTitle.toString(),bold: true,fontSize: 18,),
                SizedBox(height: 8.h),
                TextView(text: deviceListModel.mNotifMessage.toString(),fontSize: 14,textColor: TColors.primaryLight1,),
                Align(
                  alignment: Alignment.bottomRight,
                  child:TextView(text: DateHelper().getTime(deviceListModel.mNotifAddedon.toString()),bold: true,fontSize: 14,textColor: TColors.secondary,),

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}