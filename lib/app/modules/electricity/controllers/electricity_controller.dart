import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/providers/general_provider.dart';

class ElectricityController extends GetxController {
  GeneralProvider generalProvider = Get.find<GeneralProvider>();

  final storage = GetStorage();

  dynamic orders = [];

  @override
  void onInit() {
    super.onInit();
    orders = storage.read("orders") != null ? storage.read("orders") : [];
    storage.listenKey("orders", (order) {
      orders = order;
      update();
    });
    getOrders();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getOrders() async {
    try {
      final result = await this.generalProvider.getOrders();

      if (result['success']) {
        await storage.write("orders", result['data']);
      } else {
        Get.back();
        Get.snackbar("Get providers", result.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  @override
  void onClose() {}
}
