import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpenseappstate/app/data/controller/data_controller.dart';
import 'package:xpenseappstate/app/modules/all_transaction/views/all_transaction_view.dart';
import 'package:xpenseappstate/app/modules/edit/views/widget/edit_amount.dart';
import 'package:xpenseappstate/app/modules/edit/views/widget/edit_category.dart';
import 'package:xpenseappstate/app/modules/edit/views/widget/edit_date.dart';
import 'package:xpenseappstate/app/modules/home/views/widget/common_widget.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  @override
  Widget build(BuildContext context) {
    final editController = Get.put(EditController());
    final dataController = Get.put(DataController());
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
                      'Edit Transaction',
                      style: GoogleFonts.signika(
                          textStyle: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600)),
                    ),
                    commonSizedBox(30.0),
                    EditAmountWidget(
                        editAmount: dataController
                            .transactionDataList[dataController.listIndex]
                            .amount),
                    commonSizedBox(20.0),
                    EditCategoryWidget(
                        editCategory: dataController
                            .transactionDataList[dataController.listIndex]
                            .category),
                    commonSizedBox(20.0),
                    EditDatepick(
                        editdate: dataController
                            .transactionDataList[dataController.listIndex]
                            .date),
                    commonSizedBox(20.0),
                    ElevatedButton(
                        onPressed: () {
                          if (editedCategory.isEmpty || editedamount == 0) {
                            editedCategory = dataController
                                .transactionDataList[dataController.listIndex]
                                .category;
                            editedamount = dataController
                                .transactionDataList[dataController.listIndex]
                                .amount;
                            editController.dataUpdate();

                            Get.off(AllTransactionView());
                            dataController.getAllData();
                          } else {
                            editController.dataUpdateto();
                            Get.off(AllTransactionView());

                            editedamount = 0;
                            editedCategory = '';
                          }
                        },
                        child: const Text('Save'),
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
