import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/models/flutter_wave_init_response.model.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/data/providers/payment_provider.dart';
import 'package:pxn_mobile/app/modules/home/views/home_view.dart';
import 'package:pxn_mobile/app/modules/login/user_model.dart';
import 'package:pxn_mobile/utils/helpers.dart';
import 'package:rave_flutter/rave_flutter.dart';

class HomeController extends GetxController {
  PaymentProvider paymentProvider = Get.put(PaymentProvider());
  // Formstate globalkey
  GlobalKey<FormState> amountFormkey = GlobalKey<FormState>();
  final localStorage = GetStorage();
  TextEditingController amountCtrl;

  AuthProvider authProvider = Get.find<AuthProvider>();

  Rx<User> user = Rx<User>(User());

  @override
  void onInit() {
    super.onInit();
    amountCtrl = TextEditingController();
    getCurrentUser();
  }

  openPaymentDialog(BuildContext context) {
    Get.generalDialog(pageBuilder: (BuildContext context, ani, anim) {
      return CustomDialog(
        amountFormkey: amountFormkey,
        validator: validateAmount,
        controller: amountCtrl,
        makePayment: (value) {
          makePayment(value);
        },
        close: () {
          Get.back();
        },
      );
    });
  }

  makePayment(BuildContext context) async {
    // Form validation
    final isValid = amountFormkey.currentState.validate();

    if (!isValid) {
      return;
    }
    try {
      loadingView("Processing...");
      final result = await paymentProvider.initialisePayment(amountCtrl.text);
      if (result['success']) {
        Get.back();
        // Get.back();
        final initialRes = FlutterWaveInitResponseModel.fromJson(
            result as Map<String, dynamic>);
        print(initialRes.data.txtRef);
        final res = await processPayment(
            context: context,
            txRef: initialRes.data.txtRef,
            publicKey: initialRes.data.flwpubk,
            encryptionKey: initialRes.data.flwenckey,
            amount: initialRes.data.amount.toDouble(),
            email: user.value.email,
            firstName: user.value.firstname,
            lastName: user.value.lastname,
            narration: "Wallet funding");
        print(res);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Payment Error ", "Wallet funding failed $e");
    }
    Get.back();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getCurrentUser() async {
    try {
      final result = await authProvider.getUserProfile();
      if (result['success']) {
        await localStorage.write('profile', result['data']);
        final decodedUser =
            User.fromJson(result['data'] as Map<String, dynamic>);
        print(result['data']);
        user(decodedUser);
      }
    } catch (e) {
      print(e);
      Get.snackbar("Profile Error ", "Fetching Profile failed $e");
    }
  }

  String validateAmount(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  Future<dynamic> processPayment({
    BuildContext context,
    String publicKey,
    String encryptionKey,
    double amount,
    String email,
    String firstName,
    String lastName,
    String narration,
    String txRef,
  }) async {
    // Get a reference to RavePayInitializer
    var initializer = RavePayInitializer(
        amount: amount, publicKey: publicKey, encryptionKey: encryptionKey)
      ..country = "NG"
      ..currency = "NGN"
      ..email = email
      ..fName = firstName
      ..lName = lastName
      ..narration = narration ?? ''
      ..txRef = txRef
      // ..acceptMpesaPayments = true
      ..acceptAccountPayments = true
      ..acceptCardPayments = true
      // ..acceptAchPayments = true
      // ..acceptGHMobileMoneyPayments = true
      // ..acceptUgMobileMoneyPayments = true
      ..staging = true
      ..displayFee = true;

    // Initialize and get the transaction result
    RaveResult response = await RavePayManager()
        .prompt(context: context, initializer: initializer);
    return response;
  }

  showTransactionDetails() {
    Get.bottomSheet(
      TransactionDetails(),
    );
  }

  @override
  void onClose() {
    amountCtrl.dispose();
  }
}

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue.shade100.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
      ),
    );
  }
}
