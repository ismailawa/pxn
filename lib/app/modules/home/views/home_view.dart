import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/sections_header.dart';
import 'package:pxn_mobile/app/modules/home/components/services_list_section.dart';
import 'package:pxn_mobile/app/modules/home/components/transaction_list_section.dart';
import 'package:pxn_mobile/app/modules/home/components/wallet_card.dart';
import 'package:pxn_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:pxn_mobile/utils/constants.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.3),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeaderSection(),
                  SizedBox(
                    height: 20,
                  ),
                  WalletCard(
                    topupWallet: () {
                      printInfo(info: "clicked on topup btn");
                    },
                  ),
                  Label(
                    title: "Services",
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ServiceListSection(),
                  Label(
                    title: "Recent Transactions",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TransactionListSection(
                    controller: controller,
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

class Label extends StatelessWidget {
  final String title;
  const Label({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        children: [
          Text(
            title,
            style: kLargeTitleStyle3,
          ),
        ],
      ),
    );
  }
}
