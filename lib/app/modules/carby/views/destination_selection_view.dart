import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DestinationSelectionView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DestinationSelectionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DestinationSelectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
