import 'package:auro/common/widgets/buttons/button.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/data_item_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/buttons/text_button.dart';
import '../../../../common/widgets/inputFields/input_text.dart';
import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/text_strings.dart';
import '../../../../utils/styles/spacing_style.dart';
import '../../../../utils/validate/validate.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Container(
          color: TColors.primaryDark1,
          child: Column(
            children: [
              /// Graph
              const Graph(),

              /// Graph Filter
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButtonWithContainer(
                        text: TTexts.day1, onPressed: () {}),
                    TextButtonWithContainer(
                        text: TTexts.week1, onPressed: () {}),
                    TextButtonWithContainer(
                        text: TTexts.month1, onPressed: () {}),
                    TextButtonWithContainer(
                        text: TTexts.year1, onPressed: () {}),
                    TextButtonWithContainer(
                        text: TTexts.years5, onPressed: () {}),
                    TextButtonWithContainer(text: TTexts.all, onPressed: () {}),
                  ],
                ),
              ),

              /// Tabs and TabBarView
              DefaultTabController(
                length: 2,
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
                        Tab(text: TTexts.selectDataItem),
                        Tab(text: TTexts.parameters),
                      ],
                    ),
                    Container(
                      color: TColors.primary,
                      height: 400.h, // Adjust height as necessary
                      child: TabBarView(
                        children: [
                          ///select data items Page
                          Padding(
                            padding: SpacingStyle.paddingWithDefaultSpace,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 10.w,
                                crossAxisSpacing: 10.h,
                                childAspectRatio: 1,
                              ),
                              itemCount: 24,
                              itemBuilder: (context, index) {
                                // return const DataItemCard(
                                //   colorContainer: TColors.primaryDark1,
                                // );
                              },
                            ),
                          ),

                          ///Parameters
                          Padding(
                            padding: SpacingStyle.paddingWithDefaultSpace,
                            child: Column(
                              children: [
                                PrefixInputText(
                                  // controller: registerController.password,
                                  validator: (value) =>
                                      Validate.validatePassword(value),
                                  hint: TTexts.selectDate,
                                  preFixIcon: const Icon(Iconsax.calendar_2),
                                  obscureText: true,
                                  keyboardType: TextInputType.datetime,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                Button(
                                    height: 45.h,
                                    minWidth: 100.w,
                                    onPressed: () {},
                                    title: TTexts.apply)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
