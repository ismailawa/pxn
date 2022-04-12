import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/models/user_reg_dto.dart';
import 'package:pxn_mobile/utils/constants.dart';

class AuthProvider extends GetConnect {
  final localStorage = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = base_url;
    setTokenHeader();
  }

  setTokenHeader() {
    final token = localStorage.read('token').toString();
    if (token != null) {
      // It's will attach 'apikey' property on header from all requests
      httpClient.addRequestModifier((request) {
        request.headers['Authorization'] = "Bearer $token";
        return request;
      });
    }
  }

  Future<dynamic> login(String email, String password) async {
    final Response response =
        await post(login_url, {"email": email, "password": password});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> loginWithToken() async {
    setTokenHeader();
    final Response response = await get(login_url);
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

  Future<void> getUserProfile() async {
    final Response response = await get(login_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      await localStorage.write('user', response.body['user']);
    }
  }

  Future<dynamic> logout() async {
    try {
      await localStorage.write('isLogin', false);
      await localStorage.write('user', null);
      await localStorage.write('token', null);
      Get.offAndToNamed('/dashboard');
      Get.snackbar("Logout", "You have sucessfully logout");
    } catch (e) {
      Get.snackbar("Logout Error ", "Logout failed $e");
    }
  }

  Future<dynamic> verifyToken(String token) async {
    setTokenHeader();
    final Response response = await post(verify_url, {"otp": int.parse(token)});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> reTokensend(String username) async {
    setTokenHeader();
    final Response response =
        await post(resendtoken_url, {"username": username});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }
}
