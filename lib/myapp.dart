import 'package:auro/features/authentication/view/splash.dart';
import 'package:auro/utils/constant/text_strings.dart';
import 'package:auro/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'features/device_details/view/device_detail_screens/detali_pages/cost_estimate_detail.dart';
import 'features/device_details/view/device_detail_screens/detali_pages/demand_estimate_detail.dart';
import 'features/device_details/view/device_detail_screens/detali_pages/energy_consumption_detail.dart';
import 'features/device_details/view/device_detail_screens/detali_pages/power_quality_detail.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        routes: {

          '/costEstimateDetail': (context) => CostEstimate(isNotify: true,),
          '/demandDetail': (context) => DemandEstimateDetail(isNotify: true,),
          '/consumptionDetail': (context) => EnergyConsumptionDetail(isNotify: true,),
          '/powerDetail': (context) => PowerQualityDetail(isNotify: true,),
        },
        title: TTexts.appName,
        themeMode: ThemeMode.light,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: true,
        home: const Splash(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
