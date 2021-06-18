import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/customBottomSheet/views/custom_bottom_sheet_view.dart';

class UtilitiesController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  showBottomSheet(String value) {
    Get.bottomSheet(CustomBottomSheetView());
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
