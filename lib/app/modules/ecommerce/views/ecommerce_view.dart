import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pxn_mobile/app/modules/carby/views/carby_view.dart';
import 'package:pxn_mobile/app/modules/ecommerce/category.dart';
import 'package:pxn_mobile/app/modules/ecommerce/product.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/ecommerce_controller.dart';

class EcommerceView extends GetView<EcommerceController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.blue.shade100.withOpacity(0.3),
          appBar: AppBar(
            backgroundColor: Colors.blue.shade100.withOpacity(0),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0,
            title: Text(
              "Ecommerce",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.history),
                onPressed: () {
                  Get.toNamed("/orders");
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 5),
                child: Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
                        Get.toNamed("/cart");
                      },
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Obx(
                          () => Center(
                              child: Text('${controller.cartCount.value}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ))),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBar(
                      hint: "Search product",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CategoriesSection(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Products",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    EcomGridViewSection()
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class ProductSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}

class EcomGridViewSection extends StatelessWidget {
  final ecommerceController = Get.find<EcommerceController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        constraints: BoxConstraints(maxHeight: 450),
        child: ecommerceController.products.value.length == 0
            ? SizedBox.shrink()
            : GridView.builder(
                itemCount: ecommerceController.products.value.length,
                padding: EdgeInsets.all(20),

                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: ecommerceController.products.value[index],
                    onTap: () {
                      Get.toNamed("/product-details",
                          arguments: ecommerceController.products.value[index]);
                    },
                  );
                }),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final Function onTap;
  const ProductCard({
    Key key,
    this.onTap,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency =
        new NumberFormat.currency(locale: "en_US", symbol: "");
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Hero(
                    tag: "${product.id}",
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 30, left: 10, right: 10),
                      child: product.image == null
                          ? Text("Something here")
                          : Image.network(
                              product.image,
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '₦ ${formatCurrency.format(product.price)}',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              fontSize: 10),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 25,
                        decoration: BoxDecoration(
                            color: pxnSecondaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )),
                        child: Center(
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  final ecommerceController = Get.find<EcommerceController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              Text(
                "View all",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 10, bottom: 30, left: 8, right: 8),
              child: Row(
                children: List.generate(
                  ecommerceController.categories.value.length + 1,
                  (index) => index == 0
                      ? CategoryCard(
                          onTap: () => ecommerceController.selectCategory(0),
                          isSelected:
                              ecommerceController.selectedCategory.value == 0,
                        )
                      : CategoryCard(
                          onTap: () => ecommerceController.selectCategory(
                              ecommerceController
                                  .categories.value[index - 1].id),
                          isSelected:
                              ecommerceController.selectedCategory.value ==
                                  ecommerceController
                                      .categories.value[index - 1].id,
                          category:
                              ecommerceController.categories.value[index - 1],
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  final String title;
  final Category category;

  const CategoryCard({
    Key key,
    this.title = "Cloths",
    this.category,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Container(
            height: 100,
            width: 100,
            decoration: isSelected
                ? BoxDecoration(
                    color: pxnSecondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  )
                : BoxDecoration(
                    color: pxnSecondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.4),
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                      ]),
            child: Center(
              child: category == null
                  ? Text(
                      "All",
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected ? Colors.red : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected ? Colors.red : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
