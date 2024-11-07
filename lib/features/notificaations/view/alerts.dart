import 'package:auro/common/widgets/text/text_view.dart';
import 'package:auro/features/notificaations/widgets/alert_card.dart';
import 'package:auro/features/notificaations/widgets/notification_appa_bar.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/notification_card.dart';

class Alerts extends StatelessWidget {
  const Alerts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const NotificationAppBar(title: "Device Alerts",),
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Notification Card
              AlertCard(),
              AlertCard(),
              AlertCard(),
              AlertCard(),
              AlertCard(),
              AlertCard(),
            ],
          ),
        ),
      ),
    );
  }
}


