import 'package:get/get.dart';
import 'package:pxn_mobile/app/data/models/user_reg_dto.dart';
import 'package:pxn_mobile/utils/constants.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = base_url;
  }

  Future<dynamic> login(String username, String password) async {
    final Response response =
        await post(login_url, {"username": username, "password": password});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> register(UserRegDto user) async {
    final Response response = await post(register_url, user.toMap());
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }
}
