import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/services_header.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.blue.shade100.withOpacity(0.3),
          body: SafeArea(
            child: Stack(
              children: [
                GetBuilder<CheckoutController>(
                  builder: (newController) => SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 80),
                    physics: BouncingScrollPhysics(),
                    child: Container(
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Summary",
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
                                  newController.cartList != null
                                      ? Column(
                                          children: List.generate(
                                            newController.cartList.length,
                                            (index) => CheckoutItem(
                                              cartItem:
                                                  newController.cartList[index],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          child: Center(
                                            child: Text("No items in cart"),
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  newController.cartList.length > 0
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "SubTotal:",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                " ₦${newController.amount}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  newController.cartList.length > 0
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Tax:",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                " ₦0.00",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  newController.cartList.length > 0
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Shipping charges:",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                " ₦ ${newController.charges}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  Divider(
                                    thickness: 2,
                                  ),
                                  newController.cartList.length > 0
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                " ₦${newController.total}",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                  newController.cartList.length > 0
                                      ? SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: MaterialButton(
                                            color: Colors.redAccent,
                                            onPressed: () =>
                                                controller.makePayment(context),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text("Make payment",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ServicesHeader(
                  title: 'Checkout',
                ),
              ],
            ),
          )),
    );
  }
}

class CheckoutItem extends StatelessWidget {
  final dynamic cartItem;
  const CheckoutItem({
    Key key,
    this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 60,
                child: Image.network(cartItem['product']['image'][0]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem['product']['name'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    cartItem['product']['description'],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "QTY: ${cartItem['quantity']}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        " ₦ ${cartItem['product']['price'] * cartItem['quantity']}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                    ],
                  ),
                ],
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
