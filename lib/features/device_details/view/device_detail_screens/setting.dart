import 'package:auro/common/widgets/shimmer/shimmer.dart';
import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/device_details/view/device_detail_screens/electric_bill/electric_bill.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/setting_device_details_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/setting_notification_detjails_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/setting_notification_shimmer.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/user_detail_info_shimmer.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/helpers/date_helper.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/inputFields/input_text.dart';
import '../../../../common/widgets/loaders/image_loader.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/preferences/cache_manager.dart';
import '../../../../utils/validate/validate.dart';
import '../../../navigation/view/bottom_nav_screen/controller/profile_detail_cotroller.dart';
import '../../../navigation/view/bottom_nav_screen/widgets/profile_shimmer.dart';
import '../../controller/device_detail_navigation_controller.dart';
import '../widgets/update_device_name_dialog.dart';
import 'controller/device_detail_controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceDetailController controller = Get.put(DeviceDetailController());
    final DeviceDetailNavigationController navigationController =
        DeviceDetailNavigationController.instance;
    controller.getDeviceDetail(navigationController.deviceId.value, "", "");

    final userController = Get.put(ProfileDetailController());
    userController.getUserData();

    return Scaffold(
      backgroundColor: TColors.primary,
      body: SizedBox(
        height: TDeviceUtils.screenHeight,
        width: TDeviceUtils.screenWidth,
        child: Stack(
          children: [
            ///BackGround Image
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image(
                    width: TDeviceUtils.screenWidth,
                    fit: BoxFit.cover,
                    height: 140.h,
                    image: const AssetImage(TImages.imgProfileBg))),

            /// Content
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: SpacingStyle.paddingWithDefaultSpace,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Electric Bill Button
                      GestureDetector(
                          onTap: () => Get.to(() => const ElectricBill()),
                          child: const TextView(
                            text: "Eletricity Bill",
                            fontSize: 25,
                            textColor: TColors.secondary,
                          )),

                      const SizedBox(
                        height: 20,
                      ),

                      /// DeviceInfo
                      const TextView(
                        text: TTexts.deviceAInfo,
                        fontSize: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          dialogUpdateDeviceName(context, controller,
                              navigationController.deviceId.value);
                        },
                        child: SettingDeviceDetailCard(
                          title: TTexts.deviceAName,
                          text: controller.deviceListModel.mMachineTitle,
                        ),
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.installationDate,
                        text: DateHelper().formatDateTime(
                            controller.deviceListModel.mMachineAddedon),
                      ),
                      SettingDeviceDetailCard(
                        title: TTexts.deviceModalNumber,
                        text: controller.deviceListModel.mMachineModelNumber,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),

                      ///User Details
                      Obx(() {
                        if (userController.isUserDataLoading.value) {
                          return UserDetailsInfoShimmer();
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextView(
                              text: TTexts.userDetails,
                              fontSize: 20,
                            ),
                            SettingDeviceDetailCard(
                                title: TTexts.totalLoad,
                                text: userController.userModelData.custTotalload
                                    .toString()),
                            SettingDeviceDetailCard(
                              title: TTexts.tariffPlan,
                              text: userController.userModelData.custTarrifplan
                                  .toString(),
                            ),
                            SettingDeviceDetailCard(
                              title: TTexts.bPNumber,
                              text: userController.userModelData.custBpno
                                  .toString(),
                            ),
                            SettingDeviceDetailCard(
                              title: TTexts.cSPDCLpassword,
                              text: userController.userModelData.custCspcdlpass
                                  .toString(),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                        );
                      }),

                      /// Notifications Settings
                      Obx(() {
                        if (userController.isUserDataLoading.value) {
                          return SettingNotificationShimmer();
                        }

                        SharedPrefs.setString("USER_ID",userController.userModel[0].mCustId.toString() );

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextView(
                              text: TTexts.notification,
                              fontSize: 20,
                            ),
                             SettingNotificationDetailsCard(
                              title: userController.userModel[0].mCustMobile.toString()!= null && !userController.userModel[0].mCustMobile.toString().isEmpty?userController.userModel[0].mCustMobile.toString():TTexts.clickToAddNumber, type: 0, active: userController.userModel[0].mCustMobileActive.toString()!= null && !userController.userModel[0].mCustMobileActive.toString().isEmpty && userController.userModel[0].mCustMobileActive == "1" ?1:0,
                            ),
                             SettingNotificationDetailsCard(
                               title: userController.userModel[0].mCustWhatsapp.toString()!= null && !userController.userModel[0].mCustWhatsapp.toString().isEmpty?userController.userModel[0].mCustWhatsapp.toString():TTexts.clickToAddNumber, type: 1, active: userController.userModel[0].mCustWhatsappActive.toString()!= null && !userController.userModel[0].mCustWhatsappActive.toString().isEmpty && userController.userModel[0].mCustWhatsappActive == "1" ?1:0,
                            ),
                             SettingNotificationDetailsCard(
                               title: userController.userModel[0].mCustAltWhatsapp.toString()!= null && !userController.userModel[0].mCustAltWhatsapp.toString().isEmpty?userController.userModel[0].mCustAltWhatsapp.toString():TTexts.clickToAddNumber, type: 2, active: userController.userModel[0].mCustAltWhatsappActive.toString()!= null && !userController.userModel[0].mCustAltWhatsappActive.toString().isEmpty && userController.userModel[0].mCustAltWhatsappActive == "1" ?1:0,
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


