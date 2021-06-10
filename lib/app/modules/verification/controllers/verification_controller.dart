import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/utils/helpers.dart';

class VerificationController extends GetxController {
  var user = Get.arguments;
  AuthProvider authProvider = Get.find<AuthProvider>();
  final localStorage = GetStorage();

  GlobalKey<FormState> verificationFormKey = GlobalKey<FormState>();
  TextEditingController tokenCtrl;

  VerificationController();

  @override
  void onInit() {
    super.onInit();
    tokenCtrl = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<dynamic> verifyToken() async {
    final isValid = verificationFormKey.currentState.validate();
    if (!isValid) return;
    try {
      loadingView("Verifying token");
      final result = await authProvider.verifyToken(tokenCtrl.text);
      await localStorage.write("isLogin", true);
      await localStorage.write('user', result['data']);
      Get.offAllNamed('/dashboard');
    } catch (error) {
      Get.snackbar("Verification", "Token verification failed $error");
    }
  }

  Future<dynamic> resendToken() async {
    try {
      loadingView("Verifying token");
      printInfo(info: user.username);
      final result = await authProvider.reTokensend(user.username);
      Get.back();
      Get.snackbar("Verification", "${result.message}");
    } catch (error) {
      Get.back();
      Get.snackbar(
          "Verification", "Token verification failed ${error?.message}");
    }
  }

  @override
  void onClose() {
    tokenCtrl.dispose();
  }

  String validateToken(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }

    if (!value.isNum) {
      return 'Inputs most be number';
    }

    if (value.length > 5 || value.length < 5) {
      return 'Four digits required';
    }

    return null;
  }
}
