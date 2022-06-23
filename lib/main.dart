import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/routes/app_pages.dart';

const saveKey = 'profile name';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //tz.initializeTimeZones();

  //final appdocumentdir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  await Hive.openBox('money');
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
