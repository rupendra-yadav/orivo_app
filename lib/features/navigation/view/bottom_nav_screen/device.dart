import 'package:auro/features/device_details/view/device_detail_navigation_screen.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/widgets/device_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Device extends StatelessWidget {
  const Device({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithDefaultSpace,
          child:  Column(
            children: [
              /// device cards
              DeviceCard(
                title: 'AC Motor',
                mId: '12378965dee',
                power: '1000w',
                image: const AssetImage(TImages.imgDevice),
                onPressed: () => Get.to(() => const DeviceDetailsNavigationScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

