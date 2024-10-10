import 'package:auro/common/widgets/buttons/button.dart';
import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/data_item_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/device_details_itme.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/graph.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/graph_shimmer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/buttons/text_button.dart';
import '../../../../common/widgets/loaders/image_loader.dart';
import '../../../../utils/constant/colors.dart';
import '../../../../utils/constant/image_string.dart';
import '../../../../utils/constant/text_strings.dart';
import '../../../../utils/styles/spacing_style.dart';
import '../../controller/device_detail_navigation_controller.dart';
import 'controller/device_detail_controller.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final DeviceDetailController controller = Get.put(DeviceDetailController());
  final DeviceDetailNavigationController navigationController =
      DeviceDetailNavigationController.instance;

  List<int> selectedIndices = [0]; // Track selected data items
  int selectedTimeIndex = 0; // Track selected time filter

  late String fieldName = "";
  late String duration = "-1m";
  late String startDate = "";
  late String endDate = "";
  late String pickedDate = "";
  late int indexPos ;

  String _selectedStartDate = TTexts.selectFromDate;
  String _selectedEndDate = TTexts.selectToDate;

  @override
  void initState() {
    super.initState();

    controller.getDeviceDetail(navigationController.deviceId.value, "","");

    controller.getDeviceDataItems();

    controller.getDeviceGraphData("f", "3071123300001", "-0d");

    DateTime now = DateTime.now();
    DateTime utcNow = now.toUtc();

    String formattedDate =
        DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(utcNow);

    controller.getHistoryFields(formattedDate);

    startDate = formattedDate;

    if (kDebugMode) {
      print(navigationController.deviceId.value);
    }
  }

  void handleCardTap(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        if (selectedIndices.length >=3) {
          selectedIndices.removeAt(0);
        }
        selectedIndices.add(index);
        String fieldId = controller.historyFieldModel.value.filters![index].id!;
        fieldName = fieldId;
      }
    });

    if (selectedIndices.contains(index)) {
      DateTime now = DateTime.now();
      DateTime utcNow = now.toUtc();
      String formattedDate =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(utcNow);

      if (controller.historyFieldModel.value.filters![index].name != null) {
        String fieldId = controller.historyFieldModel.value.filters![index].id!;
        fieldName = fieldId;
        controller.getHistory(formattedDate, "", controller.deviceListModel.mMachineUniqueId, fieldId, duration,index);
      }
    }
  }

  void handleTimeFilterTap(int index, String timeValue) {
    setState(() {
      selectedTimeIndex = index;
      indexPos = index; // Initialize indexPos here
    });

    controller.getHistory(startDate, endDate, controller.deviceListModel.mMachineUniqueId, fieldName, timeValue, indexPos);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Container(
          color: TColors.primaryDark1,
          child: Column(
            children: [
              /// Graph
              Obx(() {
                if (controller.isHistoryLoading.value) {
                  return const GraphShimmer();
                }

                if (controller.historyModel.value.filters?.isEmpty ?? true) {
                  return const TImageLoaderWidget(
                      text: 'Whoops! No Graph available...!',
                      animation: TImages.imgLoginBg,
                      showAction: false);
                }

                return const Graph();
              }),

              /// Graph Filter
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextButtonWithContainer(
                        text: TTexts.minute1,
                        isSelected: selectedTimeIndex == 0,
                        onPressed: () {
                          duration = "-1m";
                          handleTimeFilterTap(0, "-1m");
                        },
                      ),
                      TextButtonWithContainer(
                        text: TTexts.hour1,
                        isSelected: selectedTimeIndex == 1,
                        onPressed: () {
                          duration = "-1h";
                          handleTimeFilterTap(1, "-1h");
                        },
                      ),
                      TextButtonWithContainer(
                        text: TTexts.day1,
                        isSelected: selectedTimeIndex == 2,
                        onPressed: () {
                          duration = "-1d";
                          handleTimeFilterTap(2, "-1d");
                        },
                      ),
                      TextButtonWithContainer(
                        text: TTexts.week1,
                        isSelected: selectedTimeIndex == 3,
                        onPressed: () {
                          duration = "-1w";
                          handleTimeFilterTap(3, "-1w");
                        },
                      ),
                      TextButtonWithContainer(
                        text: TTexts.month1,
                        isSelected: selectedTimeIndex == 4,
                        onPressed: () {
                          duration = "-30d";
                          handleTimeFilterTap(4, "-30d");
                        },
                      ),
                    ],
                  ),
                ),
              ),

              /// Tabs and TabBarView
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: TColors.secondary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: TColors.secondary,
                      unselectedLabelColor: TColors.primaryLight1,
                      dividerColor: TColors.primaryLight1,
                      dividerHeight: 2.h,
                      tabs: const [
                        Tab(text: TTexts.selectDataItem),
                        Tab(text: TTexts.parameters),
                      ],
                    ),
                    Container(
                      color: TColors.primary,
                      height: 400.h, // Adjust height as necessary
                      child: TabBarView(
                        children: [
                          ///select data items Page
                          Obx(() {
                            if (controller.isHistoryFieldLoading.value) {
                              return const DeviceItemShimmer();
                            }

                            return Padding(
                              padding: SpacingStyle.paddingWithDefaultSpace,
                              child: SizedBox(
                                height: 400.h,
                                child: GridView.builder(
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 10.w,
                                          crossAxisSpacing: 10.h,
                                          childAspectRatio: 1),
                                  itemCount: controller.historyFieldModel.value
                                              .filters?.length !=
                                          null
                                      ? (controller.historyFieldModel.value
                                              .filters!.length -
                                          1)
                                      : 0,
                                  itemBuilder: (_, index) {
                                    return DataItemCard(
                                      colorContainer: TColors.primaryDark2,
                                      dataItems: controller.historyFieldModel
                                          .value.filters![index],
                                      isSelected:
                                          selectedIndices.contains(index),
                                      onTap: () {
                                        handleCardTap(index);
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          }),

                          ///Parameters
                          Padding(
                            padding: SpacingStyle.paddingWithDefaultSpace,
                            child: Column(
                              children: [
                                /// Start Date
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
                                          DateFormat('d-MM-yyyy')
                                              .format(pickedDate);

                                      startDate = formattedDate;

                                      setState(() {
                                        _selectedStartDate = formattedDate;
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

                                SizedBox(
                                  height: 20.h,
                                ),

                                /// End Date
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
                                          DateFormat('d-MM-yyyy')
                                              .format(pickedDate);

                                      endDate = formattedDate;

                                      setState(() {
                                        _selectedEndDate = formattedDate;
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
                                                text: _selectedEndDate,
                                                fontSize: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 40.h,
                                ),
                                Button(
                                    height: 45.h,
                                    minWidth: 100.w,
                                    onPressed: () {
                                      controller.getHistory(startDate, endDate, controller.deviceListModel.mMachineUniqueId, fieldName, duration,indexPos);
                                    },
                                    title: TTexts.apply)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
