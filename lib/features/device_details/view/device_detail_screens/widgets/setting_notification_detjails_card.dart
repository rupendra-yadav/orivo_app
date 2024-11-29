import 'package:auro/features/device_details/view/device_detail_screens/widgets/update_number_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/buttons/switch_toggle.dart';
import '../../../../../common/widgets/inputFields/input_text.dart';
import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/validate/validate.dart';
import '../../../../navigation/view/bottom_nav_screen/controller/profile_detail_cotroller.dart';

class SettingNotificationDetailsCard extends StatelessWidget {
  const SettingNotificationDetailsCard({
    super.key,
    required this.title,
    required this.type,
    required this.active,

  });

  final String title;
  final int type;
  final int active;
  @override
  Widget build(BuildContext context) {

    final userController = Get.put(ProfileDetailController());

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
                    InkWell(
                      onTap: (){
                        if(type == 0){
                        }else{
                          showNumberEditDialog(context,userController,type);
                        }

                      },
                      child: TextView(
                        text: title,
                        textColor: TColors.primaryLight1,
                      ),
                    ),
                  ],
                ),
              ),
               Expanded(flex: 1, child: SwitchToggle(type: type,activeStatus: active,))
            ],
          ),
        ),
      ),
    );
  }
}


