import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/modules/cart/providers/cart_provider.dart';

class AddShippingAddressController extends GetxController {
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  CartProvider cartProvider = Get.put(CartProvider());
  AuthProvider authProvider = Get.put(AuthProvider());
  final localStorage = GetStorage();

  RxBool isLoading = RxBool(false);
  TextEditingController addressCtrl;

  String selectedState;
  String selectedLGA;

  @override
  void onInit() {
    super.onInit();
    addressCtrl = TextEditingController();
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
          selectedState,
          selectedLGA,
        );
        isLoading(false);
        final userData = await authProvider.loginWithToken();
        await localStorage.write('user', userData['user']);
        Get.back();
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
  }
}
