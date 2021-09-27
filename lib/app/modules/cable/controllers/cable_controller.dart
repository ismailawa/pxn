import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/data/providers/utilities_provider.dart';
import 'package:pxn_mobile/app/modules/dataBundle/provider_model.dart';
import 'package:pxn_mobile/utils/helpers.dart';

class CableController extends GetxController {
  UtilitiesProvider utilitiesProvider = Get.put(UtilitiesProvider());
  AuthProvider authProvider = Get.find<AuthProvider>();
  GlobalKey<FormState> cableFormState = GlobalKey<FormState>();

  RxList<ProviderModel> providers = RxList<ProviderModel>([]);
  // RxList<DataBundle> bundles = RxList<DataBundle>([]);
  Rx<ProviderModel> selectProvider = Rx<ProviderModel>(null);

  Rx<Map<String, dynamic>> verifiedAccount = Rx<Map<String, dynamic>>(null);
  TextEditingController accountCtrl = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    getProviders();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getProviders() async {
    try {
      final result = await this.utilitiesProvider.getCableProviders();

      if (result["status"] == 'success') {
        print((result["data"]["providers"]));
        providers(
            ProviderModel.providersModelParser(result["data"]["providers"]));
      } else {
        Get.back();
        Get.snackbar("Get providers", result.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  Future<void> verifyClientAccount() async {
    try {
      loadingView("Processing...");
      final result = await this.utilitiesProvider.verifyCableAccount({
        "service_type": selectProvider.value.serviceType,
        "account_number": accountCtrl.text
      });

      if (result["status"] == 'success') {
        Get.back();
        print((result["data"]));
        verifiedAccount(result["data"]["user"]);
      } else {
        Get.back();
        Get.snackbar("Verifying account", result.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  Future<void> getListOfMultiChoice() async {
    try {
      loadingView("Processing...");
      final result = await this.utilitiesProvider.getMultipleChoice({
        "service_type": selectProvider.value.serviceType,
      });

      if (result["status"] == 'success') {
        Get.back();
        print((result["data"]));
        verifiedAccount(result["data"]["user"]);
      } else {
        Get.back();
        Get.snackbar("Verifying account", result.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  @override
  void onClose() {}
}
