import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/data/providers/utilities_provider.dart';
import 'package:pxn_mobile/app/modules/dataBundle/provider_model.dart';

class DataBundleController extends GetxController {
  UtilitiesProvider utilitiesProvider = Get.put(UtilitiesProvider());
  AuthProvider authProvider = Get.find<AuthProvider>();
  GlobalKey<FormState> dataFormState = GlobalKey<FormState>();

  RxList<ProviderModel> providers = RxList<ProviderModel>([]);
  Rx<ProviderModel> selectProvider = Rx<ProviderModel>(null);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getProviders() async {
    try {
      final result = await this.utilitiesProvider.getDataProviders();
      print(result.toString());
      if (result.status == 'success') {
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

  @override
  void onClose() {}
  void increment() => count.value++;
}
