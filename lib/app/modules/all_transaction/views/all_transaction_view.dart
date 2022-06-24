import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';
import 'package:xpenseappstate/app/modules/all_transaction/views/widget/all_trans_widget.dart';
import 'package:xpenseappstate/app/modules/home/views/dash_view.dart';
import 'package:xpenseappstate/app/modules/home/views/widget/common_widget.dart';

import '../controllers/all_transaction_controller.dart';

class AllTransactionView extends GetView<AllTransactionController> {
  final items = <String>['All', 'Income', 'Expense'];
  final itemsDatFilter = <String>[
    'All',
    'Today',
    'Yesterday',
    'This Month',
    'This Year'
  ];

  final itemsYearFilter = <String>[
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
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    final dataController = DataController();
    final allTransactionController = Get.put(AllTransactionController());
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(DashView());
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.offAll(DashView());
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            title: const Text(
              'All Transactions',
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Theme.of(context).secondaryHeaderColor,
          ),
          body: GetBuilder<AllTransactionController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SizedBox(
                child: ListView(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // FIRST DROPDOWN
                          Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 139, 9, 204),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: DropdownButton<String>(
                                  iconEnabledColor: Colors.white,
                                  dropdownColor:
                                      const Color.fromARGB(255, 139, 9, 204),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  underline: const Text(''),
                                  borderRadius: BorderRadius.circular(10),
                                  items: items.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  value: allTransactionController
                                      .dropDownValue.value
                                      .toString(),
                                  onChanged: (String? newValue) {
                                    allTransactionController.changeFilterValue(
                                        allTransactionController.dropDownValue,
                                        newValue!);
                                  }),
                            ),
                          ),

                          //SECOND DROPDOWN
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 139, 9, 204),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: DropdownButton<String>(
                                  iconEnabledColor: Colors.white,
                                  dropdownColor:
                                      const Color.fromARGB(255, 139, 9, 204),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  underline: const Text(''),
                                  borderRadius: BorderRadius.circular(10),
                                  items: itemsDatFilter
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  value: allTransactionController
                                      .datFilterValue.value
                                      .toString(),
                                  onChanged: (String? newValue) {
                                    allTransactionController.changeFilterValue(
                                        allTransactionController.datFilterValue,
                                        newValue!);
                                  }),
                            ),
                          ),

                          //YEAR FILTER DROPDOWN

                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.26,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: allTransactionController
                                            .datFilterValue.value
                                            .toString() ==
                                        'This Year'
                                    ? const Color.fromARGB(255, 139, 9, 204)
                                    : const Color.fromARGB(255, 198, 196, 196),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: DropdownButton<String>(
                                  disabledHint: const Text('Month'),
                                  menuMaxHeight: 200,
                                  iconEnabledColor: Colors.white,
                                  dropdownColor:
                                      const Color.fromARGB(255, 139, 9, 204),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  underline: const Text(''),
                                  borderRadius: BorderRadius.circular(10),
                                  items: allTransactionController
                                              .datFilterValue.value
                                              .toString() ==
                                          'This Year'
                                      ? itemsYearFilter
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                          return DropdownMenuItem<String>(
                                              value: value, child: Text(value));
                                        }).toList()
                                      : null,
                                  value: allTransactionController
                                      .yearFilterValue.value
                                      .toString(),
                                  onChanged: (String? newValue) {
                                    allTransactionController.changeFilterValue(
                                        allTransactionController
                                            .yearFilterValue,
                                        newValue!);
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    commonSizedBox(20.0),
                    Column(
                      children: [AllTransWidget(), commonSizedBox(90.0)],
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
