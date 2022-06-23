import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_transaction_controller.dart';

class AllTransactionView extends GetView<AllTransactionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AllTransactionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AllTransactionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
