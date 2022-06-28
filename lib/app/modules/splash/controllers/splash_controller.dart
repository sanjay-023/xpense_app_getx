import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenseappstate/app/modules/home/views/dash_view.dart';
import 'package:xpenseappstate/app/modules/onboarding/views/onboarding_view.dart';
import 'package:xpenseappstate/app/modules/settings/controllers/settings_controller.dart';
import 'package:xpenseappstate/main.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkUserLoggedIn();
    getCurrentAppTheme();
  }

  void gotoonboard() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(OnboardingView());
  }

  void checkUserLoggedIn() async {
    final sharedprfns = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprfns.getString(saveKey);

    if (userLoggedIn == null || userLoggedIn.isEmpty) {
      gotoonboard();
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Get.off(DashView());
    }
  }

  void getCurrentAppTheme() async {
    final settingsController = Get.put(SettingsController());
    settingsController.darkTheme =
        await settingsController.darkThemePreferences.getTheme();
  }
}
