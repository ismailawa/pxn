import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  showTransactionDetails() {
    Get.bottomSheet(
      TransactionDetails(),
    );
  }

  @override
  void onClose() {}
}

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue.shade100.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
      ),
    );
  }
}
