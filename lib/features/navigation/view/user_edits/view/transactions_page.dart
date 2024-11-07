import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../common/widgets/appbar/plane_app_bar.dart';
import '../../../../../common/widgets/loaders/image_loader.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../bottom_nav_screen/controller/device_list_controller.dart';
import '../../bottom_nav_screen/widgets/device_list_shimmer.dart';
import '../widget/transaction_card.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeviceListController());
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const PlainAppBar(title: TTexts.transactionsTitle),
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(

          child: Obx(() {
            if (controller.isDeviceLoading.value)
              return const DeviceListShimmer();

            if (controller.deviceList.isEmpty) {
              return const TImageLoaderWidget(
                  text: 'Whoops! No Transaction available...!',
                  animation: TImages.imgLoginBgNew1,
                  showAction: false);
            }

            return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.deviceList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {

                  return TransactionCard(title: TTexts.goldSubscription, date: TTexts.date_27_01_2024, price: TTexts.rs_15000,);

                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: TSizes.defaultSpace);
                });
          }),


      ),
    ),);
  }
}


