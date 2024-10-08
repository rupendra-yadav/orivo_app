import 'package:auro/features/device_details/view/device_detail_screens/electric_bill/widget/drop_down_cards.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/image_string.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../notificaations/view/notifications.dart';
import '../detali_pages/widgets/legend_name_card.dart';

class ElectricBill extends StatelessWidget {
  const ElectricBill({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.primary,
      appBar: AppBar(
        backgroundColor: TColors.primary,
        titleSpacing: 0,
        elevation: 5.h,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Iconsax.arrow_left,
            color: TColors.accent,
            size: 30,
          ),
        ),
        title: Container(
          height: TSizes.appBarHeight,
          color:  TColors.primary,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  "Electricity Bill",
                  style: TextStyle(color: TColors.white, fontSize: 22),
                ),
              ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed:() => Get.to(() => const Notifications()),
                  icon: Icon(
                    Iconsax.notification,
                    color: TColors.white,
                    size: 25,
                  ),
                ),
              ],
            ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child:
          Column(
            children: [

              ///Connection Info
              DropDownCard(cardTitle: 'KVA Info', field1: 'On Peak M.D', field2: 'Off Peak M.D', field3: 'Normal M.D', field4: 'Units', value4: '0.456', value3: '0.8541', value1: '0.300', value2: '0.3123',),
              SizedBox(height: 10.h,),
              ///Kva Info
              DropDownCard(cardTitle: 'KVA Info', field1: 'On Peak M.D', field2: 'Off Peak M.D', field3: 'Normal M.D', field4: 'Units', value4: '0.456', value3: '0.8541', value1: '0.300', value2: '0.3123',),
              SizedBox(height: 10.h,),
              ///KVAH info
              DropDownCard(cardTitle: 'KVA Info', field1: 'On Peak M.D', field2: 'Off Peak M.D', field3: 'Normal M.D', field4: 'Units', value4: '0.456', value3: '0.8541', value1: '0.300', value2: '0.3123',),
              SizedBox(height: 10.h,),
              ///Cost Details
              DropDownCard(cardTitle: 'KVA Info', field1: 'On Peak M.D', field2: 'Off Peak M.D', field3: 'Normal M.D', field4: 'Units', value4: '0.456', value3: '0.8541', value1: '0.300', value2: '0.3123',),

            ],
          ),
        ),
      ),
    );
  }
}
