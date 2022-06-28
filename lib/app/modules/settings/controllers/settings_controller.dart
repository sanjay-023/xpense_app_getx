import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';
import 'package:xpenseappstate/app/data/controller/notification_service.dart';
import 'package:xpenseappstate/app/modules/settings/controllers/theme_preference.dart';
import 'package:xpenseappstate/app/modules/settings/views/widget/privacy_policy.dart';

class SettingsController extends GetxController {
  //TODO: Implement SettingsController

  // final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    NotificationService().init(initScheduled: true);
    listenNotifiication();
  }

  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    update();
  }

  void changeMode(value) {
    darkTheme = value;
    update();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  TimeOfDay? pickedTime;
  TimeOfDay currentTimme = TimeOfDay.now();
  final messageController = TextEditingController();

  void showResetAlert() {
    final dataController = Get.put(DataController());
    Get.defaultDialog(content: Text("Are you sure want to reset?"), actions: [
      ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel")),
      ElevatedButton(
          onPressed: () {
            dataController.resetData();
          },
          child: Text("Yes"))
    ]);
  }

  void showPrivacyBottomSheet() {
    Get.bottomSheet(PrivacyPolicy());
  }

  openWeb() async {
    // ignore: deprecated_member_use
    if (!await launch("https://sanjay-023.github.io/myweb/intex.html")) {
      throw 'could not launch';
    }
  }

  sendMail() async {
    // ignore: deprecated_member_use
    if (!await launch(
        "mailto:sdsanjay023@gmail.com?subject=Feedback About Xpense App&body=")) {
      throw 'could not launch';
    }
  }

  void setTimer() {
    if (pickedTime != null && pickedTime != currentTimme) {
      NotificationService.showScheduledNotifications(
          title: 'Xpense App',
          body: messageController.text,
          scheduledTime: Time(pickedTime!.hour, pickedTime!.minute, 0));
      update();
    }
  }

  void timeSet(context) async {
    pickedTime =
        await showTimePicker(context: context, initialTime: currentTimme);
  }

  void listenNotifiication() {
    NotificationService.onNotifications.listen((onClickNotification));
  }

  onClickNotification(String? payload) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
    //   return const ScreenDash();
    // }));
  }
}
