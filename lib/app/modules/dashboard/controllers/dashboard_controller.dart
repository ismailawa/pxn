import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/models/category.dart';
import 'package:pxn_mobile/app/data/models/product.dart';
import 'package:pxn_mobile/app/data/providers/general_provider.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  final localStorage = GetStorage();
  final generalProvider = Get.put<GeneralProvider>(GeneralProvider());
  RxList<Product> products = RxList<Product>();
  RxList<Category> categories = RxList<Category>();
  RxList<Product> searchedProducts = RxList<Product>();
  RxList<Product> filterProducts = RxList<Product>();
  RxnInt cartCount = RxnInt(0);
  RxString selectedCategory = RxString('all');

  @override
  void onInit() {
    super.onInit();
    getProducts();

    cartCount.value = localStorage.read("cart") != null
        ? localStorage.read("cart").length
        : 0;
    localStorage.listenKey("cart", (u) {
      cartCount(u.length);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  void previewProduct(Product product, BuildContext context) {
    Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Image.network(
                        product.images[0],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Text(
                                product.name,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Text(
                                product.description,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " ₦ ${product.price}",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  product.comparePrice.length > 0
                                      ? Text(
                                          " ₦ ${product.comparePrice[0]}",
                                          style: TextStyle(
                                              fontSize: 10,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10, right: 10),
                              child: RatingBarIndicator(
                                rating: 4,
                                itemCount: 5,
                                itemSize: 30.0,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    print(index);
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                            TextFormField(
                              maxLines: 6,
                              minLines: 6,
                              decoration: InputDecoration(
                                labelText: "Comments",
                                labelStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: MaterialButton(
                                  onPressed: () => addProductToCart(product),
                                  color: Colors.redAccent,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Submit review",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        isScrollControlled: true);
  }

  void viewProductDetails(Product product, BuildContext context,
      {List<Product> products}) {

    final formatCurrency =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xC0C0C0C5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Image.network(
                        product.images[0],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.red),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: RatingBarIndicator(
                                      rating: 5,
                                      itemCount: 5,
                                      itemSize: 16.0,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10, bottom: 10),
                              child: Text(
                                product.description,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                      products.length,
                                      (index) => Padding(
                                            padding:
                                                const EdgeInsets.only(right: 6),
                                            child: products[index]
                                                            .images
                                                            .length >
                                                        0 &&
                                                    products[index]
                                                            .category
                                                            .name
                                                            .toLowerCase()
                                                            .compareTo(product
                                                                .category.name
                                                                .toLowerCase()) ==
                                                        0
                                                ? GestureDetector(
                                                    onTap: () async {
                                                      Get.back();
                                                      viewProductDetails(products[index], context,
                                                          products: products);
                                                    },
                                                    child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.fill,
                                                              image: NetworkImage(
                                                                  products[index]
                                                                          .images[
                                                                      0])),
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                  )
                                                : SizedBox.shrink(),
                                          )),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${formatCurrency.format(product.price)}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      product.comparePrice.length > 0
                                          ? Text(
                                              " ₦ ${product.comparePrice[0]}",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () => addProductToCart(product),
                                    color: Colors.redAccent,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_cart,
                                            color: Colors.white, size: 20),
                                        Text(
                                          "Add to Cart",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        isScrollControlled: true);
  }

  void getProducts() async {
    try {
      final result = await Future.wait([
        generalProvider.getProducts(),
        generalProvider.getCategories(),
      ]);

      if (result[0]['success'] && result[1]['success']) {
        products.value = Product.productModelParser(result[0]['data']);
        categories.value = Category.categoriesModelParser(result[1]['data']);
        search();
        filterByCategory('all');
      } else {
        Get.snackbar(
          'Error',
          result[0]['message'] ?? result[1]['message'],
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          backgroundColor: Colors.white,
          colorText: Colors.black,
        );
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  void search({String query = ""}) {
    if (query.isEmpty) {
      searchedProducts.value = products.value;
    } else {
      searchedProducts.value = products.value.where((product) {
        return product.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  void filterByCategory(String query) {
    selectedCategory(query);
    if (query.compareTo('all') == 0) {
      print(query);
      filterProducts.value = products.value;
    } else {
      filterProducts.value = products.value.where((product) {
        return product.category.name.toLowerCase().compareTo(query) == 0;
      }).toList();
    }
  }

  void addProductToCart(Product product) async {
    final cart = localStorage.read("cart") ?? [];

    if (cart.length <= 0) {
      cart.add({
        "product": product.toMap(),
        "quantity": 1,
      });
      Get.snackbar("Cart", "${product.name} is added to the cart");
    } else {
      final index =
          cart.indexWhere((element) => element['product']['_id'] == product.id);
      if (index == -1) {
        cart.add({
          "product": product.toMap(),
          "quantity": 1,
        });
        Get.snackbar("Cart", "${product.name} is added to the cart");
      } else {
        cart[index]['quantity'] += 1;
        Get.snackbar("Cart", "${product.name} is added to the cart");
      }
    }
    await localStorage.write("cart", cart);
  }

  @override
  void onClose() {}
}
