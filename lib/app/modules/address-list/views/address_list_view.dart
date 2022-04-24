import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/address_list_controller.dart';

class AddressListView extends GetView<AddressListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddressListView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddressListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
