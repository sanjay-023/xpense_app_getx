import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';
import 'package:xpenseappstate/app/data/model/transaction_model.dart';
import 'package:xpenseappstate/app/modules/add_transaction/views/widget/amount_widget.dart';
import 'package:xpenseappstate/app/modules/add_transaction/views/widget/category_widget.dart';
import 'package:xpenseappstate/app/modules/add_transaction/views/widget/datepick_widget.dart';
import 'package:xpenseappstate/app/modules/add_transaction/views/widget/transtype_widget.dart';
import 'package:xpenseappstate/app/modules/home/views/dash_view.dart';
import 'package:xpenseappstate/app/modules/home/views/widget/common_widget.dart';

import '../controllers/add_transaction_controller.dart';

class AddTransactionView extends GetView<AddTransactionController> {
  final amountcontroller = TextEditingController();

  final categorycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dataController = Get.put(DataController());
    final addTransactionController = Get.put(AddTransactionController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).secondaryHeaderColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    commonSizedBox(40.0),
                    Text(
                      'Add Transaction',
                      style: GoogleFonts.signika(
                          textStyle: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600)),
                    ),
                    commonSizedBox(30.0),
                    const AmountWidget(),
                    commonSizedBox(20.0),
                    const CategoryWidget(),
                    commonSizedBox(20.0),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TransType()),
                    commonSizedBox(20.0),
                    const Datepick(),
                    commonSizedBox(20.0),
                    ElevatedButton(
                        onPressed: () async {
                          if (amount == 0 || category.isEmpty) {
                            addTransactionController.showError();
                          } else {
                            final transaction = TransactionModel(
                                amount: amount!,
                                date: selectedDate,
                                category: category,
                                type: type);

                            dataController.addData(transaction);

                            Get.offAll(DashView());
                            amount = 0;
                            category = '';
                          }
                        },
                        child: const Text('Add'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 139, 9, 204),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(150, 40)))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
