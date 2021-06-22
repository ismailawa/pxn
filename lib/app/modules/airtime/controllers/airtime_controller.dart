import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/utilities_provider.dart';
import 'package:pxn_mobile/app/modules/airtime/billers_model.dart';

class AirtimeController extends GetxController {
  UtilitiesProvider utilitiesProvider = Get.put(UtilitiesProvider());
  RxList<BillersModel> billers = RxList<BillersModel>([]);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Get.snackbar("Login", "You have sucessfully login");
  }

  Future<void> getProviders() async {
    try {
      final result = await this.utilitiesProvider.getAirtimeBiller();
      if (result.status == 'success') {
        billers(result.provider);
        Get.back();
      } else {
        Get.back();
        Get.snackbar("Get providers", result.message);
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  @override
  void onClose() {}
}
