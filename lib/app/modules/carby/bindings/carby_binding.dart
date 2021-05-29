import 'package:get/get.dart';

import '../controllers/carby_controller.dart';

class CarbyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarbyController>(
      () => CarbyController(),
    );
  }
}
