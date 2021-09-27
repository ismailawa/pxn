import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/models/cart.dart';
import 'package:pxn_mobile/app/modules/cart/providers/cart_provider.dart';
import 'package:pxn_mobile/app/modules/home/controllers/home_controller.dart';

class CartController extends GetxController {
  final localStorage = GetStorage();
  CartProvider cartProvider = Get.put(CartProvider());
  HomeController homeController = Get.put(HomeController());
  RxDouble subTotal = RxDouble(0.0);

  Rx<Cart> cart = Rx<Cart>(null);

  RxDouble total = RxDouble(0.0);
  RxDouble shipping = RxDouble(0.0);

  @override
  void onInit() {
    super.onInit();
    getCart();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<dynamic> addToCart(int id, int qty) async {
    try {
      return await cartProvider.addToCart(id, qty);
    } catch (e) {
      Get.snackbar("Server Error", e.toString());
    }
  }

  Future<void> getCart() async {
    try {
      final result = await cartProvider.getCart();
      cart(Cart.fromJson(result['data']));
      await localStorage.write("cartCount", cart.value.items.length);

      final x = cart.value.items
          .map((e) => e.totalPrice)
          .toList()
          .reduce((value, element) => value + element);

      subTotal(x);
      total(subTotal.value + shipping.value);
    } catch (e) {
      Get.snackbar("Server Error second", e.toString());
    }
  }

  Future<void> decIncCartItem(int qty, int productIt, String type) async {
    print("productIt");
    print(productIt);
    try {
      final result = await cartProvider.decIncCartItem(
          cart.value.session, qty, productIt, type);
      getCart();
    } catch (e) {
      Get.snackbar("Server Error", e.toString());
    }
  }

  Future<void> removeCartItem(int productId) async {
    try {
      final result = await cartProvider.removeFromCart(productId);
      await getCart();
      if (cart.value.items.length == 0) {
        subTotal(0);
        total(0);
      }
    } catch (e) {
      Get.snackbar("Server Error", e.toString());
    }
  }

  Future<void> checkouCartItems() async {
    try {
      final result = await cartProvider.checkoutCartItem(cart.value.session);
      if (result['success']) {
        getCart();
        total(0);
        subTotal(0);
        await homeController.getCurrentUser();
        // Get.snackbar("Message", result['message']);
        Get.toNamed("/success", arguments: {
          "message": result["message"],
          "status": true,
          "title": "Congratulation",
          "image": "assets/images/green-check.json"
        });
      } else {
        Get.snackbar("Checkout Failed", result["error"]);
      }
    } catch (e) {
      Get.snackbar("Server Error", e.toString());
    }
  }

  @override
  void onClose() {}
}
