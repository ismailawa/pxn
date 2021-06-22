import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/data/providers/utilities_provider.dart';
import 'package:pxn_mobile/app/modules/airtime/billers_model.dart';
import 'package:pxn_mobile/app/modules/utilities/air_request.dto.dart';
import 'package:pxn_mobile/utils/helpers.dart';

class CustomBottomSheetController extends GetxController {
  UtilitiesProvider utilitiesProvider = Get.put(UtilitiesProvider());
  AuthProvider authProvider = Get.find<AuthProvider>();

  RxList<BillersModel> billers = RxList<BillersModel>([]);
  Rx<BillersModel> selectBiller = Rx<BillersModel>(null);
  TextEditingController phoneNumberCtrl;
  TextEditingController amountCtrl;

  @override
  void onInit() {
    super.onInit();
    phoneNumberCtrl = TextEditingController();
    amountCtrl = TextEditingController();
    getProviders();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getProviders() async {
    try {
      final result = await this.utilitiesProvider.getAirtimeBiller();
      print(result.toString());
      if (result.status == 'success') {
        billers(result.provider);
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

  Future<void> buyAirtime() async {
    try {
      loadingView("Please wait....");
      final data = AirRequestDto(
        serviceType: selectBiller.value.serviceType,
        phone: phoneNumberCtrl.text,
        amount: double.tryParse(amountCtrl.text),
      );
      final result = await this.utilitiesProvider.purchaceAirtime(data);
      Get.back();
      Get.back();
      Get.snackbar("Message", result['message']);
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar("Airtime ", "Purchase failed $e");
    }
  }

  @override
  void onClose() {
    phoneNumberCtrl.dispose();
    amountCtrl.dispose();
  }
}
