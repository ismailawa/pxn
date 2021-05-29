import 'package:flutter/material.dart';
import 'package:pxn_mobile/app/modules/home/components/transaction_card.dart';
import 'package:pxn_mobile/app/modules/home/controllers/home_controller.dart';

class TransactionListSection extends StatelessWidget {
  final HomeController controller;
  const TransactionListSection({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(
          3,
          (index) => TransactionCard(
            onTap: () {
              controller.showTransactionDetails();
            },
          ),
        ),
      ),
    );
  }
}
