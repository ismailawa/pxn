import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/models/user_reg_dto.dart';
import 'package:pxn_mobile/utils/constants.dart';

class AuthProvider extends GetConnect {
  final localStorage = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = base_url;
  }

  setTokenHeader() {
    final token = localStorage.read('token').toString();
    if (token != null) {
      // It's will attach 'apikey' property on header from all requests
      httpClient.addRequestModifier((request) {
        request.headers['x-access-token'] = token;
        return request;
      });
    }
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
      printError(info: response.body.toString());
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<void> getUserProfile() async {
    setTokenHeader();
    final Response response = await get(user_profile_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      await localStorage.write('profile', response.body['data']);
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
