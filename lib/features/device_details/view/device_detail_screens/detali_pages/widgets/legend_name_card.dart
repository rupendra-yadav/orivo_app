import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/helpers/number_formaters.dart';
import '../../model/cost_estimate_detail_model.dart';

class LegendNameCard extends StatefulWidget {
  const LegendNameCard({
    super.key,
    required this.costEstimateDetailModel, required this.colo ,
  });

  final CostEstimateDetailModel costEstimateDetailModel;
  final Color colo;

  @override
  _LegendNameCardState createState() => _LegendNameCardState();
}

class _LegendNameCardState extends State<LegendNameCard> {
  bool _isDetailVisible = false;

  @override
  Widget build(BuildContext context) {
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
                      color: widget.colo,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                SizedBox(width: 5.w),
                const TextView(text: "Energy : ", fontSize: 20),
                TextView(
                  text: NumberFormater().numberComma(number:(  widget.costEstimateDetailModel.totalEnergyCost
                              ?.value ??
                          0.0),)
                      ,
                  // Referencing widget.titleValue
                  fontSize: 20,
                  textColor: widget.colo,
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
            color: TColors.primaryDark4,
            elevation: 5.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Column(
                children: [
                  /// On Peak
                  Row(
                    children: [
                      Center(child: const TextView(text: "On Peak Unit")),
                      SizedBox(width: 10.w),
                      Center(child: const TextView(text: "Per Unit Cost")),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(number:(widget.costEstimateDetailModel.onPeak
                                        ?.value ??
                                    0.0))
                                ,
                            // Referencing widget.onPeakValue
                            textColor: widget.colo,
                          ),
                        ),
                      ),
                     
                      Expanded(child: Center(child: TextView(text: "x", fontSize: 15))),
                   
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(number:(widget.costEstimateDetailModel.onPeakRate
                                        ?.value ??
                                    0.0))
                                ,
                            // Referencing widget.onPeakRate
                            textColor: widget.colo,
                          ),
                        ),
                      ),
                      
                      Expanded(
                        child: Center(
                          child: TextView(
                              text: NumberFormater().numberComma(number:((widget.costEstimateDetailModel.onPeak?.value ?? 0.0) * (widget.costEstimateDetailModel.onPeakRate?.value ?? 0.0))),
                              textColor: widget.colo,),
                        ),
                      ),
                    ],
                  ),

                  /// Off Peak
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(text: "Off Peak Unit"),
                      SizedBox(width: 10.w),
                      const TextView(text: "Per Unit Cost"),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(number:(widget.costEstimateDetailModel.offPeak
                                        ?.value ??
                                    0.0))
                               ,
                            // Referencing widget.offPeakValue
                            textColor: widget.colo,
                          ),
                        ),
                      ),
                    
                      Expanded(child: Center(child: TextView(text: "x", fontSize: 15))),
                     
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(number:(widget.costEstimateDetailModel.offPeakRate?.value ?? 0.0)),
                            // Referencing widget.offPeakRate
                            textColor: widget.colo,
                          ),
                        ),
                      ),
                     
                      Expanded(
                        child: Center(
                          child: TextView(
                              text: NumberFormater().numberComma(number:((widget.costEstimateDetailModel.offPeak?.value ?? 0.0) * (widget.costEstimateDetailModel.offPeakRate?.value ?? 0.0))), textColor: widget.colo,),
                        ),
                      ),
                    ],
                  ),

                  /// Normal
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(text: "Normal Units"),
                      SizedBox(width: 10.w),
                      const TextView(text: "Per Unit Cost"),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(number:(widget.costEstimateDetailModel.normEnergy?.value ?? 0.0)),
                            // Referencing widget.offPeakValue
                            textColor: widget.colo,
                          ),
                        ),
                      ),
                      Expanded(child: Center(child: TextView(text: "x", fontSize: 15))),
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(number:(widget.costEstimateDetailModel.normEnergyRate?.value ?? 0.0)),
                            // Referencing widget.offPeakRate
                            textColor: widget.colo,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: TextView(
                              text: NumberFormater().numberComma(number:((widget.costEstimateDetailModel.normEnergy?.value ?? 0.0)*(widget.costEstimateDetailModel.normEnergyRate?.value ?? 0.0))), textColor: widget.colo,),
                        ),
                      ),
                    ],
                  ),

                  /// Grand Total
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const TextView(
                        text: "Total :",
                        fontSize: 20,
                        bold: true,
                      ),
                      SizedBox(width: 50.w,),
                      TextView(
                        text:NumberFormater().numberComma(number:(((widget.costEstimateDetailModel.onPeak?.value ?? 0.0) * (widget.costEstimateDetailModel.onPeakRate?.value ?? 0.0))+
                            ((widget.costEstimateDetailModel.offPeak?.value ?? 0.0) * (widget.costEstimateDetailModel.offPeakRate?.value ?? 0.0))+
                            ((widget.costEstimateDetailModel.normEnergy?.value ?? 0.0)*(widget.costEstimateDetailModel.normEnergyRate?.value ?? 0.0)))),
                        fontSize: 20,
                        bold: true,
                        textColor: widget.colo,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
