import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/modules/login/user_model.dart';

class ProfileController extends GetxController {
  final localStorage = GetStorage();
  Rx<User> user = Rx<User>(null);
  @override
  void onInit() {
    super.onInit();
    localStorage.listenKey("profile", (u) {
      User decodedUser = User.fromJson(u);
      user(decodedUser);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
