import 'package:get/get.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:xpenseappstate/app/modules/edit/views/widget/edit_amount.dart';
import 'package:xpenseappstate/app/modules/edit/views/widget/edit_category.dart';
import 'package:xpenseappstate/app/modules/edit/views/widget/edit_date.dart';

class EditController extends GetxController {
  //TODO: Implement EditController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  void dataUpdate() async {
    final dataController = Get.put(DataController());
    final updatedData = TransactionModel(
        amount:
            dataController.transactionDataList[dataController.listIndex].amount,
        date: dataController.transactionDataList[dataController.listIndex].date,
        category: dataController
            .transactionDataList[dataController.listIndex].category,
        type:
            dataController.transactionDataList[dataController.listIndex].type);
    await dataController.updateData(dataController.listIndex, updatedData);
  }

  void dataUpdateto() {
    final dataController = Get.put(DataController());
    final updatedData = TransactionModel(
        amount: editedamount!,
        date: editedDate,
        category: editedCategory,
        type:
            dataController.transactionDataList[dataController.listIndex].type);
    dataController.updateData(dataController.listIndex, updatedData);
  }
}
