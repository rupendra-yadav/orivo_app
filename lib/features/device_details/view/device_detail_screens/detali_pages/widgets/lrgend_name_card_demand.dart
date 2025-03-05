import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/helpers/number_formaters.dart';
import '../../model/cost_estimate_detail_model.dart';
import '../../widgets/demand_distribution_card.dart';

class LegendNameCardDemand extends StatefulWidget {
  const LegendNameCardDemand({
    super.key,
    required this.costEstimateDetailModel,
    required this.color,
  });

  final CostEstimateDetailModel costEstimateDetailModel;
  final Color color;

  @override
  _LegendNameCardDemandState createState() => _LegendNameCardDemandState();
}

class _LegendNameCardDemandState extends State<LegendNameCardDemand> {
  bool _isDetailVisible = false;

  @override
  Widget build(BuildContext context) {
    double gTotal = 0;
    if (widget.costEstimateDetailModel.demandDistribution != null) {
      for (int i = 0;
          i < widget.costEstimateDetailModel.demandDistribution!.length;
          i++) {
        gTotal = gTotal +
            ((widget.costEstimateDetailModel.demandDistribution![i].cost
                    ?.toDouble() ??
                0.0) /** (widget.costEstimateDetailModel.demandDistribution![i].demand?.toDouble() ?? 0.0)*/);
      }
    }

    return Column(
      children: [
        /// Name
        Card(
          elevation: 10.h,
          color: TColors.primaryDark4,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                SizedBox(width: 5.w),
                const TextView(text: "Demand : ", fontSize: 20),
                TextView(
                  text: NumberFormater().numberComma(
                      number: (widget
                              .costEstimateDetailModel.totolDemandCost?.value ??
                          0.0)),
                  // Referencing widget.titleValue
                  fontSize: 20,
                  textColor: widget.color,
                ),
                const TextView(text: " Rs", fontSize: 20),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    // Toggle visibility of LegendDetailCard
                    setState(() {
                      _isDetailVisible = !_isDetailVisible;
                    });
                  },
                  icon: const Icon(Iconsax.arrow_right_3, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        /// Details - Only visible if _isDetailVisible is true
        if (_isDetailVisible)
          Card(
            color: Colors.transparent,
            elevation: 0.h,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Column(
                children: [
                  /// Demand Charge
                  /*  Row(
                    children: [
                      const TextView(text: "Demand Charge"),
                      SizedBox(width: 10.w),
                      const TextView(text: ""),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextView(
                          text: (widget.costEstimateDetailModel.demand?.value ??
                                  0.0)
                              .toStringAsFixed(2),
                          // Referencing widget.onPeakValue
                          textColor: TColors.graphLine,
                        ),
                      ),
                      Expanded(child: TextView(text: "x", fontSize: 15)),
                      Expanded(
                        child: TextView(
                          text: (widget.costEstimateDetailModel.demandRate
                                      ?.value ??
                                  0.0)
                              .toStringAsFixed(2),
                          // Referencing widget.onPeakRate
                          textColor: TColors.graphLine,
                        ),
                      ),
                      Expanded(
                        child: TextView(
                            text: ((widget.costEstimateDetailModel.demand?.value ?? 0.0) *
                                    (widget.costEstimateDetailModel.demandRate
                                            ?.value ??
                                        0.0))
                                .toStringAsFixed(2),
                            textColor: TColors.graphLine),
                      ),
                    ],
                  ),*/

                  /// Grand Total

                  /* SizedBox(
                    height: 15.h,
                  ),*/
                  /* Row(
                    children: [
                      Expanded(child: TextView(text: "Cost")),
                      Expanded(child: TextView(text: "Demand")),
                      Expanded(child: TextView(text: "Rate")),

                    ],
                  ),*/

                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 400.h, // Set a maximum height for the ListView
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.costEstimateDetailModel
                              .demandDistribution?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return DemandDistributionCard(
                          demandDistribution: widget.costEstimateDetailModel
                              .demandDistribution![index],
                          color: widget.color,
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextView(
                        text: "Total :",
                        fontSize: 20,
                        bold: false,
                        textColor: widget.color,
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      TextView(
                        text: NumberFormater().numberComma(number: gTotal),
                        fontSize: 20,
                        bold: true,
                        textColor: widget.color,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
