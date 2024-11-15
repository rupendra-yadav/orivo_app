import 'package:auro/features/notificaations/widgets/notification_appa_bar.dart';
import 'package:auro/utils/constant/colors.dart';
import 'package:auro/utils/styles/spacing_style.dart';
import 'package:flutter/material.dart';

import '../widgets/notification_card.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {

    //final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    //TLoaders.successSnackBar(title: message.notification!.title.toString(), message: message.notification!.body.toString());

    return Scaffold(
      backgroundColor: TColors.primary,
      appBar: const NotificationAppBar(),
      body: Padding(
        padding: SpacingStyle.paddingWithDefaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Notification Card
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
              NotificationCard(),
            ],
          ),
        ),
      ),
    );
  }
}


