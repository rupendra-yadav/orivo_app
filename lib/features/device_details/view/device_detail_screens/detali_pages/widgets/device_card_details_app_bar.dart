import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../utils/constant/colors.dart';
import '../../../../../../utils/constant/sizes.dart';

class DeviceCardDetailsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DeviceCardDetailsAppBar({
    super.key,
    required this.title,
    this.colorAppBar = TColors.primary,
    this.colorTitleContainer = TColors.primary,
    this.colorText = TColors.white,
    this.colorNotification = TColors.white,
    this.colorBackArrow = TColors.secondary,
    this.sizeTitleSpacing = 0,
    this.sizeBackArrow = 30,
    this.sizeTitle = 22,
    this.sizeNotificationIcon = 25,
  });

  final String title;
  final Color colorAppBar,
      colorTitleContainer,
      colorText,
      colorNotification,
      colorBackArrow;

  final double sizeTitleSpacing,
      sizeBackArrow,
      sizeTitle,
      sizeNotificationIcon;

  @override
  _DeviceCardDetailsAppBarState createState() => _DeviceCardDetailsAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(TSizes.appBarHeight);
}

class _DeviceCardDetailsAppBarState extends State<DeviceCardDetailsAppBar> {
  List<DateTime?> _dates = [];

  void _showCalendarPicker() async {
    final selectedDates = await showDialog<List<DateTime?>>(
      context: context,
      builder: (context) {
        return Dialog(
          child: CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
              selectedDayTextStyle: TextStyle(color: Colors.white),
              dayTextStyle: TextStyle(color: Colors.black),
              // Customize other properties as needed
            ),
            value: _dates,
            onValueChanged: (dates) {
              setState(() {
                _dates = dates;
              });
            },
          ),
        );
      },
    );

    if (selectedDates != null) {
      setState(() {
        _dates = selectedDates;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.colorAppBar,
      titleSpacing: widget.sizeTitleSpacing,
      elevation: 5.h,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Iconsax.arrow_left,
          color: widget.colorBackArrow,
          size: widget.sizeBackArrow,
        ),
      ),
      title: Container(
        height: TSizes.appBarHeight,
        color: widget.colorTitleContainer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                widget.title,
                style: TextStyle(color: widget.colorText, fontSize: widget.sizeTitle),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _showCalendarPicker,
                  icon: Icon(
                    Iconsax.calendar_2,
                    color: widget.colorNotification,
                    size: widget.sizeNotificationIcon,
                  ),
                ),
               /* if (_dates.length == 2 && _dates[0] != null && _dates[1] != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Selected: ${_dates[0]?.toLocal().toString().split(' ')[0]} - ${_dates[1]?.toLocal().toString().split(' ')[0]}',
                      style: TextStyle(color: widget.colorText, fontSize: widget.sizeTitle * 0.8),
                    ),
                  ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
