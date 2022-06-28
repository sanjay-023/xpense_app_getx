import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:xpenseappstate/app/modules/settings/controllers/settings_controller.dart';
import 'package:xpenseappstate/app/modules/settings/controllers/theme_data.dart';

import 'app/routes/app_pages.dart';

const saveKey = 'profile name';
const themeKey = "themekey";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  //final appdocumentdir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  //await Hive.openBox('money');
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  final settingsController = Get.put(SettingsController());
  runApp(
    GetBuilder<SettingsController>(builder: (controller) {
      return GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(settingsController.darkTheme),
      );
    }),
  );
}
