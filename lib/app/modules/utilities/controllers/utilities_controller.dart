import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/cable/views/cable_view.dart';
import 'package:pxn_mobile/app/modules/customBottomSheet/views/custom_bottom_sheet_view.dart';
import 'package:pxn_mobile/app/modules/dataBundle/views/data_bundle_view.dart';
import 'package:pxn_mobile/app/modules/electricity/views/electricity_view.dart';

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
    switch (value) {
      case 'airtime':
        Get.bottomSheet(CustomBottomSheetView());
        break;

      case 'data':
        Get.bottomSheet(DataBundleView());
        break;

      case 'cable':
        Get.bottomSheet(CableView());
        break;

      case 'electricity':
        Get.bottomSheet(ElectricityView());
        break;
      default:
        Get.bottomSheet(CustomBottomSheetView());
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
