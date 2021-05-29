import 'package:get/get.dart';

class UtilitiesController extends GetxController {
  //TODO: Implement UtilitiesController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
