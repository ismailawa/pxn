import 'package:get/get.dart';

import '../controllers/cable_controller.dart';

class CableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CableController>(
      () => CableController(),
    );
  }
}
