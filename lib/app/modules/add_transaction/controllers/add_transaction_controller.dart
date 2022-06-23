import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  void showError() {
    Get.snackbar("Not all data provided", "");
  }
}
