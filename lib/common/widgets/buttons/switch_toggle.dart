import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../features/navigation/view/bottom_nav_screen/controller/profile_detail_cotroller.dart';
import '../../../utils/constant/colors.dart';

class SwitchToggle extends StatefulWidget {
  final int type, activeStatus;
  const SwitchToggle(
      {super.key, required this.type, required this.activeStatus});

  @override
  State<SwitchToggle> createState() => _SwitchToggleState();
}

class _SwitchToggleState extends State<SwitchToggle> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    final WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        // Track color when the switch is selected.
        if (states.contains(WidgetState.selected)) {
          return TColors.secondary;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );

    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        // Material color when switch is selected.
        if (states.contains(WidgetState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey.shade400;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );

    final userController = Get.put(ProfileDetailController());
    if (widget.activeStatus == 1) {
      light = true;
    } else {
      light = false;
    }

    return Switch(
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: const WidgetStatePropertyAll<Color>(TColors.primary),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;

          // userController.updatePhoneStatus(widget.type,light?1:0);
        });
      },
    );
  }
}
