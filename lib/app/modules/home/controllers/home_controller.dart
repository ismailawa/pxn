import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/modules/home/views/home_view.dart';
import 'package:pxn_mobile/app/modules/login/user_model.dart';

class HomeController extends GetxController {
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
        makePayment: () => makePayment(),
        close: () {
          Get.back();
        },
      );
    });
  }

  makePayment() {
    printInfo(info: "paymen working");
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
