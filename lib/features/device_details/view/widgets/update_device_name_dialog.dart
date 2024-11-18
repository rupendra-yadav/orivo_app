import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/inputFields/input_text.dart';
import '../../../../common/widgets/text/text_view.dart';
import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/text_strings.dart';
import '../../../../utils/validate/validate.dart';
import '../device_detail_screens/controller/device_detail_controller.dart';


dialogUpdateDeviceName(BuildContext context,DeviceDetailController controller,String dId) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // Prevents closing the dialog by tapping outside
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r), // Rounded corners
        ),
        backgroundColor: TColors.primaryLight1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              const TextView(
                text: TTexts.changeDeviceName,
                textColor: TColors.primary,
                fontSize: 25,
                bold: true,
              ),
              const SizedBox(height: 16.0),
              // Content
              PrefixInputText(
                controller: controller.deviceName,
                validator: (value) => Validate.validateEmptyText(value),
                hint: TTexts.deviceName,
                obscureText: false,
                preFixIcon: Icon(Iconsax.edit),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 24.0),
              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: const TextView(
                      text: TTexts.dialogCancel,
                      textColor: TColors.primaryDark2,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Handle OK action
                    },
                  ),
                  const SizedBox(width: 8.0),
                  TextButton(
                    child: const TextView(
                      text: TTexts.save,
                      textColor: TColors.accentDark1,
                    ),
                    onPressed: () {
                      controller.updateDeviceName(dId);
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
