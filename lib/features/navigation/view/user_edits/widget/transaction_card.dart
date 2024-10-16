import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.title,
    required this.date,
    required this.price,
  });

  final String title,date,price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:TColors.primaryDark1,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10),
              child:  TextView(text: title,bold: true,fontSize: 20,),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child:  TextView(text: date,textColor: TColors.secondary,),
            ),

            Row(
              children: [
                TextButton(onPressed: (){}, child: const TextView(text: "Download Invoice",bold: true,fontSize: 20,textColor: TColors.secondary,),),
                const Spacer(),
                Padding(
                  padding:  EdgeInsets.only(right: 10.w),
                  child:  TextView(text: price,fontSize: 20,bold: true,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}