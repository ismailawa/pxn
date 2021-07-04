import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/data/providers/payment_provider.dart';

class TransfersController extends GetxController {
  PaymentProvider paymentProvider = Get.put(PaymentProvider());
  AuthProvider authProvider = Get.find<AuthProvider>();

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
}
