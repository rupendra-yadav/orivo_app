import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/constant/image_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: const AssetImage(TImages.imgProfileBg),
              width: MediaQuery.of(context).size.width,
              height: 140.h,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: TColors.primaryLight1,
                  minRadius: 80,
                  maxRadius: 80,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Aditi Agrawal",
                        style: TextStyle(color: TColors.white, fontSize: 24),
                      ),
                    ),
                    Text(
                      "Managing Director",
                      style: TextStyle(color: TColors.secondary, fontSize: 12),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: IconButton(onPressed: () {}, icon: const Icon(Iconsax.edit_2,color: TColors.white,),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
