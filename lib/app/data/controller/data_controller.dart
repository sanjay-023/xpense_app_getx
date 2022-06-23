import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';

class DataController extends GetxController {
  Future adddata(
      int? amount, DateTime date, String category, String type) async {
    final box = Hive.box('money');
    var value = {
      "amount": amount,
      "date": date,
      "category": category,
      "type": type
    };
    box.add(value);
  }

  Future<List<TransactionModel>> fetch() async {
    final box = Hive.box('money');
    if (box.values.isEmpty) {
      return Future.value(<TransactionModel>[].obs);
    } else {
      List<TransactionModel> items = [];
      box.toMap().values.forEach((element) {
        //print(element);
        items.add(TransactionModel(element['amount'] as int,
            element['date'] as DateTime, element['category'], element['type']));
        //print(element);
      });
      return items;
    }
  }
}
