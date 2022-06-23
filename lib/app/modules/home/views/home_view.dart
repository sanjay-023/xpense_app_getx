import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:xpenseappstate/app/modules/add_transaction/views/add_transaction_view.dart';
import 'package:xpenseappstate/app/modules/home/views/widget/balance_card_widget.dart';
import 'package:xpenseappstate/app/modules/home/views/widget/common_widget.dart';

import '../controllers/home_controller.dart';

String profName = '';
// ignore: prefer_typing_uninitialized_variables
var totalData;
DateTime today = DateTime.now();
DateTime now = DateTime.now();
int monthIndex = 1;
String statDropDownValue = 'Income';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final dataController = Get.put(DataController());
    homeController.onInit();
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    statDropDownValue = 'Expense';
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: SizedBox(
        child: ListView(
          children: [
            commonSizedBox(26.0),
            Row(
              children: [
                controller.timecontrol(),
                GetBuilder<HomeController>(
                  builder: (context) {
                    return Text(
                      profName,
                      style: GoogleFonts.signika(
                          textStyle: const TextStyle(fontSize: 22)),
                    );
                  },
                ),
              ],
            ),
            commonSizedBox(20.0),
            GetBuilder<HomeController>(
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        homeController.changeChipIndex(3);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: monthIndex == 3
                                ? const Color.fromARGB(255, 139, 9, 204)
                                : const Color.fromARGB(255, 214, 213, 213)),
                        alignment: Alignment.center,
                        child: Text(
                          months[now.month - 3],
                          style: TextStyle(
                              fontSize: 18,
                              color: monthIndex == 3
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        homeController.changeChipIndex(2);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: monthIndex == 2
                                ? const Color.fromARGB(255, 139, 9, 204)
                                : const Color.fromARGB(255, 214, 213, 213)),
                        alignment: Alignment.center,
                        child: Text(
                          months[now.month - 2],
                          style: TextStyle(
                              fontSize: 18,
                              color: monthIndex == 2
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        homeController.changeChipIndex(1);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.26,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: monthIndex == 1
                                ? const Color.fromARGB(255, 139, 9, 204)
                                : const Color.fromARGB(255, 214, 213, 213)),
                        alignment: Alignment.center,
                        child: Text(
                          months[now.month - 1],
                          style: TextStyle(
                              fontSize: 18,
                              color: monthIndex == 1
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            commonSizedBox(30.0),
            FutureBuilder<List<TransactionModel>>(
                future: dataController.fetch(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('');
                  }
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return InkWell(
                        onTap: () {
                          Get.to(AddTransactionView());
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/no transaction.png'))),
                            ),
                            const Text(
                              'Tap to Add New Transaction',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 124, 124, 124),
                                  fontSize: 18),
                            )
                          ],
                        ),
                      );
                    }
                  }

                  if (snapshot.data == null) {
                    return const Text('');
                  }

                  homeController.getTotalBalance(snapshot.data!);
                  totalData = snapshot.data!;
                  //suggestionList.suggestion(entireData: snapshot.data!);
                  return Column(
                    children: [
                      BalanceCard(
                          totalbal: homeController.totalBalance,
                          totalIncome: homeController.totalIncome,
                          totalExpense: homeController.totalExpense),
                      commonSizedBox(20.0),
                      Row(
                        children: const [
                          Text(
                            'Expense',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      ),
                      commonSizedBox(20.0),
                      // ChartWidget(
                      //   height: 300,
                      //   entiredata: snapshot.data!,
                      // ),
                      commonSizedBox(20.0),
                      Row(
                        children: const [
                          Text(
                            'Recent Transactions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      ),
                      commonSizedBox(20.0),
                      //RecentTransaction(data: snapshot.data!),
                      //HomeRecentWidget(data: snapshot.data!.toList()),
                      commonSizedBox(85.0),
                    ],
                  );
                }),
          ],
        ),
      ),
    )));
  }
}
