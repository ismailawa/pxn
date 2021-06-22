import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/ecommerce/product.dart';

class EcommerceController extends GetxController {
  var produtData = [
    Product(
        id: 1,
        title: "Shoe and Bags",
        description: "This african shoe and bags design with local materials",
        quantity: 100,
        price: 2000,
        images: ["assets/images/shoe.png"]),
    Product(
        id: 2,
        title: "Traditional cloth",
        description: "This african shoe and bags design with local materials",
        quantity: 100,
        price: 3000,
        images: ["assets/images/system.png"]),
    Product(
        id: 3,
        title: "Laptop devices",
        description: "This african shoe and bags design with local materials",
        quantity: 100,
        price: 2500,
        images: ["assets/images/shoemale.png"]),
    Product(
        id: 4,
        title: "Machinaries and tools",
        description: "This african shoe and bags design with local materials",
        quantity: 100,
        price: 3500,
        images: ["assets/images/collabe.png"]),
    Product(
        id: 5,
        title: "Shoe and Bags",
        description: "This african shoe and bags design with local materials",
        quantity: 100,
        price: 4500.50,
        images: ["assets/images/shoe.png"]),
    Product(
        id: 6,
        title: "Shoe and Bags",
        description: "This african shoe and bags design with local materials",
        quantity: 100,
        price: 8000,
        images: ["assets/images/shoemale.png"]),
  ];

  RxList<Product> products = RxList<Product>([]);

  Future<void> getProducts() async {
    await Future.delayed(Duration(seconds: 3));
    products(produtData);
  }

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
