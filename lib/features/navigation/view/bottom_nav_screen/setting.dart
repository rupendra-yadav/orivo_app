import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/setting_options.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            SettingOptions(title: TTexts.deviceSettings,),
            SettingOptions(title: TTexts.notifications,),
            SettingOptions(title: TTexts.deviceDetails,),
          ],
        ),
      ),
    );
  }
}


