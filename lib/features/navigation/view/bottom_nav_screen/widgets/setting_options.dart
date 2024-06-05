import 'package:flutter/material.dart';

import '../../../../../utils/constant/colors.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: TColors.primaryDark2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(color: TColors.white),
              ),
              const Spacer(),
              IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.arrow_drop_down_sharp,color: TColors.white,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}