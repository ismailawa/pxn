import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  final localStorage = GetStorage();
  final GlobalKey one = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    // printInfo(info: localStorage.read('user'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
