import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';

import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:xpenseappstate/app/modules/all_transaction/controllers/all_transaction_controller.dart';

//DbHelper dbHelper = DbHelper();
//String dropDownValue = 'All';

// ignore: must_be_immutable
class AllTransWidget extends StatelessWidget {
  AllTransWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataController = Get.put(DataController());
    final data = dataController.transactionDataList;
    final allTransaController = Get.put(AllTransactionController());
    DateTime todayFil = DateTime.now();
    return GetBuilder<AllTransactionController>(builder: (controller) {
      return ListView.builder(
          reverse: true,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: NeverScrollableScrollPhysics()),
          itemCount: data.length,
          itemBuilder: ((controller, index) {
            TransactionModel dataAtIndex;
            try {
              dataAtIndex = data[index];
            } catch (e) {
              return Container();
            }

            final incomeTile = allTransaController.incomeTileWidget(
                dataAtIndex.amount,
                dataAtIndex.category,
                dataAtIndex.date,
                dataAtIndex.type,
                index);
            final expenseTile = allTransaController.expenseTileWidget(
                dataAtIndex.amount,
                dataAtIndex.category,
                dataAtIndex.date,
                dataAtIndex.type,
                index);

            if (allTransaController.dropDownValue.value == 'Income' &&
                dataAtIndex.type == 'Income') {
              if (allTransaController.datFilterValue.value == 'Today') {
                if (dataAtIndex.date.month == todayFil.month &&
                    dataAtIndex.date.day == todayFil.day) {
                  return incomeTile;
                }
              } else if (allTransaController.datFilterValue.value ==
                  'Yesterday') {
                if (dataAtIndex.date.month == todayFil.month &&
                    dataAtIndex.date.day == todayFil.day - 1) {
                  return incomeTile;
                }
              } else if (allTransaController.datFilterValue.value ==
                  'This Month') {
                if (dataAtIndex.date.month == todayFil.month) {
                  return incomeTile;
                }
              } else if (allTransaController.datFilterValue.value == 'All') {
                return incomeTile;
              } else if (allTransaController.datFilterValue.value ==
                  'This Year') {
                if (allTransaController.yearFilterValue.value == 'Jan' &&
                    dataAtIndex.date.month == 1) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Feb' &&
                    dataAtIndex.date.month == 2) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Mar' &&
                    dataAtIndex.date.month == 3) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Apr' &&
                    dataAtIndex.date.month == 4) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'May' &&
                    dataAtIndex.date.month == 5) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Jun' &&
                    dataAtIndex.date.month == 6) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Jul' &&
                    dataAtIndex.date.month == 7) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Aug' &&
                    dataAtIndex.date.month == 8) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Sep' &&
                    dataAtIndex.date.month == 9) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Oct' &&
                    dataAtIndex.date.month == 10) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Nov' &&
                    dataAtIndex.date.month == 11) {
                  return incomeTile;
                } else if (allTransaController.yearFilterValue.value == 'Dec' &&
                    dataAtIndex.date.month == 12) {
                  return incomeTile;
                }
              }
              return Container();
            } else if (allTransaController.dropDownValue.value == 'Expense' &&
                dataAtIndex.type == 'Expense') {
              if (allTransaController.datFilterValue.value == 'All') {
                return expenseTile;
              } else if (allTransaController.datFilterValue.value == 'Today') {
                if (dataAtIndex.date.month == todayFil.month &&
                    dataAtIndex.date.day == todayFil.day) {
                  return expenseTile;
                }
              } else if (allTransaController.datFilterValue.value ==
                  'Yesterday') {
                if (dataAtIndex.date.month == todayFil.month &&
                    dataAtIndex.date.day == todayFil.day - 1) {
                  return expenseTile;
                }
              } else if (allTransaController.datFilterValue.value ==
                  'This Month') {
                if (dataAtIndex.date.month == todayFil.month) {
                  return expenseTile;
                }
              } else if (allTransaController.datFilterValue.value ==
                  'This Year') {
                if (allTransaController.yearFilterValue.value == 'Jan' &&
                    dataAtIndex.date.month == 1) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Feb' &&
                    dataAtIndex.date.month == 2) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Mar' &&
                    dataAtIndex.date.month == 3) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Apr' &&
                    dataAtIndex.date.month == 4) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'May' &&
                    dataAtIndex.date.month == 5) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Jun' &&
                    dataAtIndex.date.month == 6) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Jul' &&
                    dataAtIndex.date.month == 7) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Aug' &&
                    dataAtIndex.date.month == 8) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Sep' &&
                    dataAtIndex.date.month == 9) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Oct' &&
                    dataAtIndex.date.month == 10) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Nov' &&
                    dataAtIndex.date.month == 11) {
                  return expenseTile;
                } else if (allTransaController.yearFilterValue.value == 'Dec' &&
                    dataAtIndex.date.month == 12) {
                  return expenseTile;
                }
              }

              return Container();
            } else {
              if (allTransaController.dropDownValue == "All") {
                if (dataAtIndex.type == "Income") {
                  if (allTransaController.datFilterValue.value == 'All') {
                    return incomeTile;
                  } else if (allTransaController.datFilterValue.value ==
                      'Today') {
                    if (dataAtIndex.date.month == todayFil.month &&
                        dataAtIndex.date.day == todayFil.day) {
                      return incomeTile;
                    }
                  } else if (allTransaController.datFilterValue.value ==
                      'Yesterday') {
                    if (dataAtIndex.date.month == todayFil.month &&
                        dataAtIndex.date.day == todayFil.day - 1) {
                      return incomeTile;
                    }
                  } else if (allTransaController.datFilterValue.value ==
                      'This Month') {
                    if (dataAtIndex.date.month == todayFil.month) {
                      return incomeTile;
                    }
                  } else if (allTransaController.datFilterValue.value ==
                      'This Year') {
                    if (allTransaController.yearFilterValue.value == 'Jan' &&
                        dataAtIndex.date.month == 1) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Feb' &&
                        dataAtIndex.date.month == 2) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Mar' &&
                        dataAtIndex.date.month == 3) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Apr' &&
                        dataAtIndex.date.month == 4) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'May' &&
                        dataAtIndex.date.month == 5) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Jun' &&
                        dataAtIndex.date.month == 6) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Jul' &&
                        dataAtIndex.date.month == 7) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Aug' &&
                        dataAtIndex.date.month == 8) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Sep' &&
                        dataAtIndex.date.month == 9) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Oct' &&
                        dataAtIndex.date.month == 10) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Nov' &&
                        dataAtIndex.date.month == 11) {
                      return incomeTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Dec' &&
                        dataAtIndex.date.month == 12) {
                      return incomeTile;
                    }
                  }
                  return Container();
                } else {
                  if (allTransaController.datFilterValue.value == 'All') {
                    return expenseTile;
                  } else if (allTransaController.datFilterValue.value ==
                      'Today') {
                    if (dataAtIndex.date.month == todayFil.month &&
                        dataAtIndex.date.day == todayFil.day) {
                      return expenseTile;
                    }
                  } else if (allTransaController.datFilterValue.value ==
                      'Yesterday') {
                    if (dataAtIndex.date.month == todayFil.month &&
                        dataAtIndex.date.day == todayFil.day - 1) {
                      return expenseTile;
                    }
                  } else if (allTransaController.datFilterValue.value ==
                      'This Month') {
                    if (dataAtIndex.date.month == todayFil.month) {
                      return expenseTile;
                    }
                  } else if (allTransaController.datFilterValue.value ==
                      'This Year') {
                    if (allTransaController.yearFilterValue.value == 'Jan' &&
                        dataAtIndex.date.month == 1) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Feb' &&
                        dataAtIndex.date.month == 2) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Mar' &&
                        dataAtIndex.date.month == 3) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Apr' &&
                        dataAtIndex.date.month == 4) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'May' &&
                        dataAtIndex.date.month == 5) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Jun' &&
                        dataAtIndex.date.month == 6) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Jul' &&
                        dataAtIndex.date.month == 7) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Aug' &&
                        dataAtIndex.date.month == 8) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Sep' &&
                        dataAtIndex.date.month == 9) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Oct' &&
                        dataAtIndex.date.month == 10) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Nov' &&
                        dataAtIndex.date.month == 11) {
                      return expenseTile;
                    } else if (allTransaController.yearFilterValue.value ==
                            'Dec' &&
                        dataAtIndex.date.month == 12) {
                      return expenseTile;
                    }
                  }
                  return Container();
                }
              } else {
                return Container();
              }
            }
          }));
    });
  }
}
