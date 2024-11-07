import 'package:auro/common/widgets/buttons/button.dart';
import 'package:auro/common/widgets/text/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/appbar/plane_app_bar.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../widget/subscription_card_button.dart';
import '../widget/subscription_cards.dart';
import '../widget/subscription_details.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int selectedButtonIndex = -1; // To keep track of the selected toggle button
  int selectedOptionIndex = -1; // To keep track of the selected option card

  void onSelectButton(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }

  void onSelectOption(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const PlainAppBar(title: TTexts.subscriptionTitle),
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Title
              Center(
                child: TextView(
                  text: TTexts.gold,
                  fontSize: 40,
                  bold: true,
                  textColor: TColors.secondary,
                ),
              ),
              SizedBox(height: 40.h),

              /// Details
              Column(
                children: [
                  SubscriptionDetails(text: TTexts.disc1),
                  SizedBox(height: 10.h),
                  SubscriptionDetails(text: TTexts.disc2),
                  SizedBox(height: 10.h),
                  SubscriptionDetails(text: TTexts.disc3),
                  SizedBox(height: 10.h),
                  SubscriptionDetails(text: TTexts.disc4),
                ],
              ),
              SizedBox(height: 40.h),

              /// Toggle Buttons
              Row(
                children: [
                  SubscriptionCardButton(
                    isSelected: selectedButtonIndex == 0,
                    onTap: () => onSelectButton(0), title: TTexts.gold,
                  ),
                  SizedBox(width: 10.w),
                  SubscriptionCardButton(
                    isSelected: selectedButtonIndex == 1,
                    onTap: () => onSelectButton(1), title: TTexts.silver,
                  ),
                ],
              ),
              SizedBox(height: 40.h),

              /// Price Options
              Column(
                children: [
                  SubscriptionOptionCard(
                    isSelected: selectedOptionIndex == 0,
                    onTap: () => onSelectOption(0), title: TTexts.yearl, subTitle: TTexts.only17,
                  ),
                  SizedBox(height: 10.h),
                  SubscriptionOptionCard(
                    isSelected: selectedOptionIndex == 1,
                    onTap: () => onSelectOption(1), title: TTexts.halfYearly, subTitle: TTexts.only25,
                  ),
                  SizedBox(height: 10.h),
                  SubscriptionOptionCard(
                    isSelected: selectedOptionIndex == 2,
                    onTap: () => onSelectOption(2), title: TTexts.quaterly, subTitle: TTexts.only3,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),

              SizedBox(height: 20.h,),
              //Button(height: 40.h, minWidth: double.infinity, onPressed: (){}, title: TTexts.subscribeButton)

            ],
          ),
        ),
      ),
    );
  }
}




