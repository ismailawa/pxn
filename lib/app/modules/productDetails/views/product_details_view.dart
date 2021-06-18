import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/services_header.dart';
import 'package:pxn_mobile/utils/constants.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Bg1(),
        Positioned(
          left: 0,
          right: 0,
          bottom: 120,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Text(
                        "African Bags and shoes",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "African Bags and shoes African Bags and shoes African Bags and shoes African Bags and shoes African Bags and shoes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Size:",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "50",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          SmallBtn(
                            sign: "-",
                            onTap: () {},
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: pxnSecondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ),
                          SmallBtn(
                            onTap: () {},
                          ),
                          Spacer(),
                          Text(
                            "5000.00",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: -130,
                child: Hero(
                  tag: 'product-tag',
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.6,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset("assets/images/shoe.png"),
                  ),
                ),
              )
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: ServicesHeader(
              title: '',
            ),
          ),
        ),
      ],
    );
  }
}

class Bg1 extends StatelessWidget {
  const Bg1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF1D83AE).withOpacity(0.5),
                  pxnSecondaryColor,
                ],
                radius: 0.7,
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 30,
              ),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: pxnSecondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Flexible(
                          flex: 10,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: pxnSecondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SmallBtn extends StatelessWidget {
  final IconData icon;
  final String sign;

  final Function onTap;

  const SmallBtn({
    Key key,
    this.icon = Icons.add,
    this.onTap,
    this.sign = "+",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: pxnSecondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  sign,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
