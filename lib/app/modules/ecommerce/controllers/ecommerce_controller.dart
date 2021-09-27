import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/modules/ecommerce/category.dart';
import 'package:pxn_mobile/app/modules/ecommerce/product.dart';
import 'package:pxn_mobile/app/modules/ecommerce/providers/ecommerce_provider.dart';

class EcommerceController extends GetxController {
  EcommerceProvider ecommerceProvider = Get.put(EcommerceProvider());
  final localStorage = GetStorage();
  RxInt selectedCategory = RxInt(0);

  RxList<Product> products = RxList<Product>([]);
  RxList<Product> tempProducts = RxList<Product>([]);
  RxList<Category> categories = RxList<Category>([]);
  RxInt cartCount = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    localStorage.listenKey("cartCount", (u) {
      print(u);
      cartCount(u);
    });

    cartCount(localStorage.read("cartCount"));
    getAllCategories();
    getAllProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getAllCategories() async {
    try {
      final result = await ecommerceProvider.getAllCategories();
      final data = Category.categoriesModelParser(result["data"]);
      categories(data);
    } catch (e) {
      Get.snackbar("Server Error", e.toString());
    }
  }

  selectCategory(int catId) {
    selectedCategory(catId);
    if (catId == 0) {
      products(tempProducts.value);
    } else {
      final data = tempProducts.value
          .where((element) => element.productCategory["id"] == catId)
          .toList();
      products(data);
    }
  }

  Future<void> getAllProducts() async {
    try {
      final result = await ecommerceProvider.getAllProducts();
      print(result);
      final data = Product.productsModelParser(result["data"]["products"]);
      products(data);
      tempProducts(data);
    } catch (e) {
      Get.snackbar("Server Error", e.toString());
    }
  }

  @override
  void onClose() {}
}
