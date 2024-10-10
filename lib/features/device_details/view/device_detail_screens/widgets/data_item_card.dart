import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/widgets/text/text_view.dart';
import '../../../../../utils/constant/colors.dart';
import '../model/history_filter_model.dart';

class DataItemCard extends StatelessWidget {
  const DataItemCard({
    super.key,
    this.colorContainer = TColors.primary,
    required this.dataItems,
    required this.isSelected,
    required this.onTap,
    // required this.range,
    // required this.deviceId,
  });

  final Color colorContainer;
  final Filters dataItems;
  final bool isSelected;
  final void Function() onTap;
  // final String range, deviceId;

  @override
  Widget build(BuildContext context) {
    //final DeviceDetailController controller = Get.put(DeviceDetailController());
    // void runAPIGraph() {
    //   controller.getDeviceGraphData(dataItems.field, deviceId, range);
    // }

    return InkWell(
      onTap: onTap
        // isSelected ? runAPIGraph() : null;
      ,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? TColors.primaryLight1 : colorContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TextView(
                  text: dataItems.name ?? '',
                  textColor:
                      isSelected ? TColors.secondary : TColors.primaryLight1,
                ),
              ),
              /*TextView(
                text: "0",
                textColor:
                    isSelected ? TColors.secondary : TColors.primaryLight1,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
