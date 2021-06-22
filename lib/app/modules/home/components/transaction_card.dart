import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pxn_mobile/app/modules/login/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  final Function onTap;

  const TransactionCard({
    Key key,
    this.onTap,
    this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        new NumberFormat.currency(locale: "en_US", symbol: "");
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              constraints: BoxConstraints(
                minHeight: 80,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  TransactionTypeIcon(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("${transaction.date.split('T')[0]}"),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade200.withOpacity(0.2),
                      border: Border.all(color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '₦ ${formatCurrency.format(transaction.amount)}',
                      style: TextStyle(
                        color: Colors.green.shade900,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionTypeIcon extends StatelessWidget {
  const TransactionTypeIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blueGrey.shade100.withOpacity(0.6),
              width: 2,
            )),
        child: SvgPicture.asset(
          'assets/images/Income.svg',
          semanticsLabel: "Income",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
