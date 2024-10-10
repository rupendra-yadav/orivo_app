import 'package:auro/common/widgets/buttons/button.dart';
import 'package:auro/features/device_details/view/device_detail_screens/electric_bill/widget/drop_down_cards.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/sizes.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../notificaations/view/notifications.dart';

class ElectricBill extends StatefulWidget {
  const ElectricBill({super.key});

  @override
  State<ElectricBill> createState() => _ElectricBillState();


}

class _ElectricBillState extends State<ElectricBill> {

  String _selectedStartDate = TTexts.selectFromDate;
  late String startDate = "";

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
          icon: const Icon(
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
              const Center(
                child: Text(
                  TTexts.electricityBill,
                  style: TextStyle(color: TColors.white, fontSize: 22),
                ),
              ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed:() => Get.to(() => const Notifications()),
                  icon: const Icon(
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

              ///Date Picker
              GestureDetector(
                onTap: () async {
                  // Open the DatePicker to pick a single date
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme:
                          const ColorScheme.light(
                            primary: TColors.primaryDark2,
                            // Header background color
                            onPrimary: Colors.white,
                            // Header text color
                            onSurface: Colors
                                .black, // Body text color
                          ),
                          textButtonTheme:
                          TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: TColors
                                  .primaryDark1, // Button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    // Formatting the selected date to the format '1-08-2024'
                    String formattedDate =
                    DateFormat('MMMM yyyy').format(pickedDate);

                    String saveDate =
                    DateFormat('d-MM-yyyy').format(pickedDate);

                    startDate = saveDate;

                    setState(() {_selectedStartDate = formattedDate;
                    });
                  }
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: TColors.primaryDark1,
                        borderRadius:
                        BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 20.w),
                        child: Row(
                          children: [
                            const Icon(
                              Iconsax.calendar_2,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5.w),
                            TextView(
                              text: _selectedStartDate,
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 10.h,),

              ///Connection Info
              const DropDownCard(cardTitle: 'KVA Info', field1: 'On Peak M.D', field2: 'Off Peak M.D', field3: 'Normal M.D', field4: 'Units', value4: '0.456', value3: '0.8541', value1: '0.300', value2: '0.3123',),
              SizedBox(height: 10.h,),

              ///Kva Info
              const DropDownCard(cardTitle: 'KVA Info', field1: 'On Peak M.D', field2: 'Off Peak M.D', field3: 'Normal M.D', field4: 'Units', value4: '0.456', value3: '0.8541', value1: '0.300', value2: '0.3123',),
              SizedBox(height: 10.h,),

              ///KVAH info
              const DropDownCard(cardTitle: 'KVA Info', field1: 'On Peak M.D', field2: 'Off Peak M.D', field3: 'Normal M.D', field4: 'Units', value4: '0.456', value3: '0.8541', value1: '0.300', value2: '0.3123',),
              SizedBox(height: 10.h,),

              ///Cost Details
              const DropDownCard(cardTitle: 'KVA Info', field1: 'On Peak M.D', field2: 'Off Peak M.D', field3: 'Normal M.D', field4: 'Units', value4: '0.456', value3: '0.8541', value1: '0.300', value2: '0.3123',),
              SizedBox(height: 50.h,),

              ///Download button
              Button(height: 45.h, minWidth: double.infinity, onPressed: (){}, title: TTexts.downloadElectricityBill),

            ],
          ),
        ),
      ),
    );
  }
}
