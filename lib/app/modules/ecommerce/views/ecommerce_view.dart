import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pxn_mobile/app/modules/components/services_header.dart';
import 'package:pxn_mobile/app/modules/carby/views/carby_view.dart';
import 'package:pxn_mobile/app/modules/ecommerce/product.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/ecommerce_controller.dart';

class EcommerceView extends GetView<EcommerceController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.white,
        child: Scaffold(
            backgroundColor: Colors.blue.shade100.withOpacity(0.3),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ServicesHeader(
                        title: 'ECommerce',
                      ),
                      SearchBar(
                        hint: "Search product",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CategoriesSection(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Products",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
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
                      EcomGridViewSection(
                        products: controller.products.value,
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class EcomGridViewSection extends StatelessWidget {
  final List<Product> products;

  const EcomGridViewSection({
    Key key,
    this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: products.length == 0
          ? SizedBox.shrink()
          : GridView.builder(
              itemCount: products.length,
              padding: EdgeInsets.all(20),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                  onTap: () {
                    Get.toNamed("/product-details", arguments: products[index]);
                  },
                );
              }),
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
                      child: Image.asset(
                        product.images[0],
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
  const CategoriesSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              Text(
                "View all",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 10, bottom: 30, left: 8, right: 8),
            child: Row(
              children: [
                CategoryCard(),
                CategoryCard(
                  title: "Shoes",
                ),
                CategoryCard(
                  title: "Laptops",
                ),
                CategoryCard(
                  title: "Devices",
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;

  const CategoryCard({
    Key key,
    this.title = "Cloths",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
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
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
