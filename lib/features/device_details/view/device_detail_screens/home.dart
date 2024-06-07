import 'package:auro/features/device_details/view/device_detail_screens/widgets/data_item_card.dart';
import 'package:auro/features/device_details/view/device_detail_screens/widgets/text_view_card.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/device/device_utility.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../common/widgets/text/text_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: SpacingStyle.paddingWithDefaultSpace,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Daily Summary
                  const TextView(
                    text: TTexts.dailySummary,
                  ),

                  ///card
                  const TextViewCard(
                    cardText: TTexts.max_kwh_today,
                    width: double.infinity,
                  ),

                  ///Alerts
                  const TextView(
                    text: TTexts.alerts,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextViewCard(
                            cardText: TTexts.max_kwh_today,
                            width: TDeviceUtils.screenWidth / 2.w),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: TextViewCard(
                            cardText: TTexts.max_kwh_today,
                            width: TDeviceUtils.screenWidth / 2.w),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// Draggable Scroll View
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.4,
            maxChildSize: 0.93,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                    color: TColors.primaryDark2,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40), bottom: Radius.zero)),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      ///icon to Drag
                      const Center(
                        child: Icon(
                          Iconsax.minus,
                          color: TColors.white,
                          size: 70,
                        ),
                      ),

                      ///Graph
                      const Graph(),

                      /// Select Data item
                      const Center(
                        child: TextView(
                          text: TTexts.selectDataItems,
                          fontSize: 14,
                        ),
                      ),

                      /// list view and card
                      Padding(
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
                            itemCount: 24,
                            itemBuilder: (context, index) {
                              return const DataItemCard(
                                title: TTexts.uab,
                                value: TTexts.values,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Graph extends StatelessWidget {
  const Graph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SpacingStyle.paddingWithDefaultSpace,
      child: SfCartesianChart(
        plotAreaBorderColor: TColors.primaryLight2,
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true, // Enables pinch zooming
          enablePanning: true, // Enables panning
          enableDoubleTapZooming: true, // Enables double-tap zooming
          enableMouseWheelZooming:
              true, // Enables mouse wheel zooming (for web)
        ),
        primaryXAxis: const NumericAxis(
          axisLine: AxisLine(color: TColors.primaryLight2),
          labelStyle: TextStyle(color: TColors.primaryLight2, fontSize: 6),
          majorGridLines: MajorGridLines(color: TColors.primaryLight2),
        ),
        primaryYAxis: const NumericAxis(
          axisLine: AxisLine(color: TColors.primaryLight2),
          labelStyle: TextStyle(color: TColors.primaryLight2, fontSize: 6),
          majorGridLines: MajorGridLines(color: TColors.primaryLight2),
        ),
        series: <CartesianSeries>[
          SplineSeries<SalesData, double>(
            animationDuration: 2000,
            dataSource: chartData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            color: TColors.graphLine,

            /// marker Setting to get dots in the graph
            markerSettings: MarkerSettings(
              isVisible: true,
              shape: DataMarkerType.circle,
              color: TColors.graphLine,
              height: 6.h,
              width: 6.w,
              // Customize the color of the marker
              borderWidth: 0,
              // Customize the border width of the marker
              borderColor: TColors.graphLine,
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}

final List<SalesData> chartData = [
  SalesData(2010, 1),
  SalesData(2011, 2),
  SalesData(2012, 5),
  SalesData(2013, 6),
  SalesData(2014, 10),
  SalesData(2015, 36),
  SalesData(2016, 28),
  SalesData(2017, 0),
  SalesData(2018, 32),
  SalesData(2019, 40),
  SalesData(2020, 2),
  SalesData(2021, 34),
  SalesData(2022, 32),
  SalesData(2023, 40),
  SalesData(2024, 40)
];
