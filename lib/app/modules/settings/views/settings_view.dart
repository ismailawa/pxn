import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/models/product.dart';
import 'package:pxn_mobile/app/modules/components/services_header.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.blue.shade100.withOpacity(0.3),
          body: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  physics: BouncingScrollPhysics(),
                  child: GetBuilder<SettingsController>(
                    builder: (newController) => newController.cartList !=
                                null &&
                            newController.cartList.length > 0
                        ? Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, left: 10, right: 10),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(2)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "MY CART",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 2,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: List.generate(
                                            newController.cartList.length,
                                            (index) => CartItem(
                                              adjustCount:
                                                  newController.adjustCount,
                                              deleteItem: newController
                                                  .removeProductFromCart,
                                              cartItem:
                                                  newController.cartList[index],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Grand Total:",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              " ₦ ${controller.cartList.map((a) => a['product']['price'] * a['quantity']).reduce((a, b) => a + b)}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                            MaterialButton(
                                              color: Colors.redAccent,
                                              onPressed: () =>
                                                  Get.toNamed('/checkout'),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text("checkout",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 150),
                            child: Center(
                                child: Column(
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  size: 100,
                                  color: Colors.redAccent,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Your cart is empty",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )),
                          ),
                  ),
                ),
                ServicesHeader(
                  title: 'Shopping Cart',
                ),
              ],
            ),
          )),
    );
  }
}

class CartItem extends StatelessWidget {
  final dynamic cartItem;
  final Function(String, dynamic) adjustCount;
  final Function(dynamic) deleteItem;
  const CartItem({
    Key key,
    this.cartItem,
    this.adjustCount,
    this.deleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                width: 60,
                child: Image.network(cartItem['product']['image'][0]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${cartItem['product']['name']}",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "${cartItem['product']['description']}",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          " ₦ ${cartItem['product']['price']}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => adjustCount(
                            'substract', cartItem['product']['_id']),
                        icon: Icon(Icons.arrow_back_ios_new, size: 15),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.redAccent,
                        ),
                        child: Center(
                          child: Text(
                            "${cartItem['quantity']}",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            adjustCount('add', cartItem['product']['_id']),
                        icon: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                " ₦ ${cartItem['product']['price'] * cartItem['quantity']}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              IconButton(
                color: Colors.redAccent,
                onPressed: () => deleteItem(cartItem['product']['_id']),
                icon: Icon(Icons.delete),
              ),
            ],
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
