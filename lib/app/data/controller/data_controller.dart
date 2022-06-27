import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';

class DataController extends GetxController {
  RxList<TransactionModel> transactionDataList = <TransactionModel>[].obs;
  int listIndex = 0;
  // Future adddata(
  //     int? amount, DateTime date, String category, String type) async {
  //   final box = Hive.box('money');
  //   var value = {
  //     "amount": amount,
  //     "date": date,
  //     "category": category,
  //     "type": type
  //   };
  //   box.add(value);

  void addData(TransactionModel value) async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDb.add(value);
    transactionDataList.add(value);
    print(transactionDb);
  }

  void updateIndex(int index) {
    listIndex = index;
    update();
  }

  void getAllData() async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDataList.clear();
    transactionDataList.addAll(transactionDb.values);
    update();
  }

  deleteData(index) async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDb.deleteAt(index);
    getAllData();
  }

  updateData(int index, TransactionModel value) async {
    final transactionDb =
        await Hive.openBox<TransactionModel>('transaction_db');
    transactionDb.putAt(index, value);
    getAllData();
  }
}

  // Future<List<TransactionModel>> fetch() async {
  //   final box = Hive.box('money');
  //   if (box.values.isEmpty) {
  //     return Future.value(<TransactionModel>[].obs);
  //   } else {
  //     List<TransactionModel> items = [];
  //     box.toMap().values.forEach((element) {
  //       //print(element);
  //       items.add(TransactionModel(element['amount'] as int,
  //           element['date'] as DateTime, element['category'], element['type']));
  //       //print(element);
  //     });
  //     return items;
  //   }
  // }

