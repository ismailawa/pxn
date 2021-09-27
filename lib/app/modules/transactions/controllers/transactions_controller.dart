import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/providers/auth_provider.dart';
import 'package:pxn_mobile/app/data/providers/payment_provider.dart';
import 'package:pxn_mobile/app/modules/login/user_model.dart';

class TransactionsController extends GetxController {
  final localStorage = GetStorage();
  RxInt selectedIndex = RxInt(0);
  AuthProvider authProvider = Get.find<AuthProvider>();

  Rx<User> user = Rx<User>(null);

  @override
  void onInit() {
    super.onInit();

    localStorage.listenKey("profile", (u) {
      print(u);
      User decodedUser = User.fromJson(u);
      user(decodedUser);
    });
    getCurrentUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> getCurrentUser() async {
    try {
      await authProvider.getUserProfile();
    } catch (e) {
      Get.snackbar("Profile Error ", "Fetching Profile failed $e");
    }
  }

  void selectIndex(int index) {
    selectedIndex(index);
  }

  @override
  void onClose() {}
}
