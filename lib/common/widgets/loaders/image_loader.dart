import 'package:flutter/material.dart';

import '../../../utils/constant/colors.dart';
import '../../../utils/constant/sizes.dart';

class TImageLoaderWidget extends StatelessWidget {
  const TImageLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), //Display Lotte Animation
           SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
            style: const TextStyle(color: TColors.white),
            textAlign: TextAlign.center,
          ),
           SizedBox(height: TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: onActionPressed,
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
