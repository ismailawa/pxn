import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.3),
      body: Center(
        child: Text(
          'ServicesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
