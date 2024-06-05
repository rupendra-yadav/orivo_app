import 'package:auro/features/device_details/view/device_detail_screens/widgets/text_view_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/text/text_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TColors.primary,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: SpacingStyle.paddingWithDefaultSpace,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Daily Summary
                    const TextView(
                      text: TTexts.dailySummary,
                    ),

                    ///card
                    const TextViewCard(
                      cardText: TTexts.max_kwh_today,
                      width: double.infinity,
                    ),

                    ///Alerts
                    const TextView(
                      text: TTexts.alerts,
                    ),
                    Row(
                      children: [
                        TextViewCard(
                            cardText: TTexts.max_kwh_today,
                            width: TDeviceUtils.getScreenWidth() / 2.w),
                        const Spacer(),
                        TextViewCard(
                            cardText: TTexts.max_kwh_today,
                            width: TDeviceUtils.getScreenWidth() / 2.w),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// Draggable Scroll View
            DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.4,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: TColors.primaryDark2,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40), bottom: Radius.zero)),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: const Column(
                        children: [
                          TextView(text: "shantanu"),
                          TextView(text: "shantanu"),
                          TextView(text: "shantanu"),
                          TextView(text: "shantanu"),
                          TextView(text: "shantanu"),
                          TextView(text: "shantanu"),
                          TextView(text: "shantanu"),
                          TextView(text: "shantanu"),
                          TextView(text: "shantanu"),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
