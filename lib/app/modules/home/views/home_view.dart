import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pxn_mobile/app/data/models/category.dart';
import 'package:pxn_mobile/app/data/models/product.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pxn_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:pxn_mobile/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatelessWidget {
  final List<GlobalKey> globalkeys;
  final controller = Get.put(HomeController());
  final dashboardController = Get.find<DashboardController>();
  final pageController = PageController(initialPage: 0);

  HomeView({Key key, this.globalkeys}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.3),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageController,
                        children: [
                          Image.asset("assets/images/slider.jpg",
                              fit: BoxFit.cover),
                          Image.asset("assets/images/slider1.jpeg",
                              fit: BoxFit.cover),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pageController.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.redAccent,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pageController.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Category",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Obx(
                        () => dashboardController.categories.value.length != 0
                            ? ListView(
                                padding: const EdgeInsets.all(10),
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    dashboardController
                                            .categories.value.length +
                                        1, (index) {
                                  if (index == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Ink(
                                          child: InkWell(
                                        onTap: () {
                                          dashboardController
                                              .filterByCategory('all');
                                        },
                                        child: Container(
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: (dashboardController
                                                        .selectedCategory.value
                                                        .toLowerCase()
                                                        .compareTo("all") ==
                                                    0)
                                                ? []
                                                : [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                          ),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10),
                                                    ),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/slider.jpg"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  "All",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: (dashboardController
                                                                  .selectedCategory
                                                                  .value
                                                                  .toLowerCase()
                                                                  .compareTo(
                                                                      "all") ==
                                                              0)
                                                          ? Colors.redAccent
                                                          : Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                    );
                                  } else {
                                    return CategoryCard(
                                      isActive: dashboardController
                                              .categories.value[index - 1].name
                                              .toLowerCase() ==
                                          dashboardController
                                              .selectedCategory.value,
                                      dashboardController: dashboardController,
                                      category: dashboardController
                                          .categories.value[index - 1],
                                    );
                                  }
                                }),
                              )
                            : ListView(
                                padding: const EdgeInsets.all(10),
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  3,
                                  (index) => Shimmer.fromColors(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Products",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Obx(
                      () => dashboardController.products.value.length != 0
                          ? Column(
                              children: List.generate(
                                dashboardController.filterProducts.value.length,
                                (index) => dashboardController
                                    .filterProducts.value[index].images.length > 0 ?ProductsCard(
                                    dashboardController: dashboardController,
                                    product: dashboardController
                                        .filterProducts.value[index], products: dashboardController.products): SizedBox(),
                              ),
                            )
                          : Column(
                              children: List.generate(
                                  4,
                                  (index) => Shimmer.fromColors(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Container(
                                          height: 250,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      baseColor: Colors.white,
                                      highlightColor: Colors.grey))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final DashboardController dashboardController;
  final bool isActive;

  const CategoryCard({
    Key key,
    this.category,
    this.dashboardController,
    this.isActive = false,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Ink(
        child: InkWell(
          onTap: () {
            dashboardController.filterByCategory(category.name.toLowerCase());
          },
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: !isActive
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  : [],
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${category.name.toLowerCase()}.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    category.name,
                    style: TextStyle(
                        fontSize: 20,
                        color: isActive ? Colors.redAccent : Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductsCard extends StatelessWidget {
  final DashboardController dashboardController;
  var formatCurrency = NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

 ProductsCard({
    Key key,
    this.product,
    this.products,
    this.dashboardController,
  }) : super(key: key);
  final Product product;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () => dashboardController.viewProductDetails(product, context, products: products),
        child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      constraints: BoxConstraints(minHeight: 250),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Image.network(
                        product.images[0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
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
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              product.description,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${formatCurrency.format(product.price)}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                product.comparePrice.length != 0
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
                            padding: const EdgeInsets.only(top: 10),
                            child: RatingBarIndicator(
                              rating: 5,
                              itemCount: 5,
                              itemSize: 20.0,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                onPressed: () =>
                                    Get.toNamed('review', arguments: product),
                                color: Colors.blueAccent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.reviews,
                                        color: Colors.white, size: 20),
                                    SizedBox(width: 5),
                                    Text(
                                      "Reviews",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              child: MaterialButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                onPressed: () => dashboardController
                                    .addProductToCart(product),
                                color: Colors.redAccent,
                                child: Row(
                                  children: [
                                    Icon(Icons.shopping_cart,
                                        color: Colors.white, size: 20),
                                    SizedBox(width: 5),
                                    Text(
                                      "Add to Cart",
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
    );
  }
}

class CustomDialog extends StatelessWidget {
  final GlobalKey<FormState> amountFormkey;
  final Function(String) validator;
  final Function close;
  final Function(BuildContext context) makePayment;
  final TextEditingController controller;
  const CustomDialog({
    Key key,
    this.close,
    this.makePayment,
    this.controller,
    this.amountFormkey,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Form(
        key: amountFormkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Fund Your Wallet",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                CustomInput(
                  validator: validator,
                  inputType: TextInputType.number,
                  controller: controller,
                  // formater: [ThousandsSeparatorInputFormatter()],
                  icon: Icons.payment,
                  hint: "Enter Amount",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: MaterialButton(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        makePayment(context);
                      },
                      child: Text(
                        'Make Payment',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: close,
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.pinkAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

class Label extends StatelessWidget {
  final String title;
  const Label({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        children: [
          Text(
            title,
            style: kLargeTitleStyle3,
          ),
        ],
      ),
    );
  }
}
