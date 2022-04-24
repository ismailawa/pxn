import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/utils/helpers.dart';

class LoginController extends GetxController {
  AuthProvider authProvider = Get.find<AuthProvider>();
  final localStorage = GetStorage();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController email;
  TextEditingController password;
  RxBool isSubmited = false.obs;
  RxBool togglePassword = false.obs;

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<dynamic> login() async {
    final isValid = loginFormKey.currentState.validate();

    if (!isValid) {
      return;
    }

    try {
      isSubmited(true);
      loadingView("Authenticating");

      final result = await authProvider.login(email.text.trim(), password.text.trim());
      print(result);
      await localStorage.write("isLogin", true);
      await localStorage.write('user', result['user']);
      await localStorage.write('token', result['token']);
      Get.back();
      Get.snackbar("Login", "You have sucessfully login");
      Future.delayed(Duration(seconds: 3), () {
        Get.offAndToNamed('/checkout');
        isSubmited(false);
      });
    } catch (e) {
      Get.back();
      Get.snackbar("Login Error ", "Login failed $e");
    }
  }

  String validateUsername(String value) {
    if (value.isEmpty) {
      return 'email is required';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
  }
}

// class LoadingView extends StatelessWidget {
//   const LoadingView({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: Colors.white,
//       ),
//       child: Center(child: CircularProgressIndicator()),
//     );
//   }
// }
