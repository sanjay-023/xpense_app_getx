import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';

import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:xpenseappstate/app/modules/all_transaction/controllers/all_transaction_controller.dart';

//DbHelper dbHelper = DbHelper();
//String dropDownValue = 'All';

// ignore: must_be_immutable
class AllTransWidget extends StatelessWidget {
  List<String> month = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  AllTransWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataController = Get.put(DataController());
    final data = dataController.transactionDataList;
    final allTransaController = Get.put(AllTransactionController());
    DateTime todayFil = DateTime.now();
    return ListView.builder(
        reverse: true,
        shrinkWrap: true,
        physics:
            const BouncingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        itemCount: data.length,
        itemBuilder: ((context, index) {
          TransactionModel dataAtIndex;
          try {
            dataAtIndex = data[index];
          } catch (e) {
            return Container();
          }
          final incomeTile = incomeTileWidget(dataAtIndex.amount,
              dataAtIndex.category, dataAtIndex.date, dataAtIndex.type, index);
          final expenseTile = expenseTileWidget(dataAtIndex.amount,
              dataAtIndex.category, dataAtIndex.date, dataAtIndex.type, index);

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
              return incomeTileWidget(dataAtIndex.amount, dataAtIndex.category,
                  dataAtIndex.date, dataAtIndex.type, index);
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
  }

  expenseTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            //delete(context, index);
            //setState(() {});
          },
          backgroundColor: const Color.fromARGB(255, 213, 20, 6),
          label: 'Delete',
          icon: Icons.delete,
        ),
        SlidableAction(
          onPressed: (BuildContext context) {
            //navigate to edit screen
          },
          backgroundColor: const Color.fromARGB(255, 3, 161, 22),
          label: 'Edit',
          icon: Icons.edit,
        )
      ]),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            // color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 224, 19, 5),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Debit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('${date.day} ${month[date.month - 1]}')
                          ],
                        ),
                        // Text('date')
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "- $value",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(category)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  incomeTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            //delete(context, index);
            //setState(() {});
          },
          backgroundColor: const Color.fromARGB(255, 213, 20, 6),
          label: 'Delete',
          icon: Icons.delete,
        ),
        SlidableAction(
          onPressed: (BuildContext context) {
            //navigate to edit screen
          },
          backgroundColor: const Color.fromARGB(255, 3, 161, 22),
          label: 'Edit',
          icon: Icons.edit,
        )
      ]),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            // color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      backgroundColor: Color.fromARGB(255, 9, 177, 3),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Credit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text('${date.day} ${month[date.month - 1]}')
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "+ $value",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(category)
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
