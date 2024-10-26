import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/legend_name_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/lrgend_name_card_demand.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/lrgend_name_card_govt.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../controller/device_detail_controller.dart';
import '../home.dart';
import '../widgets/device_detail_shimmer.dart';

class CostEstimate extends StatefulWidget {
  const CostEstimate({super.key});

  @override
  _CostEstimateState createState() => _CostEstimateState();
}

class _CostEstimateState extends State<CostEstimate> {

  final DeviceDetailController controller = Get.put(DeviceDetailController());

  String _selectedDateRange = TTexts.chooseDateRange;


  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    DateTime utcNow = now.toUtc();

    // Convert UTC date and time to IST
    DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));

    // Set the time to 00:00:00 (midnight) in IST for the same date
    DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);

    // Format the date and time to the desired format
    String formattedDateMidnight = DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
    String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);
    // Call the API with the current date
    controller.getCostEstimateDetails(formattedDateMidnight, controller.deviceListModel.mMachineUniqueId, formattedDate);
  }


  @override
  Widget build(BuildContext context) {

    Map<String, double> originalDataMap = {
      "Demand":controller.costEstimateDetailsModel.value.totolDemandCost?.value ?? 0.0,
      "Energy":controller.costEstimateDetailsModel.value.totalEnergyCost?.value ?? 0.0,
      "Govt":controller.costEstimateDetailsModel.value.govCost?.value ?? 0.0,
    };

    Map<String, double> updatedDataMap2 = {};

// Updating the map with formatted keys
    originalDataMap.forEach((key, value) {
      updatedDataMap2['$key: $value'] = value;
    });

    return Scaffold(
      appBar: const DeviceCardDetailsAppBar(
        title: TTexts.costEstimate,
      ),
      backgroundColor: TColors.primary,
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  // Open the DateRangePickerDialog
                  DateTimeRange? pickedDateRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDateRange: DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now(),
                    ),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: TColors.primaryDark2,
                            onPrimary: Colors.white,
                            onSurface: Colors.black,
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: TColors.primaryDark1,
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDateRange != null) {
                    // Formatting the date to 1-08-2024 format
                    String formattedStartDate = DateFormat('d-MM-yyyy').format(pickedDateRange.start);
                    String formattedStartDate1 = DateFormat("yyyy-MM-dd HH:mm:ss").format(pickedDateRange.start);

                    String formattedEndDate = DateFormat('d-MM-yyyy').format(pickedDateRange.end);
                    String formattedEndDate1 = DateFormat("yyyy-MM-dd HH:mm:ss").format(pickedDateRange.end);

                    setState(() {_selectedDateRange = "From $formattedStartDate To $formattedEndDate";

                    controller.getCostEstimateDetails(formattedStartDate1, controller.deviceListModel.mMachineUniqueId, formattedEndDate1);

                    });
                  }
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Container(

                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TColors.primaryDark1,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Iconsax.calendar_2,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            TextView(text: _selectedDateRange),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Pie chart and other widgets below
              Obx((){
                if (controller.isCostEstimateDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }

                double onPeak = controller.costEstimateDetailsModel.value.totolDemandCost?.value?? 0.0;
                double offPeak = controller.costEstimateDetailsModel.value.totalEnergyCost?.value?? 0.0;
                double normal  = controller.costEstimateDetailsModel.value.govCost?.value?? 0.0;
                double totalCount =  onPeak + offPeak + normal;


                /* if (controller.energyConsumptionData.value.normalUnit != null) {
                        return const TImageLoaderWidget(
                            text: 'Whoops! No Device available...!',
                            animation: TImages.imgLoginBg,
                            showAction: false);
                      }*/

                
                return  Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: TColors.primaryDark1,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 10.w,
                      ),
                      child: Column(
                        children: [
                         // const TextView(text: TTexts.costEstimation),
                          SizedBox(height: 20.h),
                          PieChart(
                            dataMap: updatedDataMap2,
                            animationDuration:
                            const Duration(milliseconds: 800),
                            chartLegendSpacing: 32.w,
                            chartRadius:
                            MediaQuery.of(context).size.width / 3.2,
                            colorList: colorList2,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 10.w,
                            centerWidget: Container(
                              width: 87.w,
                              height: 87.w,
                              decoration: BoxDecoration(
                                color: TColors.primaryDark1,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child:  Center(
                                child: TextView(
                                  text: totalCount.toStringAsFixed(2),
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                            legendOptions:
                            const LegendOptions(showLegends: false),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: false,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                              chartValueBackgroundColor: TColors.primary,
                              decimalPlaces: 1,
                            ),
                          ),
                          SizedBox(height: 20.h),

                          LegendNameCard(costEstimateDetailModel: controller.costEstimateDetailsModel.value),
                          LegendNameCardGovt(costEstimateDetailModel: controller.costEstimateDetailsModel.value),
                          LegendNameCardDemand(costEstimateDetailModel: controller.costEstimateDetailsModel.value),

                       /*    LegendNameCard(),
                           LegendNameCard(),*/
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

final colorList2 = <Color>[
  const Color(0xff3dd598),
  const Color(0xff0062ff),
  const Color(0xffff974a),
];
