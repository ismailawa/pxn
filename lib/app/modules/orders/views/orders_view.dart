import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/models/order.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
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
            "Orders",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          child: Obx(
            () => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                    controller.orders.value.length,
                    (index) => OrderTile(
                          ontap: () => controller
                              .viewOrder(controller.orders.value[index]),
                          order: controller.orders.value[index],
                        )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderTile extends StatelessWidget {
  final Order order;
  final Function ontap;
  const OrderTile({Key key, @required this.order, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${DateTime.parse(order.createdAt).toLocal()}",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "${order.status}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "${order.reference}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
