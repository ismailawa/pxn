import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/airtime_controller.dart';

class AirtimeView extends GetView<AirtimeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AirtimeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AirtimeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
