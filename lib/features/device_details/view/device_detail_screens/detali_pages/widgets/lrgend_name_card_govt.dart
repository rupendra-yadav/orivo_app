import 'package:auro/features/device_details/view/device_detail_screens/model/cost_estimate_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/text/text_view.dart';
import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/text_strings.dart';
import '../../../../../../utils/helpers/number_formaters.dart';
import '../../model/cost_estimate_detail_model.dart';

class LegendNameCardGovt extends StatefulWidget {
  const LegendNameCardGovt({
    super.key,
    required this.governmentCosts,
    required this.color,
  });

  final GovernmentCosts governmentCosts;
  final Color color;

  @override
  _LegendNameCardGovtState createState() => _LegendNameCardGovtState();
}

class _LegendNameCardGovtState extends State<LegendNameCardGovt> {
  bool _isDetailVisible = false;

  infoDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // Prevents closing the dialog by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: TColors.primaryDark1,
          insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: TextView(
                  text: TTexts.govtTariffScheme,
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                )),

                SizedBox(
                  height: 15.h,
                ),

                TextView(
                  text: TTexts.govtCost,
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextView(
                  text: "1. ${TTexts.normalFPPAS}",
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: TextView(
                    text: TTexts.tODOfRate,
                    textColor: TColors.white,
                    fontSize: 18,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextView(
                  text: "2. ${TTexts.electricityDuty}",
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: TextView(
                    text: TTexts.tariff4,
                    textColor: TColors.white,
                    fontSize: 18,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextView(
                  text: '3. ${TTexts.cess}',
                  textColor: TColors.white,
                  fontSize: 18,
                  bold: true,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: TextView(
                    text: TTexts.tariff7,
                    textColor: TColors.white,
                    fontSize: 18,
                    bold: true,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                /// Close OK
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: TextView(
                      text: TTexts.dialogOk,
                      textColor: TColors.white,
                      fontSize: 18,
                      bold: true,
                    ),
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
    final governmentCosts = widget.governmentCosts;
    final govtTotal =
        (double.parse(governmentCosts.fppas?.baseAmount?.value ?? "0.0") *
            double.parse(governmentCosts.fppas?.rate?.value ?? "0.0"));
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
                const TextView(
                  text: "Govt : ",
                  fontSize: 20,
                  bold: true,
                ),
                TextView(
                  text: NumberFormater().numberComma(
                      number:
                          double.parse(governmentCosts.total?.value ?? "0.0")),
                  // Referencing widget.titleValue
                  fontSize: 20,
                  textColor: widget.color,
                ),
                const TextView(text: " Rs", fontSize: 20),
                const Spacer(),
                InkWell(
                  onTap: () {
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
                  /// Normal FPPAS
                  Row(
                    children: [
                      const TextView(text: "Normal FPPAS", fontSize: 12),
                      SizedBox(width: 10.w),
                      const TextView(text: ""),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(
                                number: double.parse(
                                    governmentCosts.fppas?.baseAmount?.value ??
                                        "0.0")),
                            // Referencing widget.onPeakValue
                            textColor: widget.color,
                          ),
                        ),
                      ),
                      //Expanded(child: TextView(text: "x", fontSize: 15)),
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(
                                number: double.parse(
                                    governmentCosts.fppas?.rate?.value ??
                                        "0.0")),
                            // Referencing widget.onPeakRate
                            textColor: widget.color,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: TextView(
                              text: NumberFormater()
                                  .numberComma(number: govtTotal),
                              textColor: TColors.blue),
                        ),
                      ),
                    ],
                  ),

                  /// Cess
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(text: "Cess", fontSize: 12),
                      SizedBox(width: 10.w),
                      const TextView(text: ""),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(
                                number: double.parse(
                                    governmentCosts.cess?.baseAmount?.value ??
                                        "0.0")),
                            textColor: widget.color,
                          ),
                        ),
                      ),

                      //Expanded(child: TextView(text: "x", fontSize: 15)),

                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(
                                number: double.parse(
                                    governmentCosts.cess?.rate?.value ??
                                        "0.0")),
                            // Referencing widget.offPeakRate
                            textColor: widget.color,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: TextView(
                              text: NumberFormater().numberComma(
                                  number: ((double.parse(governmentCosts
                                              .cess?.baseAmount?.value ??
                                          "0.0")) *
                                      (double.parse(
                                          governmentCosts.cess?.rate?.value ??
                                              "0.0")))),
                              textColor: TColors.blue),
                        ),
                      ),
                    ],
                  ),

                  /// Duty Rate
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      const TextView(text: "Duty", fontSize: 12),
                      SizedBox(width: 10.w),
                      const TextView(text: ""),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(
                                number: double.parse(widget.governmentCosts
                                        .electricityDuty?.amount?.value ??
                                    "0.0")),
                            // Referencing widget.offPeakValue
                            textColor: widget.color,
                          ),
                        ),
                      ),

                      //Expanded(child: TextView(text: "x", fontSize: 15)),

                      Expanded(
                        child: Center(
                          child: TextView(
                            text: NumberFormater().numberComma(
                                number: double.parse(widget.governmentCosts
                                        .electricityDuty?.rate?.value ??
                                    "0.0")),
                            // Referencing widget.offPeakRate
                            textColor: widget.color,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: TextView(
                              text: NumberFormater().numberComma(
                                  number: (double.parse(widget.governmentCosts
                                              .electricityDuty?.amount?.value ??
                                          "0.0")) *
                                      (double.parse(widget.governmentCosts
                                              .electricityDuty?.rate?.value ??
                                          "0.0"))),
                              textColor: TColors.blue),
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
                      SizedBox(
                        width: 50.w,
                      ),
                      TextView(
                        text: NumberFormater().numberComma(
                            number: double.parse(
                                governmentCosts.total?.value ?? "0.0")),

                        /*NumberFormater().numberComma(number:(((widget.governmentCosts.normalFpps?.value ?? 0.0) * (widget.governmentCosts.fppsRate?.value ?? 0.0))+
                            ((widget.governmentCosts.cess?.value ?? 0.0)*(widget.governmentCosts.cessRate?.value ?? 0.0))))*/
                        fontSize: 20,
                        bold: true,
                        textColor: widget.color,
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
