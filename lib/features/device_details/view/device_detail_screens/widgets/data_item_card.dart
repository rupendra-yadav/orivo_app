import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../model/dart_items.dart';

class DataItemCard extends StatelessWidget {
  const DataItemCard({
    super.key,
   /* required this.title,
    required this.value,*/
    this.colorContainer = TColors.primary,
    required this.dataItems,
    this.onTap,
  });

  /*final String title;
  final String value;*/
  final Color colorContainer;
  final DataItems dataItems;
  final void Function() ?onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: colorContainer,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10.0.h, horizontal: 20.w),
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView(
                text: dataItems.field,
                textColor:TColors.primaryLight1,
              ),
              TextView(
                text: "0",
                textColor: TColors.primaryLight1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}