import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddressListController extends GetxController {
  final localStorage = GetStorage();
  dynamic user;

  @override
  void onInit() {
    super.onInit();
    user = localStorage.read("user");
    localStorage.listenKey("user", (u) {
      user = u;
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
