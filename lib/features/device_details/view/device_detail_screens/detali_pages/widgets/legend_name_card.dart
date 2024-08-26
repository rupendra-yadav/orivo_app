import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';

class LegendNameCard extends StatefulWidget {
  const LegendNameCard({super.key});


  @override
  _LegendNameCardState createState() => _LegendNameCardState();
}

class _LegendNameCardState extends State<LegendNameCard> {
  bool _isDetailVisible = false; // To control visibility of the detail card



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Name
        Card(
          elevation: 10.h,
          color: TColors.primaryDark2,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: TColors.green,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                SizedBox(width: 5.w),
                const TextView(text: "Energy : ", fontSize: 20),
                const TextView(
                  text: "7,50,000 ",
                  fontSize: 20,
                  textColor: TColors.green,
                ),
                const TextView(text: "Rs : ", fontSize: 20),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // Toggle visibility of LegendDetailCard
                    setState(() {
                      _isDetailVisible = !_isDetailVisible;
                    });
                  },
                  icon: const Icon(Iconsax.arrow_right_3, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        /// Details - Only visible if _isDetailVisible is true
        if (_isDetailVisible)
          Card(
            color: TColors.primaryDark2,
            elevation: 5.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      const TextView(text: "On Peak Unit"),
                      SizedBox(width: 10.w),
                      const TextView(text: "Per Unit Cost"),
                    ],
                  ),
                  const Row(
                    children: [
                      TextView(text: "71086", textColor: TColors.green),
                      Spacer(),
                      TextView(text: "x", fontSize: 15),
                      Spacer(),
                      TextView(text: "7.32", textColor: TColors.green),
                      Spacer(),
                      TextView(
                          text: "2,27,549.52", textColor: TColors.green),
                    ],
                  ),
                  Row(
                    children: [
                      const TextView(text: "On Peak Unit"),
                      SizedBox(width: 10.w),
                      const TextView(text: "Per Unit Cost"),
                    ],
                  ),
                  const Row(
                    children: [
                      TextView(text: "71086", textColor: TColors.green),
                      Spacer(),
                      TextView(text: "x", fontSize: 15),
                      Spacer(),
                      TextView(text: "7.32", textColor: TColors.green),
                      Spacer(),
                      TextView(
                          text: "2,27,549.52", textColor: TColors.green),
                    ],
                  ),
                  Row(
                    children: [
                      const TextView(text: "On Peak Unit"),
                      SizedBox(width: 10.w),
                      const TextView(text: "Per Unit Cost"),
                    ],
                  ),
                  const Row(
                    children: [
                      TextView(text: "71086", textColor: TColors.green),
                      Spacer(),
                      TextView(text: "x", fontSize: 15),
                      Spacer(),
                      TextView(text: "7.32", textColor: TColors.green),
                      Spacer(),
                      TextView(
                          text: "2,27,549.52", textColor: TColors.green),
                    ],
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}