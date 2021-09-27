import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/utils/constants.dart';

class EcommerceProvider extends GetConnect {
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
        request.headers['x-access-token'] = token;
        return request;
      });
    }
  }

  Future<dynamic> getAllCategories() async {
    try {
      final response = await get(ecommerce_categories_url);

      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }

  Future<dynamic> getAllProducts() async {
    try {
      final response = await get(ecommerce_products_url);

      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }
}
