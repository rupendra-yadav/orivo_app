import 'package:flutter/material.dart';

import '../../../../../utils/constant/colors.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.title,
    required this.mId,
    this.status = "Online",
    required this.power,
    required this.image,
    this.onPressed,
    this.statusColor = TColors.green,
  });

  final String title;
  final String mId;
  final String status;
  final String power;
  final ImageProvider image;
  final void Function()? onPressed;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
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
                Image(
                  image: image,
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(
                        title,
                        style: const TextStyle(
                            color: TColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700),
                      ),

                      /// model code
                      Row(
                        children: [
                          const Text(
                            "MID : ",
                            style: TextStyle(color: TColors.warningDark1),
                          ),
                          Text(
                            mId,
                            style: const TextStyle(color: TColors.warningDark1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      ///status
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: statusColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Text(
                                status,
                                style: const TextStyle(
                                    color: TColors.white, fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: TColors.ochre,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2),
                              child: Text(
                                power,
                                style: const TextStyle(
                                    color: TColors.white, fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
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
