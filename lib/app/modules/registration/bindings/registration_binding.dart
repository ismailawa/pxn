import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';

import '../controllers/registration_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(
      () => RegistrationController(Get.put(AuthProvider())),
    );
  }
}
