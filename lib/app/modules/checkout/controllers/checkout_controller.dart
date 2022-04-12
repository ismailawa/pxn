import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/providers/general_provider.dart';
import 'package:nanoid/nanoid.dart';

class CheckoutController extends GetxController {
  final localStorage = GetStorage();
  GeneralProvider generalProvider = Get.find<GeneralProvider>();
  dynamic cartList;
  dynamic user;
  int amount = 0;
  int charges = 1000;
  int total = 0;

  @override
  void onInit() {
    super.onInit();
    cartList = localStorage.read("cart");
    user = localStorage.read("user");
    calculate();
    print(user);
    localStorage.listenKey("cart", (u) {
      cartList = u;
      calculate();
      update();
    });
  }

  calculate() {
    if (cartList.length > 0) {
      amount = cartList
          .map((a) => a['product']['price'] * a['quantity'])
          .reduce((a, b) => a + b);
      charges += (100 *
          (cartList.map((a) => a['quantity']).reduce((a, b) => a + b) - 1));
      total = amount + charges;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  void makePayment(BuildContext context) async {
    var customLengthId = nanoid(10);
    var txRefId = "NS$customLengthId";
    final result = await Future.wait([
      generalProvider.createOrder({
        "charge": charges,
        "total": total,
        "orderNumber": txRefId,
        "products": cartList,
      }),
      handlePaymentInitialization(context, txRefId),
      this.generalProvider.getOrders()
    ]);

    await localStorage.write("orders", result[2]['data']);
  }

  Future<void> handlePaymentInitialization(
      BuildContext context, dynamic txRefId) async {
    final style = FlutterwaveStyle(
        appBarText: "Payment",
        buttonColor: Colors.redAccent,
        appBarIcon: Icon(Icons.message, color: Color(0xffd0ebff)),
        buttonTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        appBarColor: Colors.redAccent,
        appBarTitleTextStyle: TextStyle(color: Colors.white),
        dialogCancelTextStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 18,
        ),
        dialogContinueTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ));
    final Customer customer = Customer(
        name: user['fullname'],
        phoneNumber: user['phone'],
        email: user['email']);

    final Flutterwave flutterwave = Flutterwave(
      context: context,
      style: style,
      publicKey: "FLWPUBK_TEST-fec06fba1aff936607a6b7b34b0589f9-X",
      currency: "NGN",
      txRef: txRefId,
      meta: {"email": user['email'], "orderNumber": txRefId},
      amount: "$total",
      customer: customer,
      redirectUrl: 'https://nascodirect.net',
      paymentOptions: "ussd, card, barter, payattitude",
      customization:
          Customization(title: "Payment for the purchase of Nasco products"),
      isTestMode: true,
    );

    try {
      final ChargeResponse response = await flutterwave.charge();
      if (response != null) {
        if (response.success) {
          final result = await localStorage.write("cart", []);
          update();
          Get.snackbar(
            "Success",
            "Payment Successful",
            icon: Icon(
              Icons.check,
              color: Colors.green,
            ),
            backgroundColor: Colors.white,
            colorText: Colors.black,
          );
          Future.delayed(Duration(seconds: 2), () {
            Get.back();
            Get.offAndToNamed('/dashboard');
          });
        } else {
          Get.snackbar(
            "Error",
            response.status,
            icon: Icon(
              Icons.error,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
            colorText: Colors.black,
          ); // Transaction not successful
        }
      } else {
        // User cancelled
      }
    } catch (e) {}
  }

  @override
  void onClose() {}
}
