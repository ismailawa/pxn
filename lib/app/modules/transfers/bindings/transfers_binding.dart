import 'package:get/get.dart';

import '../controllers/transfers_controller.dart';

class TransfersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransfersController>(
      () => TransfersController(),
    );
  }
}
