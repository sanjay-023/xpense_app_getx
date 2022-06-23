import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenseappstate/app/modules/home/views/dash_view.dart';
import 'package:xpenseappstate/main.dart';

class ProfileController extends GetxController {
  void checkLogin(textcontroller) async {
    final profilename = textcontroller.text;
    final sharedprfns = await SharedPreferences.getInstance();
    if (profilename.isNotEmpty) {
      await sharedprfns.setString(saveKey, profilename);

      Get.off(DashView());
    } else {
      Get.snackbar("Please enter a name", "");
    }
  }
}
