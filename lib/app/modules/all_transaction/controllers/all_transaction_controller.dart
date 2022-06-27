import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';
import 'package:xpenseappstate/app/modules/edit/views/edit_view.dart';

class AllTransactionController extends GetxController {
  RxString datFilterValue = 'All'.obs;
  RxString yearFilterValue = 'Jan'.obs;

  RxString dropDownValue = 'All'.obs;

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

  changeFilterValue(RxString dropDown, String newValue) {
    dropDown.value = newValue;

    update();
  }

  Future deleteAlert(int index) {
    final dataController = Get.put(DataController());
    return Get.defaultDialog(
        content: Text("Do you want to delete?"),
        radius: 10,
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                dataController.deleteData(index);
                Get.back();
                update();
              },
              child: Text('Yes'))
        ]);
  }

  expenseTileWidget(
      int value, String category, DateTime date, String edittype, int index) {
    final dataController = Get.put(DataController());
    final allTransController = Get.put(AllTransactionController());
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            allTransController.deleteAlert(index);
          },
          backgroundColor: const Color.fromARGB(255, 213, 20, 6),
          label: 'Delete',
          icon: Icons.delete,
        ),
        SlidableAction(
          onPressed: (BuildContext context) {
            dataController.updateIndex(index);
            Get.to(EditView());
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
    final dataController = Get.put(DataController());
    final allTransController = Get.put(AllTransactionController());
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            //setState(() {});
            allTransController.deleteAlert(index);
          },
          backgroundColor: const Color.fromARGB(255, 213, 20, 6),
          label: 'Delete',
          icon: Icons.delete,
        ),
        SlidableAction(
          onPressed: (BuildContext context) {
            dataController.updateIndex(index);
            Get.to(EditView());
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
