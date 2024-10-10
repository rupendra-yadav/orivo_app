import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/appbar/plane_app_bar.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const PlainAppBar(title: TTexts.transactionsTitle),
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(

          child: Container(
            decoration: BoxDecoration(
              color:TColors.primaryDark1,
                  borderRadius: BorderRadius.circular(10.r)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextView(text: "Gold Subscription",bold: true,fontSize: 20,),
                const TextView(text: "Date : 16-09-2024",textColor: TColors.secondary,),

                Row(
                  children: [
                    TextButton(onPressed: (){}, child: const TextView(text: "Download Invoice",bold: true,fontSize: 20,textColor: TColors.secondary,),),
                    const Spacer(),
                    const TextView(text: "Rs 15000",fontSize: 20,),
                  ],
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}
