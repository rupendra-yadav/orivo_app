import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/navigation/view/user_edits/controller/edit_profile_controller.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../common/widgets/appbar/plane_app_bar.dart';
import '../../../../../common/widgets/buttons/button.dart';
import '../../../../../common/widgets/inputFields/input_text.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../bottom_nav_screen/model/user_detail_model.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final editProfileController = Get.put(EditProfileController());

    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const PlainAppBar(
        title: TTexts.editProfile,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyle.paddingWithDefaultSpace,

          ///main Column
          child: Form(
            key: editProfileController.updateProfileFormKey,
            child: SizedBox(
              height: TDeviceUtils.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          ///Profile Image
                           CircleAvatar(
                            backgroundColor: TColors.primaryLight1,
                            minRadius: 50,
                            // Adjusted the radius to fit the image better
                            maxRadius: 50,

                            foregroundImage: NetworkImage(TImages.userImagePath + userModel.mCustImage),

                            // Adjusted the radius to fit the image better
                            /*child: Image(
                              image: AssetImage(TImages.imgUser),
                              height: 180, // Adjusted to fit the CircleAvatar
                              width: 180, // Adjusted to fit the CircleAvatar
                              fit: BoxFit.cover,
                            ),*/
                          ),

                          ///TextButton
                          TextButton(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  backgroundColor: TColors.primaryLight1,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 150.h,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          editProfileController
                                                              .galleryPermission(
                                                                  context);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(
                                                          Iconsax.gallery,
                                                          size: 50.h,
                                                          color:
                                                              TColors.primary,
                                                        )),
                                                    const TextView(
                                                      text: TTexts.openGallery,
                                                      textColor:
                                                          TColors.primary,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          editProfileController
                                                              .cameraPermission(
                                                                  context);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(
                                                          Iconsax.camera4,
                                                          size: 50.h,
                                                          color:
                                                              TColors.primary,
                                                        )),
                                                    const TextView(
                                                      text: TTexts.openCamera,
                                                      textColor:
                                                          TColors.primary,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text(TTexts.changeImageText,
                                  style: TextStyle(
                                    color: TColors.secondary,
                                    fontSize: 15,
                                  )))
                        ],
                      ),

                      /// Edit Area
                      ///  Input Fields
                      ///  Company name
                      SizedBox(
                        height: 20.h,
                      ),

                      /// Full Name
                      PrefixInputText(
                        controller: editProfileController.name,
                        // validator: (value) => Validate.validateEmptyText(value),
                        hint: userModel.mCustName.isNotEmpty
                            ? userModel.mCustName
                            : TTexts.etHintFullName,
                        preFixIcon: const Icon(Iconsax.profile_add),
                        keyboardType: TextInputType.name,
                      ),

                      /// State
                      PrefixInputText(
                        controller: editProfileController.state,
                        // validator: (value) => Validate.validateEmptyText(value),
                        hint: userModel.mCustState.isNotEmpty
                            ? userModel.mCustState
                            : TTexts.state,
                        preFixIcon: const Icon(Iconsax.building),
                        keyboardType: TextInputType.text,
                      ),

                      /// City
                      PrefixInputText(
                        controller: editProfileController.city,
                        // validator: (value) => Validate.validateEmptyText(value),
                        hint: userModel.mCustCity.isNotEmpty
                            ? userModel.mCustCity
                            : TTexts.city,
                        preFixIcon: const Icon(PhosphorIconsBold.city),
                        keyboardType: TextInputType.text,
                      ),

                      ///Address
                      PrefixInputText(
                        controller: editProfileController.address,
                        // validator: (value) => Validate.validateEmptyText(value),
                        hint: userModel.mCustAddress.isNotEmpty
                            ? userModel.mCustAddress
                            : TTexts.address,
                        preFixIcon: const Icon(PhosphorIconsBold.addressBook),
                        keyboardType: TextInputType.text,
                      ),

                      ///Company Name
                      PrefixInputText(
                        controller: editProfileController.companyName,
                        // validator: (value) => Validate.validateEmptyText(value),
                        hint: userModel.mCustCompany.isNotEmpty
                            ? userModel.mCustCompany
                            : TTexts.etHintCompanyName,
                        preFixIcon: const Icon(Iconsax.building),
                        keyboardType: TextInputType.text,
                      ),

                      ///Company type
                      PrefixInputText(
                        controller: editProfileController.companyType,
                        // validator: (value) => Validate.validateEmptyText(value),
                        hint: userModel.mCustCompanyType.isNotEmpty
                            ? userModel.mCustCompanyType
                            : TTexts.companyType,
                        preFixIcon: const Icon(Icons.type_specimen),
                        keyboardType: TextInputType.text,
                      ),

                      ///GST Number
                      PrefixInputText(
                        controller: editProfileController.gstNumber,
                        // validator: (value) => Validate.validateEmptyText(value),
                        hint: userModel.mCustGstno.isNotEmpty
                            ? userModel.mCustGstno
                            : TTexts.gstNo,
                        preFixIcon: const Icon(PhosphorIconsRegular.money),
                        keyboardType: TextInputType.text,
                      ),

                      ///Owners Name
                      PrefixInputText(
                        controller: editProfileController.ownersName,
                        // validator: (value) => Validate.validateEmptyText(value),
                        hint: userModel.mCustOwnerName.isNotEmpty
                            ? userModel.mCustOwnerName
                            : TTexts.ownersName,
                        preFixIcon: const Icon(Icons.beenhere),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
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
          ),
        ),
      ),
    );
  }
}
