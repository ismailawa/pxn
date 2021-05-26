import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(Get.put(AuthProvider())),
    );
  }
}
