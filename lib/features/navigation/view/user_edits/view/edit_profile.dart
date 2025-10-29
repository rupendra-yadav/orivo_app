import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/model/user_detail_model2.dart';
import 'package:auro/features/navigation/view/user_edits/controller/edit_profile_controller.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../common/widgets/appbar/plane_app_bar.dart';
import '../../../../../common/widgets/buttons/button.dart';
import '../../../../../common/widgets/inputFields/input_text.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/validate/validate.dart';
import '../../bottom_nav_screen/model/user_detail_model.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key, required this.userModel});

  final UserModel2 userModel;

  @override
  Widget build(BuildContext context) {
    final editProfileController = Get.put(EditProfileController());

    // editProfileController.name.text = userModel.mCustName.toString();
    // editProfileController.state.text = userModel.mCustState.toString();
    // editProfileController.city.text = userModel.mCustCity.toString();
    // editProfileController.address.text = userModel.mCustAddress.toString();
    // editProfileController.companyName.text = userModel.mCustCompany.toString();
    // editProfileController.companyType.text = userModel.mCustCompanyType.toString();
    // editProfileController.gstNumber.text = userModel.mCustGstno.toString();
    // editProfileController.ownersName.text = userModel.mCustOwnerName.toString();

    editProfileController.name.text = userModel.name.toString();
    editProfileController.state.text = userModel.state.toString();
    editProfileController.city.text = userModel.city.toString();
    editProfileController.address.text = userModel.address.toString();
    editProfileController.companyName.text = userModel.companyName.toString();
    editProfileController.companyType.text = userModel.companyType.toString();
    editProfileController.gstNumber.text = userModel.gstNo.toString();
    // editProfileController.ownersName.text = userModel.ownerName.toString();

    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const PlainAppBar(
        title: TTexts.editProfile,
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
                key: editProfileController.updateProfileFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// Profile image + change button (same as before)
                    Row(
                      children: [
                        Obx(() {
                          final controller = EditProfileController.instance;
                          return controller.imageData.value != null
                              ? ClipOval(
                                  child: Image.file(
                                    controller.imageData.value!,
                                    height: 80.h,
                                    width: 80.w,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: TImages.userImagePath,
                                    height: 80.h,
                                    width: 80.w,
                                    fit: BoxFit.cover,
                                    placeholder: (_, __) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (_, __, ___) => Image.asset(
                                        TImages.imgUser,
                                        height: 80.h,
                                        width: 80.w,
                                        fit: BoxFit.cover),
                                  ),
                                );
                        }),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: TColors.primaryLight1,
                              context: context,
                              builder: (_) => SizedBox(
                                height: 150.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(Iconsax.gallery,
                                              size: 50.h,
                                              color: TColors.primary),
                                          onPressed: () {
                                            editProfileController
                                                .galleryPermission(context);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const TextView(
                                          text: TTexts.openGallery,
                                          textColor: TColors.primary,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Icon(Iconsax.camera4,
                                              size: 50.h,
                                              color: TColors.primary),
                                          onPressed: () {
                                            editProfileController
                                                .cameraPermission(context);
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const TextView(
                                          text: TTexts.openCamera,
                                          textColor: TColors.primary,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            TTexts.changeImageText,
                            style: TextStyle(
                                color: TColors.secondary, fontSize: 15),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    /// Input Fields (same as before)
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editProfileController.name,
                      validator: Validate.validateEmptyText,
                      hint: TTexts.etHintFullName,
                      preFixIcon: const Icon(Iconsax.profile_add),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editProfileController.state,
                      validator: Validate.validateEmptyText,
                      hint: TTexts.state,
                      preFixIcon: const Icon(Iconsax.building),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editProfileController.city,
                      validator: Validate.validateEmptyText,
                      hint: TTexts.city,
                      preFixIcon: const Icon(PhosphorIconsBold.city),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editProfileController.address,
                      validator: Validate.validateEmptyText,
                      hint: TTexts.address,
                      preFixIcon: const Icon(PhosphorIconsBold.addressBook),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editProfileController.companyName,
                      enable: userModel.companyName.isEmpty,
                      validator: Validate.validateEmptyText,
                      hint: TTexts.etHintCompanyName,
                      preFixIcon: const Icon(Iconsax.building),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editProfileController.companyType,
                      enable: userModel.companyType.isEmpty,
                      validator: Validate.validateEmptyText,
                      hint: TTexts.companyType,
                      preFixIcon: const Icon(Icons.type_specimen),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editProfileController.gstNumber,
                      enable: userModel.gstNo.isEmpty,
                      validator: Validate.validateEmptyText,
                      hint: TTexts.gstNo,
                      preFixIcon: const Icon(PhosphorIconsRegular.money),
                    ),
                    PrefixInputText(
                      keyboardType: TextInputType.text,
                      controller: editProfileController.pinCode,
                      validator: Validate.validateEmptyText,
                      hint: "Pincode",
                      preFixIcon: const Icon(Icons.beenhere),
                    ),

                    SizedBox(height: 30.h),

                    /// Save button
                    Center(
                      child: Button(
                        height: 54.h,
                        minWidth: 185.w,
                        title: TTexts.saveDetails,
                        onPressed: () => editProfileController.updateProfile(),
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
