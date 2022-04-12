import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/models/product.dart';

class SettingsController extends GetxController {
  final localStorage = GetStorage();
  dynamic cartList;

  @override
  void onInit() {
    super.onInit();
    cartList = localStorage.read("cart");
    localStorage.listenKey("cart", (u) {
      print(u);
      cartList = u;
      update();
    });
  }

  void adjustCount(String type, dynamic id) {
    final cart = localStorage.read("cart");
    final index = cart.indexWhere((element) => element['product']['_id'] == id);
    if (index != -1) {
      if (type == 'add') {
        cart[index]['quantity'] += 1;
        localStorage.write("cart", cart);
      } else {
        if (cart[index]['quantity'] > 1) {
          cart[index]['quantity'] -= 1;
          localStorage.write("cart", cart);
        }
      }
    }
  }

  void removeProductFromCart(dynamic id) async {
    final cart = localStorage.read("cart") ?? [];
    print(cart);
    print(id);
    if (cart.length > 0) {
      final index =
          cart.indexWhere((element) => element['product']['_id'] == id);
      print(index);
      if (index == -1) {
        Get.snackbar("error", "product not found");
      } else {
        cart.removeAt(index);
        await localStorage.write("cart", cart);
        update();
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
