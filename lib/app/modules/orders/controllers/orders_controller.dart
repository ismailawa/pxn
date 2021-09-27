import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/models/order.dart';
import 'package:pxn_mobile/app/modules/login/user_model.dart';
import 'package:pxn_mobile/app/modules/orders/providers/orders_provider.dart';

class OrdersController extends GetxController {
  final localStorage = GetStorage();
  Rx<User> user = Rx<User>(null);
  OrdersProvider ordersProvider = Get.put(OrdersProvider());
  RxList<Order> orders = RxList<Order>([]);

  @override
  void onInit() {
    super.onInit();
    user(User.fromJson(localStorage.read("profile")));
    getAllOrders();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getAllOrders() async {
    try {
      final result = await ordersProvider.getAllOrders(user.value.id);
      if (result['success']) {
        orders(Order.ordersModelParser(result["data"]['orders']));
      } else {
        Get.snackbar("Login Error ", "${result['error']}");
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  Future<void> confirmOrders(String reference) async {
    try {
      final result = await ordersProvider.confirmOrder(reference);
      if (result['success']) {
        Get.snackbar("Confirmation", "Order Confirmed Successfully");
        getAllOrders();
      } else {
        Get.snackbar("Login Error ", "${result['error']}");
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  Future<void> viewOrder(Order order) async {
    if (!Get.isBottomSheetOpen) {
      try {
        final result = await ordersProvider.getOrderDetails(order.reference);
        if (result['success']) {
          Get.bottomSheet(
              OrderDetailView(
                result: result,
                confirm: () {
                  confirmOrders(order.reference);
                },
              ),
              isScrollControlled: true,
              ignoreSafeArea: false);
        } else {
          Get.snackbar("Login Error ", "${result['error']}");
        }
      } catch (e) {
        Get.back();
        Get.snackbar("Login Error ", "Login failed $e");
      }
    }
  }

  @override
  void onClose() {}
}

class OrderDetailView extends StatelessWidget {
  final Function confirm;
  const OrderDetailView({
    Key key,
    @required this.result,
    this.confirm,
  }) : super(key: key);

  final dynamic result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ORDER#",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                result['data']["reference"],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "DATE",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${DateTime.parse(result['data']["createdAt"]).toLocal()}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TOTAL",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${result['data']["total"]}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          Ink(
            child: InkWell(
              onTap: confirm,
              child: Container(
                width: 350,
                height: 40,
                child: Center(
                  child: Text("Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(
                result['data']["orderItems"].length,
                (index) => Container(
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.network(
                            "${result['data']["orderItems"][index]["productDetails"]["image"]}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${result['data']["orderItems"][index]["productDetails"]["name"]}"),
                            Text(
                                "${result['data']["orderItems"][index]["productDetails"]["description"]}"),
                            Text(
                                "${result['data']["orderItems"][index]["amount"]} x ${result['data']["orderItems"][index]["quantity"]}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
