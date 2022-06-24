import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xpenseappstate/app/modules/home/controllers/home_controller.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    homeController.onInit();
    final controller = Get.put(SplashController());
    controller.onInit();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 139, 9, 204),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/xpenselogo.png',
              width: 280,
              height: 280,
            )
          ],
        ),
      ),
    );
  }
}
