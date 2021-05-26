import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/models/user_reg_dto.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/utils/constants.dart';

class RegistrationController extends GetxController {
  // Injected Properties
  final AuthProvider authProvider;

  // Public properties
  TextEditingController firstNameCtrl;
  TextEditingController lastNameCtrl;
  TextEditingController usernameCtrl;
  TextEditingController phoneCtrl;
  TextEditingController emailCtrl;
  TextEditingController passwordCtrl;

  RegistrationController(this.authProvider);

  @override
  void onInit() {
    super.onInit();
    firstNameCtrl = TextEditingController();
    lastNameCtrl = TextEditingController();
    usernameCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<dynamic> register() async {
    final user = UserRegDto(
        firstName: firstNameCtrl.text,
        lastName: lastNameCtrl.text,
        username: usernameCtrl.text,
        phone: phoneCtrl.text,
        email: emailCtrl.text,
        password: passwordCtrl.text,
        role: 'user');

    try {
      Get.defaultDialog(
          title: "Autheticating",
          content: Column(
            children: [
              CircularProgressIndicator.adaptive(
                backgroundColor: pxnPrimaryColor,
              ),
            ],
          ));
      final result = await authProvider.register(user);
      Get.back();
      Get.snackbar("Registration",
          "You have sucessfully Register Token has been send to your email");
      Future.delayed(Duration(seconds: 3), () {
        Get.offAndToNamed('/dashboard');
      });
    } catch (error) {
      Get.back();
      Get.snackbar("Registration Error ", "Resgitration failed $error");
    }
  }

  @override
  void onClose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    usernameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
  }
}
