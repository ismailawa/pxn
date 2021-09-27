import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/services_header.dart';

import '../controllers/transfers_controller.dart';

class TransfersView extends GetView<TransfersController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.blue.shade100.withOpacity(0.3),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ServicesHeader(
                      title: '',
                      child: IconButton(
                          icon: Icon(Icons.more_vert), onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        "Transfers",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 10,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TransferOptionCard(
                            icon: Icons.wallet_travel,
                            title: "Fund Wallet",
                            color: Colors.amber[100],
                            fontColor: Colors.amber,
                          ),
                          TransferOptionCard(
                            icon: Icons.card_giftcard,
                            title: "Wallet to Wallet",
                            color: Colors.red[100],
                            fontColor: Colors.red,
                            onPressed: () =>
                                controller.walletToWalletTransfer(),
                          ),
                          TransferOptionCard(
                            icon: Icons.wallet_membership,
                            title: "Wallet to bank",
                            color: Colors.green[100],
                            fontColor: Colors.green,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class TransferOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final Color fontColor;
  final Function onPressed;

  const TransferOptionCard({
    Key key,
    this.icon,
    this.title,
    this.color,
    this.fontColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 120,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Ink(
          child: InkWell(
            onTap: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: fontColor,
                  size: 45,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
