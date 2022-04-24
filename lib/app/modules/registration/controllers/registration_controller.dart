import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/models/user_reg_dto.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/utils/constants.dart';

class RegistrationController extends GetxController {
  // Injected Properties
  final AuthProvider authProvider;

  // Formstate globalkey
  GlobalKey<FormState> registrationFormkey = GlobalKey<FormState>();

  // Public properties
  TextEditingController fullNameCtrl;
  TextEditingController phoneCtrl;
  TextEditingController emailCtrl;
  TextEditingController passwordCtrl;

  RegistrationController(this.authProvider);

  @override
  void onInit() {
    super.onInit();
    fullNameCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<dynamic> register() async {
    // Form validation
    final isValid = registrationFormkey.currentState.validate();

    if (!isValid) {
      return;
    }

    if(fullNameCtrl.text.split(" ").length < 2) {
      Get.snackbar('Full Name', "Please full name is required");
      return;
    }

    final user = UserRegDto(
      fullname: fullNameCtrl.text.trim(),
      phone: phoneCtrl.text.trim(),
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
    );

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
      await authProvider.register(user);
      Get.back();
      Get.snackbar("Registration", "You have sucessfully Register");
      Future.delayed(Duration(seconds: 3), () {
        Get.back();
      });
    } catch (error) {
      Get.back();
      Get.snackbar("Registration Error ", "Resgitration failed $error");
    }
  }

  String validateFirstName(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String validateLastName(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String validateUsername(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String validatePhone(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  @override
  void onClose() {
    fullNameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
  }
}
