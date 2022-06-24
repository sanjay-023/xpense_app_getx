import 'package:hive_flutter/hive_flutter.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String type;

  TransactionModel(
      {required this.amount,
      required this.date,
      required this.category,
      required this.type});
}
