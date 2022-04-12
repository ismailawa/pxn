import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ShopView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ShopView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
