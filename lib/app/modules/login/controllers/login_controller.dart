import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/utils/constants.dart';

class LoginController extends GetxController {
  final AuthProvider authProvider;

  TextEditingController username;
  TextEditingController password;
  RxBool isSubmited = false.obs;
  RxBool togglePassword = false.obs;

  LoginController(this.authProvider);

  @override
  void onInit() {
    super.onInit();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<dynamic> login() async {
    try {
      isSubmited(true);
      Get.defaultDialog(
          title: "Autheticating",
          content: Column(
            children: [
              CircularProgressIndicator.adaptive(
                backgroundColor: pxnPrimaryColor,
              ),
            ],
          ));
      final result = await authProvider.login(username.text, password.text);
      Get.back();
      Get.snackbar("Login", "You have sucessfully login");
      Future.delayed(Duration(seconds: 5), () {
        Get.offAndToNamed('/dashboard');
        isSubmited(false);
      });
    } catch (e) {
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
