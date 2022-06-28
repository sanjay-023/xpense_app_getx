import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xpenseappstate/app/modules/home/views/widget/common_widget.dart';
import 'package:xpenseappstate/app/modules/settings/views/widget/notification_widget.dart';
import 'package:xpenseappstate/app/modules/settings/views/widget/setting_widget.dart';
import 'package:xpenseappstate/app/modules/settings/views/widget/theme_change_button.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              // Navigator.of(context)
              //     .pushReplacement(MaterialPageRoute(builder: (ctx) {
              //   return const ScreenDash();
              // }));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 19,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).secondaryHeaderColor,
          title: const Text(
            'Settings',
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              commonSizedBox(10.0),
              // const NotificationWidget(),
              NotificationWidget(),
              SettingWidget(
                stext: 'Dark Mode',
                sicon: Icons.dark_mode_outlined,
                trail: ThemeChangeButton(),
              ),
              GestureDetector(
                  onTap: () {
                    // resetPop(context);
                    settingsController.showResetAlert();
                  },
                  child: SettingWidget(
                      stext: 'Reset Data', sicon: Icons.restart_alt)),
              InkWell(
                onTap: () {
                  settingsController.showPrivacyBottomSheet();
                },
                child: SettingWidget(
                    stext: 'Privacy Policy', sicon: Icons.privacy_tip_outlined),
              ),
              SettingWidget(stext: 'Share', sicon: Icons.share_outlined),
              SettingWidget(
                  stext: 'Rate This App', sicon: Icons.star_border_outlined),
              InkWell(
                  onTap: () {
                    settingsController.sendMail();
                  },
                  child: SettingWidget(
                      stext: 'Feedback', sicon: Icons.feedback_outlined)),
              GestureDetector(
                  onTap: () {
                    settingsController.openWeb();
                  },
                  child: SettingWidget(stext: 'About Us', sicon: Icons.warning))
            ],
          ),
        )));
  }
}
