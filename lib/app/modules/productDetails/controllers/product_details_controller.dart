import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/cart/controllers/cart_controller.dart';
import 'package:pxn_mobile/app/modules/ecommerce/product.dart';

class ProductDetailsController extends GetxController {
  RxInt productCount = RxInt(1);
  Rx<Product> product = Rx<Product>(Product());
  CartController cartController = Get.put(CartController());
  RxBool isLoading = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    product(Get.arguments);
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increaseCount() {
    int c = productCount.value;
    c += 1;
    productCount(c);
  }

  void decreaseCount() {
    int c = productCount.value;
    if (c > 1) {
      c -= 1;
      productCount(c);
    }
  }

  Future<void> addToCart() async {
    isLoading(true);
    final result =
        await cartController.addToCart(product.value.id, productCount.value);
    isLoading(false);
    Get.snackbar("Success", "Item Added to Cart");
    await cartController.getCart();
    print(result);
  }

  @override
  void onClose() {}
}
