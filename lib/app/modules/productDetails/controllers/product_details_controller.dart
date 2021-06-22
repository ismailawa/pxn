import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/ecommerce/product.dart';

class ProductDetailsController extends GetxController {
  RxInt productCount = RxInt(1);
  Rx<Product> product = Rx<Product>(Product());

  final count = 0.obs;
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

  @override
  void onClose() {}
  void increment() => count.value++;
}
