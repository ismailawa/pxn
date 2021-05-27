import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';

import '../controllers/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(
      () => VerificationController(Get.put(AuthProvider())),
    );
  }
}
