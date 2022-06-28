import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenseappstate/app/modules/settings/controllers/settings_controller.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return GetBuilder<SettingsController>(builder: (controller) {
      return Switch.adaptive(
          activeColor: const Color.fromARGB(255, 139, 9, 204),
          value: settingsController.darkTheme,
          onChanged: (value) {
            settingsController.changeMode(value);
          });
    });
  }
}
