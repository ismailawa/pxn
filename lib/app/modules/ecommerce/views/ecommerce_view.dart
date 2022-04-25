import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/models/product.dart';
import 'package:pxn_mobile/app/modules/carby/views/carby_view.dart';
import 'package:pxn_mobile/app/modules/dashboard/controllers/dashboard_controller.dart';

import '../controllers/ecommerce_controller.dart';

class EcommerceView extends GetView<EcommerceController> {
  final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.blue.shade100.withOpacity(0.3),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    SearchBar(
                      hint: "Search product",
                      search: (value) {
                        dashboardController.search(query: value);
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      child: Obx(() => EcomGridViewSection(
                            products:
                                dashboardController.searchedProducts.value,
                            dashboardController: dashboardController,
                          )),
                    ),
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
  final DashboardController dashboardController;
  final List<Product> products;

  const EcomGridViewSection({Key key, this.products, this.dashboardController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: products.length,
          padding: EdgeInsets.only(top: 10, bottom: 280, left: 10, right: 10),
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            return  products[index].images.length > 0 ?GridProductsCard(
              product: products[index],
              dashboardController: dashboardController,
              products: products,
            ): SizedBox();
          }),
    );
  }
}

class GridProductsCard extends StatelessWidget {
  final DashboardController dashboardController;
  final Product product;
  final List<Product> products;
  const GridProductsCard({
    Key key,
    this.product,
    this.products,
    this.dashboardController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: GestureDetector(
        onTap: () => dashboardController.viewProductDetails(product, context, products: products ),
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Image.network(
                        product.images[0],
                        fit: BoxFit.fitHeight,
                      ),
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
                          horizontal: 8.0, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              product.description,
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " ₦ ${product.price}",
                                  style: TextStyle(
                                      fontSize: 12,
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
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 10, vertical: 4),
                          //   child: Container(
                          //     height: 30,
                          //     width: MediaQuery.of(context).size.width,
                          //     child: MaterialButton(
                          //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          //       onPressed: () => dashboardController
                          //           .addProductToCart(product),
                          //       color: Colors.blueAccent,
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           Icon(Icons.reviews,
                          //               color: Colors.white, size: 20),
                          //           Text(
                          //             "Reviews",
                          //             style: TextStyle(color: Colors.white),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
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

// class ProductCard extends StatelessWidget {
//   final Product product;
//   final Function onTap;
//   const ProductCard({
//     Key key,
//     this.onTap,
//     this.product,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final formatCurrency =
//         new NumberFormat.currency(locale: "en_US", symbol: "");
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10,
//               offset: Offset(0, 5),
//             )
//           ]),
//       child: Material(
//         color: Colors.transparent,
//         child: Ink(
//           child: InkWell(
//             onTap: onTap,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Hero(
//                     tag: "${product.id}",
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           top: 20, bottom: 30, left: 10, right: 10),
//                       child: product.image == null
//                           ? Text("Something here")
//                           : Image.network(
//                               product.image,
//                               fit: BoxFit.contain,
//                             ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: 10),
//                         child: Text(
//                           '₦ ${formatCurrency.format(product.price)}',
//                           style: TextStyle(
//                               color: Colors.black54,
//                               fontWeight: FontWeight.w800,
//                               fontSize: 10),
//                         ),
//                       ),
//                       Container(
//                         width: 90,
//                         height: 25,
//                         decoration: BoxDecoration(
//                             color: pxnSecondaryColor,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(20),
//                               bottomLeft: Radius.circular(20),
//                             )),
//                         child: Center(
//                           child: Text(
//                             "Add to cart",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w800,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoriesSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             left: 20,
//             right: 20,
//             top: 20,
//             bottom: 10,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Categories",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "View all",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Obx(
//           () => Container(
//             width: MediaQuery.of(context).size.width,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.only(top: 10, bottom: 30, left: 8, right: 8),
//               child: Row(
//                 children: List.generate(
//                   ecommerceController.categories.value.length + 1,
//                   (index) => index == 0
//                       ? CategoryCard(
//                           onTap: () => ecommerceController.selectCategory(0),
//                           isSelected:
//                               ecommerceController.selectedCategory.value == 0,
//                         )
//                       : CategoryCard(
//                           onTap: () => ecommerceController.selectCategory(
//                               ecommerceController
//                                   .categories.value[index - 1].id),
//                           isSelected:
//                               ecommerceController.selectedCategory.value ==
//                                   ecommerceController
//                                       .categories.value[index - 1].id,
//                           category:
//                               ecommerceController.categories.value[index - 1],
//                         ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   final Function onTap;
//   final bool isSelected;
//   final String title;
//   final Category category;

//   const CategoryCard({
//     Key key,
//     this.title = "Cloths",
//     this.category,
//     this.isSelected = false,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       child: InkWell(
//         onTap: onTap,
//         child: Padding(
//           padding: EdgeInsets.only(left: 16),
//           child: Container(
//             height: 100,
//             width: 100,
//             decoration: isSelected
//                 ? BoxDecoration(
//                     color: pxnSecondaryColor,
//                     borderRadius: BorderRadius.circular(20),
//                   )
//                 : BoxDecoration(
//                     color: pxnSecondaryColor,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: [
//                         BoxShadow(
//                           color: Colors.blueAccent.withOpacity(0.4),
//                           blurRadius: 16,
//                           offset: Offset(0, 8),
//                         ),
//                       ]),
//             child: Center(
//               child: category == null
//                   ? Text(
//                       "All",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: isSelected ? Colors.red : Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   : Text(
//                       category.name,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: isSelected ? Colors.red : Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
