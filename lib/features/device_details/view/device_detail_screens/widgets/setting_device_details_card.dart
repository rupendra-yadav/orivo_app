import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';


class SettingDeviceDetailCard extends StatelessWidget {
  const SettingDeviceDetailCard({
    super.key,
    required this.title,
    required this.text,
  });


  final String title,text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(color: TColors.primaryDark1,borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 18.h),
          child:  Row(
            children: [
              Expanded(flex:  1,child: TextView(text: title,textColor: TColors.primaryLight1,)),

              const Expanded(flex: 1, child: Center(child: TextView(text: TTexts.a_,textColor: TColors.primaryLight1,))),

              Expanded(flex: 1, child: TextView(text: text)),


            ],
          ),
        ),
      ),
    );
  }
}