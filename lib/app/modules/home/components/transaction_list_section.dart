import 'package:flutter/material.dart';
import 'package:pxn_mobile/app/modules/home/components/transaction_card.dart';

class TransactionListSection extends StatelessWidget {
  const TransactionListSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TransactionCard(
            onTap: () {},
          ),
          TransactionCard(
            onTap: () {},
          ),
          TransactionCard(
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
