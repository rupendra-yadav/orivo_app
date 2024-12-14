import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/notificaations/widgets/alert_card.dart';
import 'package:auro/features/notificaations/widgets/notification_appa_bar.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../common/widgets/loaders/image_loader.dart';
import '../../../utils/constant/image_string.dart';
import '../../navigation/view/bottom_nav_screen/widgets/device_list_shimmer.dart';
import '../Controller/notificatyion_controller.dart';
import '../widgets/notification_card.dart';

class Alerts extends StatelessWidget {
  const Alerts({super.key, required this.id});

final String id ;

  @override
  Widget build(BuildContext context) {

    final NotificationController controller = Get.put(NotificationController());
    controller.getDeviceAlertNotificationList(id);

    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const NotificationAppBar(title: "Device Alerts",),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            /// Notification Card

            Padding(
              padding: SpacingStyle.paddingWithDefaultSpace,
              child: Obx((){

                if (controller.isDeviceAlertNotificationLoading.value) return const DeviceListShimmer();

                if (controller.deviceAlertNotificationList.isEmpty) {
                  return const TImageLoaderWidget(
                      text: 'Whoops! No Device Notification available...!',
                      animation: TImages.imgLoginBgNew1,
                      showAction: false);
                }

                return  SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.deviceAlertNotificationList.length,
                      itemBuilder: (context,index){
                        return AlertCard(deviceAlertNotificationModel: controller.deviceAlertNotificationList[index],);
                      }),
                ) ;
              }),
            ),

          ],
        ),
      ),
    );
  }
}


