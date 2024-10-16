import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../model/cost_estimate_detail_model.dart';

class LegendNameCardGovt extends StatefulWidget {
  const LegendNameCardGovt({
    super.key,
    required this.costEstimateDetailModel,
  });

  final CostEstimateDetailModel costEstimateDetailModel;

  @override
  _LegendNameCardGovtState createState() => _LegendNameCardGovtState();
}

class _LegendNameCardGovtState extends State<LegendNameCardGovt> {
  bool _isDetailVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Name
        Card(
          elevation: 10.h,
          color: TColors.primaryDark2,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Row(
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: TColors.blue,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ),
                SizedBox(width: 5.w),
                const TextView(text: "Govt : ", fontSize: 20),
                TextView(
                  text: (widget.costEstimateDetailModel.govCost
                      ?.value ??
                      0.0)
                      .toStringAsFixed(2),
                  // Referencing widget.titleValue
                  fontSize: 20,
                  textColor: TColors.blue,
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
            color: TColors.primaryDark2,
            elevation: 5.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: Column(
                children: [
                  /// Normal FPPAS
                  Row(
                    children: [
                      const TextView(text: "Normal FPPAS"),
                      SizedBox(width: 10.w),
                      const TextView(text: ""),
                    ],
                  ),
                  Row(
                    children: [
                      TextView(
                        text: (widget.costEstimateDetailModel.normalFpps
                            ?.value ??
                            0.0)
                            .toStringAsFixed(2),
                        // Referencing widget.onPeakValue
                        textColor: TColors.blue,
                      ),
                      Spacer(),
                      TextView(text: "x", fontSize: 15),
                      Spacer(),
                      TextView(
                        text: (widget.costEstimateDetailModel.fppsRate
                            ?.value ??
                            0.0)
                            .toStringAsFixed(2),
                        // Referencing widget.onPeakRate
                        textColor: TColors.blue,
                      ),
                      Spacer(),
                      TextView(
                          text: ((widget.costEstimateDetailModel.normalFpps?.value ?? 0.0) * (widget.costEstimateDetailModel.fppsRate?.value ?? 0.0)).toStringAsFixed(2),
                          textColor: TColors.blue),
                    ],
                  ),

                  /// Cess
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(text: "Cess"),
                      SizedBox(width: 10.w),
                      const TextView(text: ""),
                    ],
                  ),
                  Row(
                    children: [
                      TextView(
                        text: (widget.costEstimateDetailModel.cess
                            ?.value ??
                            0.0)
                            .toStringAsFixed(2),
                        // Referencing widget.offPeakValue
                        textColor: TColors.blue,
                      ),
                      Spacer(),
                      TextView(text: "x", fontSize: 15),
                      Spacer(),
                      TextView(
                        text: (widget.costEstimateDetailModel.cessRate?.value ?? 0.0).toStringAsFixed(2),
                        // Referencing widget.offPeakRate
                        textColor: TColors.blue,
                      ),
                      Spacer(),
                      TextView(
                          text: ((widget.costEstimateDetailModel.cess?.value ?? 0.0) * (widget.costEstimateDetailModel.cessRate?.value ?? 0.0)).toStringAsFixed(2), textColor: TColors.blue),
                    ],
                  ),

                  /// Grand Total
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(
                        text: "Total :",
                        fontSize: 20,
                        bold: true,
                      ),
                      Spacer(),
                      TextView(
                        text:(((widget.costEstimateDetailModel.normalFpps?.value ?? 0.0) * (widget.costEstimateDetailModel.fppsRate?.value ?? 0.0))+
                            ((widget.costEstimateDetailModel.cess?.value ?? 0.0)*(widget.costEstimateDetailModel.cessRate?.value ?? 0.0))).toStringAsFixed(2),
                        fontSize: 20,
                        bold: true,
                        textColor: TColors.blue,
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