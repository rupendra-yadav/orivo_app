import 'package:auro/features/device_details/view/device_detail_screens/widgets/graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constant/colors.dart';

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
              Graph(),
              Row(
                children: [
                  TextButtonWithContainer(text: '1 day', onPressed: () {  },),
                  TextButtonWithContainer(text: '1 day', onPressed: () {  },),
                  TextButtonWithContainer(text: '1 day', onPressed: () {  },),
                  TextButtonWithContainer(text: '1 day', onPressed: () {  },),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextButtonWithContainer extends StatelessWidget {
  const TextButtonWithContainer({
    super.key, required this.text, required this.onPressed,
  });

  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Container(
     decoration: BoxDecoration(color:TColors.primary,borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding:EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w) ,
        child: Text(text,style: TextStyle(color: TColors.white),),
      ),
    ));
  }
}
