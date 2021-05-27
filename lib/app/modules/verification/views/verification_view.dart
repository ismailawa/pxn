import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verification_controller.dart';

class VerificationView extends GetView<VerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VerificationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VerificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
