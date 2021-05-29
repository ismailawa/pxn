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
                      title: 'Transfers',
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
