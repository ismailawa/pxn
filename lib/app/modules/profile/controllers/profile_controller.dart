import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/modules/login/user_model.dart';

class ProfileController extends GetxController {
  final authProvider = Get.find<AuthProvider>();
  final localStorage = GetStorage();
  dynamic cartList;
  dynamic user;
  int amount = 0;
  int charges = 1000;
  int total = 0;

  @override
  void onInit() {
    super.onInit();
    cartList = localStorage.read("cart");
    user = localStorage.read("user");
    print(user);
    localStorage.listenKey("cart", (u) {
      cartList = u;
      update();
    });
    localStorage.listenKey("user", (u) {
      user = u;
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  void logout() async {
    await authProvider.logout();
  }

  @override
  void onClose() {}
}
