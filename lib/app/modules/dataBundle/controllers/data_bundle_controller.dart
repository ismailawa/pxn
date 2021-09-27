import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/data/providers/utilities_provider.dart';
import 'package:pxn_mobile/app/modules/dataBundle/data_bundle.dart';
import 'package:pxn_mobile/app/modules/dataBundle/data_dto.dart';
import 'package:pxn_mobile/app/modules/dataBundle/provider_model.dart';
import 'package:pxn_mobile/utils/helpers.dart';

class DataBundleController extends GetxController {
  UtilitiesProvider utilitiesProvider = Get.put(UtilitiesProvider());
  AuthProvider authProvider = Get.find<AuthProvider>();
  GlobalKey<FormState> dataFormState = GlobalKey<FormState>();

  RxList<ProviderModel> providers = RxList<ProviderModel>([]);
  RxList<DataBundle> bundles = RxList<DataBundle>([]);
  Rx<ProviderModel> selectProvider = Rx<ProviderModel>(null);
  Rx<DataBundle> selectedBundle = Rx<DataBundle>(null);

  TextEditingController phoneNumberCtrl;
  Rx<TextEditingController> amountCtrl;

  @override
  void onInit() {
    super.onInit();
    getProviders();
    phoneNumberCtrl = TextEditingController();
    amountCtrl = Rx<TextEditingController>(null);
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getProviders() async {
    try {
      final result = await this.utilitiesProvider.getDataProviders();

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

  Future<void> getDataBundles(String selectedType) async {
    try {
      final result = await this.utilitiesProvider.getDataBundles(selectedType);

      if (result["status"] == 'success') {
        bundles(DataBundle.dataBundleParser(result["data"]));
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

  Future<void> purchaseDataBundles() async {
    try {
      final dataDto = DataDto(
        phone: phoneNumberCtrl.text,
        amount: selectedBundle.value.price,
        serviceType: selectProvider.value.serviceType,
        datacode: selectedBundle.value.datacode,
      );
      loadingView("Please wait....");
      final result = await this.utilitiesProvider.purchaseDataBundles(dataDto);

      if (result["status"] == 'success') {
        phoneNumberCtrl.clear();
        selectedBundle(null);
        bundles([]);
        Get.back();
        Get.toNamed("/success", arguments: {
          "message": result["message"],
          "status": true,
          "title": "Congratulation",
          "image": "assets/images/green-check.json"
        });
      } else {
        Get.back();
        Get.snackbar("Get providers", result.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.toNamed("/success", arguments: {
        "message": "Purchase failed $e",
        "status": false,
        "title": "Sorry",
        "image": "assets/images/error.json"
      });
    }
  }

  @override
  void onClose() {}
}
