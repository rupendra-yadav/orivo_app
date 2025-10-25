import 'package:auro/common/widgets/buttons/button.dart';
import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/device_details/view/device_detail_screens/electric_bill/widget/drop_down_cards.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../utils/constant/colors.dart';

class Insights extends StatelessWidget {
  const Insights({super.key});

  @override
  Widget build(BuildContext context) {
    String _selectedDateRange = TTexts.chooseDateRange;
    String formattedEndDateInYears = "";

    bool isTrue = false;

    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),

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
                  String formattedStartDate =
                      DateFormat('d-MM-yyyy').format(pickedDateRange.start);
                  String formattedStartDateInYears =
                      DateFormat("yyyy-MM-dd HH:mm:ss")
                          .format(pickedDateRange.start);

                  String formattedEndDate =
                      DateFormat('d-MM-yyyy').format(pickedDateRange.end);
                  formattedEndDateInYears = DateFormat("yyyy-MM-dd HH:mm:ss")
                      .format(pickedDateRange.end);

                  if (formattedStartDate == formattedEndDate) {
                    DateTime pickedDateRange =
                        DateTime.parse(formattedEndDateInYears);
                    DateTime updatedDateTime = pickedDateRange.copyWith(
                        hour: 23, minute: 59, second: 59);
                    formattedEndDateInYears = DateFormat('yyyy-MM-dd HH:mm:ss')
                        .format(updatedDateTime);

                    print("Start and End dates are the same.");
                  } else {
                    print("Start and End dates are different.");
                  }

                  // setState(() {
                  //   _selectedDateRange =
                  //       "From $formattedStartDate \n To $formattedEndDate";

                  // startDate = formattedStartDateInYears;
                  // endDate = formattedEndDateInYears;
                  // WidgetsBinding.instance.addPostFrameCallback((_) {
                  //   controller.fetchEnergyConsumptionDetail(
                  //       navigationcontroller.deviceId.value,
                  //       formattedStartDateInYears,
                  //       formattedEndDateInYears);
                  // });
                  // });
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
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Iconsax.calendar_2,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Flexible(
                            child: Text(
                              _selectedDateRange,
                              maxLines: 2,
                              overflow: TextOverflow
                                  .ellipsis, // Optional: adds "..." if too long
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            isTrue
                ? _buildUploadPage()
                : Container(
                    padding: EdgeInsets.all(18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),

                        Container(
                          decoration: BoxDecoration(
                              color: TColors.primaryDark1,
                              borderRadius: BorderRadius.circular(20.r)),
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextView(
                                text: "Download Bill",
                                fontSize: 14,
                                bold: true,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.file_download_outlined,
                                color: TColors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        ///Connection Info
                        const DropDownCard(
                          cardTitle: 'Connection Info',
                          field1: 'On Peak M.D',
                          field2: 'Off Peak M.D',
                          field3: 'Normal M.D',
                          field4: 'Units',
                          value4: '0.456',
                          value3: '0.8541',
                          value1: '0.300',
                          value2: '0.3123',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        ///Kva Info
                        const DropDownCard(
                          cardTitle: 'KVA Info',
                          field1: 'On Peak M.D',
                          field2: 'Off Peak M.D',
                          field3: 'Normal M.D',
                          field4: 'Units',
                          value4: '0.456',
                          value3: '0.8541',
                          value1: '0.300',
                          value2: '0.3123',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        ///KVAH info
                        const DropDownCard(
                          cardTitle: 'KVAH Info',
                          field1: 'On Peak M.D',
                          field2: 'Off Peak M.D',
                          field3: 'Normal M.D',
                          field4: 'Units',
                          value4: '0.456',
                          value3: '0.8541',
                          value1: '0.300',
                          value2: '0.3123',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        ///Cost Details
                        const DropDownCard(
                          cardTitle: 'Cost Details',
                          field1: 'On Peak M.D',
                          field2: 'Off Peak M.D',
                          field3: 'Normal M.D',
                          field4: 'Units',
                          value4: '0.456',
                          value3: '0.8541',
                          value1: '0.300',
                          value2: '0.3123',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        ///Analysis
                        const DropDownCard(
                          cardTitle: 'Analysis',
                          field1: 'On Peak M.D',
                          field2: 'Off Peak M.D',
                          field3: 'Normal M.D',
                          field4: 'Units',
                          value4: '0.456',
                          value3: '0.8541',
                          value1: '0.300',
                          value2: '0.3123',
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

Widget _buildUploadPage() {
  return Container(
    margin: EdgeInsets.all(32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),

        // SvgPicture.asset(
        //   "assets/images/pana.svg",
        //   height: 150.h,
        // ),
        Center(child: Image.asset(TImages.imgAlertTriangle)),

        const SizedBox(
          height: 30,
        ),

        const TextView(
          text: "Upload Bill",
          fontSize: 24,
          bold: true,
          textColor: TColors.textWhite,
        ),
        const TextView(
          text:
              "No bill Has been uploaded. Please Upload for Viewing and Analysis",
          fontSize: 12,
          bold: true,
          textColor: TColors.textWhite,
        ),

        SizedBox(
          height: 50.h,
        ),

        Center(
          child: Button(
            height: 45.h,
            minWidth: 100.w,
            onPressed: () {},
            title: TTexts.upload,
            radius: 10,
          ),
        )
      ],
    ),
  );
}
