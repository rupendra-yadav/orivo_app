import 'package:auro/features/navigation/view/bottom_nav_screen/model/device_list_model.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constant/colors.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    this.onPressed,
    required this.deviceListModel,
    this.statusColor = TColors.green,
    this.isNetworkImage = false,
  });

  // final String title;
  // final String mId;
  // final String status;
  // final String power;
  // final ImageProvider image;
  final bool isNetworkImage;
  final void Function()? onPressed;
  final Color statusColor;
  final DeviceListModel deviceListModel;

  String extractDriveFileId(String url) {
    RegExp regExp = RegExp(r"\/d\/(.*?)(\/|$)");
    Match? match = regExp.firstMatch(url);
    return match != null ? match.group(1)! : "";
  }

  @override
  Widget build(BuildContext context) {

    String? googleDriveImageUrl;

    if (kDebugMode) {
      print("FileId--> ${extractDriveFileId(deviceListModel.imagePath)}");
    }
    googleDriveImageUrl = 'https://drive.usercontent.google.com/download?id=${extractDriveFileId(deviceListModel.imagePath)}&export=view';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: onPressed,
        child: Material(
          color: TColors.primaryDark2,
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child:  CachedNetworkImage(
                    // imageUrl:"https://drive.usercontent.google.com/download?id=1V2Lkj2hPA3KQEGxxJveIDGmQKJqApIbW&export=view", // Provide a fallback empty string if null or empty
                    imageUrl:googleDriveImageUrl??"", // Provide a fallback empty string if null or empty
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) {
                      // Check gender and provide appropriate default image
                      return Image.asset(
                        TImages.imgDevice,
                        width: 100.w,
                        height: 100.h,
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        Text(
                          deviceListModel.name,
                          style: const TextStyle(
                              color: TColors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w700),
                        ),

                        /// model code
                        Row(
                          children: [
                            const Text(
                              "MID : ",
                              style: TextStyle(color: TColors.warningDark1),
                            ),
                            Expanded(
                              child: Text(
                                deviceListModel.publicDeviceId,
                                style: const TextStyle(color: TColors.warningDark1),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        ///status
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: deviceListModel.status=="Active"?statusColor:TColors.error,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2),
                                child: Text(
                                  deviceListModel.status,
                                  style: const TextStyle(
                                      color: TColors.white, fontSize: 12),
                                ),
                              ),
                            ),
                            // const SizedBox(width: 10),
                            /*Container(
                              decoration: BoxDecoration(
                                  color: TColors.ochre,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2),
                                child: Text(
                                  deviceListModel.installationDate,
                                  style: const TextStyle(
                                      color: TColors.white, fontSize: 12),
                                ),
                              ),
                            )*/
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
