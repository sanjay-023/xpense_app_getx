import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenseappstate/app/modules/settings/controllers/settings_controller.dart';
import 'package:xpenseappstate/app/modules/settings/views/widget/re_bottom_sheet.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return InkWell(
      onTap: () {
        Get.bottomSheet(ReminderBottomSheet());
      },
      child: ListTile(
          leading: Icon(
            Icons.notifications_none_rounded,
            color: Theme.of(context).secondaryHeaderColor,
            size: 24,
          ),
          title: const Text(
            'Reminder',
            style: TextStyle(fontSize: 22),
          ),
          trailing: const Icon(Icons.arrow_forward_ios)),
    );
  }
}
