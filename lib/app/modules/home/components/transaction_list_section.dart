import 'package:flutter/material.dart';
import 'package:pxn_mobile/app/modules/home/components/transaction_card.dart';
import 'package:pxn_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:pxn_mobile/app/modules/login/transaction_model.dart';

class TransactionListSection extends StatelessWidget {
  final List<TransactionModel> transactions;
  final HomeController controller;
  const TransactionListSection({
    Key key,
    this.controller,
    this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(
          transactions.length,
          (index) => TransactionCard(
            transaction: transactions[index],
            onTap: () {
              controller.showTransactionDetails();
            },
          ),
        ),
      ),
    );
  }
}
