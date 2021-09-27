import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/cart/providers/cart_provider.dart';

class AddShippingAddressController extends GetxController {
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  CartProvider cartProvider = Get.put(CartProvider());

  RxBool isLoading = RxBool(false);
  TextEditingController addressCtrl;
  TextEditingController cityCtrl;
  TextEditingController stateCtrl;
  TextEditingController mobileCtrl;
  TextEditingController portalCodeCtrl;
  TextEditingController countryCtrl;
  @override
  void onInit() {
    super.onInit();
    addressCtrl = TextEditingController();
    cityCtrl = TextEditingController();
    stateCtrl = TextEditingController();
    countryCtrl = TextEditingController();
    mobileCtrl = TextEditingController();
    portalCodeCtrl = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  String validateNotEmpty(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  Future<void> submitShippingAddress() async {
    if (addressFormKey.currentState.validate()) {
      try {
        isLoading(true);
        final result = await cartProvider.addShippingAddress(
            addressCtrl.text,
            cityCtrl.text,
            stateCtrl.text,
            countryCtrl.text,
            mobileCtrl.text,
            portalCodeCtrl.text);
        isLoading(false);
        addressCtrl.dispose();
        cityCtrl.clear();
        stateCtrl.clear();
        mobileCtrl.clear();
        portalCodeCtrl.clear();
        countryCtrl.clear();
        Get.snackbar("Success", "Adding Shipping Address was successful");
      } catch (e) {
        Get.snackbar("Fial", "Adding Shipping Address Failed");
        isLoading(false);
      }
    }

    return;
  }

  @override
  void onClose() {
    addressCtrl.dispose();
    cityCtrl.dispose();
    stateCtrl.dispose();
    mobileCtrl.dispose();
    portalCodeCtrl.dispose();
    countryCtrl.dispose();
  }
}
