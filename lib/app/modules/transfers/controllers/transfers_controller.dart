import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/data/providers/utilities_provider.dart';
import 'package:pxn_mobile/app/modules/transfers/views/wallet_to_wallet_view.dart';
import 'package:pxn_mobile/utils/helpers.dart';

class TransfersController extends GetxController {
  UtilitiesProvider utilitiesProvider = Get.put(UtilitiesProvider());
  Rx<Map<String, dynamic>> verifiedUser = Rx<Map<String, dynamic>>(null);

  AuthProvider authProvider = Get.find<AuthProvider>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController amountCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> walletToWalletTransfer() async {
    Get.bottomSheet(
      WalletToWalletView(),
      isScrollControlled: true,
    );
  }

  Future<void> verifyUsername() async {
    try {
      loadingView("Verifying User");
      final result =
          await this.utilitiesProvider.verifyWalletAccount(usernameCtrl.text);

      if (result["success"] == true) {
        print(result);
        Get.back();
        verifiedUser(result["data"]);
      } else {
        Get.back();
        Get.snackbar("Get providers", result.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Transfer", "User not found");
    }
  }

  Future<void> transferFund() async {
    try {
      loadingView("Transfering Fund");
      final result = await this.utilitiesProvider.transferWalletToWallet({
        "holder_id": verifiedUser.value["holder_id"],
        "amount": double.parse(amountCtrl.text)
      });

      if (result["status"] == "success") {
        await authProvider.getUserProfile();
        Get.toNamed("/success", arguments: {
          "message": result["message"],
          "status": true,
          "title": "Congratulation",
          "image": "assets/images/green-check.json"
        });
      } else {
        Get.back();
        Get.snackbar("Get providers", result["message"]);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Transfer", "User not found");
    }
  }

  @override
  void onClose() {
    usernameCtrl.dispose();
  }
}
