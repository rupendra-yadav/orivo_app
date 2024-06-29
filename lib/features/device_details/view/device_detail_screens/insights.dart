import 'package:auro/features/device_details/view/device_detail_screens/widgets/insights_cards.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constant/colors.dart';

class Insights extends StatelessWidget {
  const Insights({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image(
                  width: TDeviceUtils.screenWidth,
                  height: 140.h,
                  fit: BoxFit.cover,
                  image: const AssetImage(TImages.imgProfileBg))),

          /// Content above the Image
          SafeArea(
            child: Column(
              children: [
                Container(
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor: TColors.secondary,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: TColors.secondary,
                          unselectedLabelColor: TColors.primaryLight1,
                          dividerColor: TColors.primaryLight1,
                          dividerHeight: 2.h,
                          tabs: const [
                            Tab(text: TTexts.alarms),
                            Tab(text: TTexts.consumption),
                            Tab(text: TTexts.other),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          height: TDeviceUtils.screenHeight - 335.h,
                          child: TabBarView(
                            children: [
                              ///Alarms

                              Padding(
                                padding: SpacingStyle.paddingWithDefaultSpace,
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10.w,
                                          crossAxisSpacing: 10.h,
                                          childAspectRatio: 3),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return const InsightsCards(
                                      text: TTexts.pf,
                                    );
                                  },
                                ),
                              ),

                              ///Consumption

                              Padding(
                                padding: SpacingStyle.paddingWithDefaultSpace,
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10.w,
                                          crossAxisSpacing: 10.h,
                                          childAspectRatio: 3),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return const InsightsCards(
                                      text: TTexts.pf,
                                    );
                                  },
                                ),
                              ),

                              /// Other

                              Padding(
                                padding: SpacingStyle.paddingWithDefaultSpace,
                                child: GridView.builder(
                                  scrollDirection: Axis.vertical,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10.w,
                                          crossAxisSpacing: 10.h,
                                          childAspectRatio: 3),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return const InsightsCards(
                                      text: TTexts.pf,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
