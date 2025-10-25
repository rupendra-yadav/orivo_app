import 'package:auro/features/device_details/controller/device_detail_navigation_controller.dart';
import 'package:auro/features/device_details/view/device_detail_screens/controller/edit_device_detail_controller.dart';
import 'package:auro/features/navigation/view/user_edits/controller/edit_profile_controller.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/plane_app_bar.dart';
import '../../../../../common/widgets/buttons/button.dart';
import '../../../../../common/widgets/inputFields/input_text.dart';
import '../../../../../utils/validate/validate.dart';

class EditDeviceDetails extends StatefulWidget {
  const EditDeviceDetails({
    super.key,
  });

  @override
  State<EditDeviceDetails> createState() => _EditDeviceDetailsState();
}

class _EditDeviceDetailsState extends State<EditDeviceDetails> {
  final editDeviceDetailController = Get.put(EditDeviceDetailController());
  final DeviceDetailNavigationController navigationController =
      DeviceDetailNavigationController.instance;

  initState() {
    super.initState();
    // You can perform any additional setup here if needed
    editDeviceDetailController.userDeviceId.text =
        navigationController.deviceId.value;
    editDeviceDetailController.name.text =
        navigationController.deviceName.value;
    editDeviceDetailController.description.text =
        navigationController.deviceDesc.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const PlainAppBar(
        title: TTexts.editDeviceDetails,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    20.h, // keyboard padding
              ),
              child: Form(
                key: editDeviceDetailController.updateDeviceDetails,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20.h),

                    /// Input Fields (same as before)
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editDeviceDetailController.userDeviceId,
                      validator: Validate.validateEmptyText,
                      hint: "Device Id",
                      preFixIcon: Icon(Iconsax.activity),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editDeviceDetailController.name,
                      validator: Validate.validateEmptyText,
                      hint: "Device Name",
                      preFixIcon: const Icon(Iconsax.activity1),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editDeviceDetailController.description,
                      validator: Validate.validateEmptyText,
                      hint: "Device Description",
                      preFixIcon: const Icon(Icons.description),
                    ),
                    // PrefixInputText(
                    //   keyboardType: TextInputType.text,
                    //   controller: editProfileController.address,
                    //   validator: Validate.validateEmptyText,
                    //   hint: TTexts.address,
                    //   preFixIcon: const Icon(PhosphorIconsBold.addressBook),
                    // ),
                    // PrefixInputText(
                    //   keyboardType: TextInputType.text,
                    //   controller: editProfileController.companyName,
                    //   enable: true,
                    //   validator: Validate.validateEmptyText,
                    //   hint: TTexts.etHintCompanyName,
                    //   preFixIcon: const Icon(Iconsax.building),
                    // ),
                    // PrefixInputText(
                    //   keyboardType: TextInputType.text,
                    //   controller: editProfileController.companyType,
                    //   enable: true,
                    //   validator: Validate.validateEmptyText,
                    //   hint: TTexts.companyType,
                    //   preFixIcon: const Icon(Icons.type_specimen),
                    // ),
                    // PrefixInputText(
                    //   keyboardType: TextInputType.text,
                    //   controller: editProfileController.gstNumber,
                    //   enable: true,
                    //   validator: Validate.validateEmptyText,
                    //   hint: TTexts.gstNo,
                    //   preFixIcon: const Icon(PhosphorIconsRegular.money),
                    // ),
                    // PrefixInputText(
                    //   keyboardType: TextInputType.text,
                    //   controller: editProfileController.ownersName,
                    //   validator: Validate.validateEmptyText,
                    //   hint: TTexts.ownersName,
                    //   preFixIcon: const Icon(Icons.beenhere),
                    // ),

                    SizedBox(height: 30.h),

                    /// Save button
                    Center(
                      child: Button(
                        height: 54.h,
                        minWidth: 185.w,
                        title: TTexts.saveDetails,
                        onPressed: () {
                          if (editDeviceDetailController
                              .updateDeviceDetails.currentState!
                              .validate()) {
                            editDeviceDetailController.editDeviceDetails();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
