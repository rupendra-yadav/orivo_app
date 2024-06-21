import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/buttons/switch_toggle.dart';
import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class SettingNotificationDetailsCard extends StatelessWidget {
  const SettingNotificationDetailsCard({
    super.key,
    required this.title,
    this.showIcon = true,
  });

  final String title;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
            color: TColors.primaryDark1,
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    const Icon(
                      PhosphorIcons.whatsapp_logo,
                      color: TColors.primaryLight1,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    TextView(
                      text: title,
                      textColor: TColors.primaryLight1,
                    ),
                  ],
                ),
              ),
              const Expanded(flex: 1, child: SwitchToggle())
            ],
          ),
        ),
      ),
    );
  }
}