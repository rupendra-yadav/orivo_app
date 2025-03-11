import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/demand_estimate_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/demand_tiem_line_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/detali_pages/widgets/device_card_details_app_bar.dart';
import 'package:auro/features/navigation/view/bottom_nav_screen/controller/profile_detail_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../../../../../utils/constant/text_strings.dart';
import '../../../../../utils/styles/spacing_style.dart';
import '../controller/device_detail_controller.dart';
import '../widgets/device_detail_shimmer.dart';

class DemandEstimateDetail extends StatefulWidget {
  const DemandEstimateDetail({super.key, required this.isNotify});

  final bool isNotify;

  @override
  State<DemandEstimateDetail> createState() => _DemandEstimateDetailState();
}

class _DemandEstimateDetailState extends State<DemandEstimateDetail> {

  late Map<String, String> args;

  late String deviceId;

  late String deviceName;

  late String startDate;

  late String endDate;

  final DeviceDetailController controller = Get.put(DeviceDetailController());
  final userController = Get.put(ProfileDetailController());


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userController.getUserData();
    if (widget.isNotify == true) {

      args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      // Initialize values safely
      deviceId = args['deviceId'] ?? controller.deviceList[0].userDeviceId;

      DateTime now =
      DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
      DateTime midnight = DateTime(now.year, now.month, now.day);

      startDate = args['startDate'] ?? DateFormat("yyyy-MM-dd HH:mm:ss").format(midnight);
      endDate = args['endDate'] ?? DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

      controller.getDemandDetail(startDate, deviceId, endDate);


    }else {
      DateTime now = DateTime.now();
      DateTime utcNow = now.toUtc();

      // Convert UTC date and time to IST
      DateTime istNow = utcNow.add(const Duration(hours: 5, minutes: 30));

      // Set the time to 00:00:00 (midnight) in IST for the same date
      DateTime istMidnight = DateTime(istNow.year, istNow.month, istNow.day);

      // Format the date and time to the desired format
      String formattedDateMidnight = DateFormat("yyyy-MM-dd HH:mm:ss").format(istMidnight);
      startDate = formattedDateMidnight;
      String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(istNow);
      endDate = formattedDate;

      deviceId = controller.deviceList[0].userDeviceId;
      // Call the API with the current date
      controller.getDemandDetail(startDate, deviceId, endDate);
    }
  }

/*  @override
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
    controller.getDemandDetail(formattedDateMidnight, controller.deviceList[0].mMachineUniqueId, formattedDate);
  }*/

  String _selectedDateRange = TTexts.chooseDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: const DeviceCardDetailsAppBar(title: TTexts.demandEstimate),
      backgroundColor: TColors.primary,
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Date Range Section
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
                    String formattedStartDateInYears = DateFormat("yyyy-MM-dd HH:mm:ss").format(pickedDateRange.start);

                    String formattedEndDate = DateFormat('d-MM-yyyy').format(pickedDateRange.end);
                    String formattedEndDateInYears = DateFormat("yyyy-MM-dd HH:mm:ss").format(pickedDateRange.end);


                    if (formattedStartDate == formattedEndDate) {
                      DateTime pickedDateRange = DateTime.parse(formattedEndDateInYears);
                      DateTime updatedDateTime = pickedDateRange.copyWith(hour: 23, minute: 59, second: 59);
                      formattedEndDateInYears = DateFormat('yyyy-MM-dd HH:mm:ss').format(updatedDateTime);

                      print("Start and End dates are the same.");
                    } else {
                      print("Start and End dates are different.");
                    }

                    setState(() {
                      _selectedDateRange = "From $formattedStartDate To $formattedEndDate";

                      endDate = formattedEndDateInYears;
                      startDate = formattedStartDateInYears;

                      controller.getDemandDetail(startDate, deviceId, endDate);

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

              SizedBox(
                height: 20.h,
              ),

              /// Demand Estimate
              Obx((){

                if (controller.isDemandDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return DemandEstimateCard(demandDetailModel: controller.demandDetailModel.value, totalLoad: double.tryParse(userController.userModel[0].custTotalload ?? '1.0') ?? 1.0,);
              }),


              SizedBox(
                height: 20.h,
              ),

              /// Demand Time Line
              Obx((){
                if (controller.isDemandDetailLoading.value) {
                  return const DeviceDetailShimmer();
                }
                return DemandTimeLineCard(demandDetailModel: controller.demandDetailModel.value,);
              })
            ],
          ),
        ),
      ),
    );
  }
}
