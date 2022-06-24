import 'package:get/get.dart';

class AllTransactionController extends GetxController {
  RxString datFilterValue = 'All'.obs;
  RxString yearFilterValue = 'Jan'.obs;

  RxString dropDownValue = 'All'.obs;

  changeFilterValue(RxString dropDown, String newValue) {
    dropDown.value = newValue;

    update();
  }
}
