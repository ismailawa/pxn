import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pxn_mobile/app/modules/home/components/topup_btn.dart';
import 'package:pxn_mobile/app/modules/login/user_model.dart';
import 'package:pxn_mobile/utils/constants.dart';

class WalletCard extends StatelessWidget {
  final User user;
  final Function topupWallet;

  const WalletCard({Key key, this.topupWallet, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        new NumberFormat.currency(locale: "en_US", symbol: "");
    ;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxHeight: 200,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/cardbg.png'), fit: BoxFit.cover),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user.fullname,
                  style: kHeadlineLabelStyle2,
                ),
                TopupBtn(
                  onTop: topupWallet,
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  user.phone,
                  style: kSubtitleStyle3,
                ),
              ],
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Text(
                  '₦ ${formatCurrency.format(user.wallet.balance)}',
                  style: kLargeTitleStyle2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
