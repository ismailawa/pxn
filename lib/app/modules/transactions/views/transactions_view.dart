import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.3),
      body: Center(
        child: Text(
          'TransactionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
