import 'package:auro/features/notificaations/Controller/notificatyion_controller.dart';
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
import '../widgets/notification_card.dart';


class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {

    final NotificationController controller = Get.put(NotificationController());
    controller.getNotificationList();

    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const NotificationAppBar(),
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Notification Card
              Obx((){

                if (controller.isNotificationLoading.value) return const DeviceListShimmer();

                if (controller.notificationList.isEmpty) {
                  return const TImageLoaderWidget(
                      text: 'Whoops! No Device available...!',
                      animation: TImages.imgLoginBgNew1,
                      showAction: false);
                }

                return  SizedBox(
                  height:  MediaQuery.of(Get.context!).size.height,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.notificationList.length,
                    itemBuilder: (context,index){
                      return NotificationCard(deviceListModel: controller.notificationList[index],
                      );
                    }),
                );
              })

              ,
            ],
          ),
        ),
      ),
    );
  }
}


