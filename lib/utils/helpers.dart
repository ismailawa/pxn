import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constants.dart';

loadingView(String title) {
  Get.defaultDialog(
      title: title,
      content: Column(
        children: [
          CircularProgressIndicator.adaptive(
            backgroundColor: pxnPrimaryColor,
          ),
        ],
      ));
}
