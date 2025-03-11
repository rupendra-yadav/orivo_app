import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/text/text_view.dart';
import '../../../utils/constant/text_strings.dart';
import '../../../utils/helpers/date_helper.dart';
import '../Model/device_alert_notification_model.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({
    super.key,
    required this.deviceAlertNotificationModel,
  });

  final DeviceAlertNotificationModel deviceAlertNotificationModel;

  infoDialog1(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: TColors.primaryDark1,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: TextView(
                  text: TTexts.loadAlert,
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                )),

                SizedBox(
                  height: 15.h,
                ),

                TextView(
                  text: TTexts.excessDemandAlert,
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 25.h,
                ),

                /// Close OK
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: TextView(
                      text: TTexts.dialogOk,
                      textColor: TColors.white,
                      fontSize: 18,
                      bold: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  infoDialog2(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: TColors.primaryDark1,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Crucial for Dialogs
                children: [
                  Center(
                      child: TextView(
                          text: TTexts.loadAlertPower,
                          textColor: TColors.white,
                          fontSize: 18,
                          bold: true)),
                  SizedBox(height: 15.h),
                  TextView(
                      text: TTexts.whatIsPower,
                      textColor: TColors.white,
                      fontSize: 18,
                      bold: true),
                  SizedBox(height: 15.h), // Add some space before the button
                  SizedBox(
                    height: 25.h,
                  ),
                  // Close OK
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: TextView(
                          text: TTexts.dialogOk,
                          textColor: TColors.white,
                          fontSize: 18,
                          bold: true),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  infoDialog3(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: TColors.primaryDark1,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: TextView(
                  text: TTexts.loadAlertPowerOff,
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                )),

                SizedBox(
                  height: 15.h,
                ),

                TextView(
                  text: TTexts.powerOffAlert,
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),

                SizedBox(
                  height: 25.h,
                ),

                /// Close OK
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: TextView(
                      text: TTexts.dialogOk,
                      textColor: TColors.white,
                      fontSize: 18,
                      bold: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Date
        TextView(
            text: DateHelper().formatDateToday(
                deviceAlertNotificationModel.mNotifDate.toString())),
        SizedBox(
          height: 5.h,
        ),

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
              Image(
                image: AssetImage(TImages.imgAlertTriangle),
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              TextView(
                text: deviceAlertNotificationModel.mNotifTitle.toString(),
                bold: true,
                fontSize: 18,
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    infoDialog1(context);
                  },
                  child: Icon(
                    Icons.info_outline,
                    color: TColors.white,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),

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
              TextView(
                text: deviceAlertNotificationModel.mNotifMessage.toString(),
                bold: true,
                fontSize: 18,
              ),
              SizedBox(height: 8.0),
              TextView(
                text: deviceAlertNotificationModel.mNotifSubText.toString(),
                fontSize: 14,
                textColor: TColors.secondary,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextView(
                  text: DateHelper().getTime(
                      deviceAlertNotificationModel.mNotifAddedon.toString()),
                  bold: true,
                  fontSize: 14,
                  textColor: TColors.primaryLight1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
