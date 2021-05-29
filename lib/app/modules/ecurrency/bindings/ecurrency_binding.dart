import 'package:get/get.dart';

import '../controllers/ecurrency_controller.dart';

class EcurrencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EcurrencyController>(
      () => EcurrencyController(),
    );
  }
}
