import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constant/colors.dart';

class DropDownCard extends StatefulWidget {
  const DropDownCard(
      {super.key,
      required this.cardTitle,
      required this.field1,
      required this.field2,
      required this.field3,
      required this.field4,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.value4});

  final String cardTitle,
      field1,
      field2,
      field3,
      field4,
      value1,
      value2,
      value3,
      value4;

  @override
  _DropDownCardState createState() => _DropDownCardState();
}

class _DropDownCardState extends State<DropDownCard> {
  bool _isDetailVisible = false; // To control the visibility of the details

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.primaryDark1,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            /// Main card header
            Row(
              children: [
                Text(
                  widget.cardTitle,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (_isDetailVisible)
                  const Icon(Icons.info_outline, color: Colors.white),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isDetailVisible = !_isDetailVisible;
                    });
                  },
                  icon: Icon(
                    _isDetailVisible
                        ? Iconsax.arrow_down_1
                        : Iconsax.arrow_right_3,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            /// Details - Only visible if _isDetailVisible is true
            if (_isDetailVisible)
              Card(
                color: TColors.primaryDark3,
                elevation: 5.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Column(
                    children: [
                      _buildInfoRow(widget.field1, widget.value1),
                      _buildInfoRow(widget.field2, widget.value2),
                      _buildInfoRow(widget.field3, widget.value3),
                      _buildInfoRow(widget.field4, widget.value4),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Method to build each row in the details card
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            ":",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white70,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
