import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
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


  infoDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: TColors.primaryDark1,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: TextView(text: TTexts.govtTariffScheme, textColor: TColors.white, fontSize: 20, bold: true,)),

                SizedBox(height: 15.h,),

                TextView(text: TTexts.energyCost, textColor: TColors.white, fontSize: 18, bold: true,),
                SizedBox(height: 15.h,),
                TextView(text: "1. ${TTexts.normalSlot}", textColor: TColors.white, fontSize: 18, bold: true,),
                SizedBox(height: 5.h,),
                Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.normalPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                SizedBox(height: 15.h,),
                TextView(text: "2. ${TTexts.offPeakSlot}", textColor: TColors.white, fontSize: 18, bold: true,),
                SizedBox(height: 5.h,),
                Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.offPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                SizedBox(height: 15.h,),
                TextView(text: '3. ${TTexts.onPeakSlot}', textColor: TColors.white, fontSize: 18, bold: true,),
                SizedBox(height: 5.h,),
                Padding(padding:  EdgeInsets.only(left: 15.w), child: TextView(text: TTexts.onPeakSlotDesc, textColor: TColors.white, fontSize: 18, bold: true,),),
                SizedBox(height: 20.h,),


                /// Close OK
                Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: TextView(text: TTexts.dialogOk, textColor: TColors.white, fontSize: 18, bold: true,),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                TextView(text: NumberFormater().numberComma(number:(  widget.costEstimateDetailModel.totalEnergyCost?.value ?? 0.0),),
                  fontSize: 20,
                  textColor: widget.colo,
                ),
                const TextView(text: " Rs", fontSize: 20),
                const Spacer(),
                InkWell(
                  onTap: (){
                    infoDialog(context);
                  },
                  child: Icon(
                    Icons.info_outline,
                    color: TColors.white,
                  ),
                ),
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
