import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/utils/constants.dart';

class OrdersProvider extends GetConnect {
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

  Future<dynamic> getAllOrders(int userId) async {
    try {
      final response = await get("$get_orders_url$userId/all");

      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }

  Future<dynamic> getOrderDetails(String reference) async {
    try {
      final response = await get("$get_orders_url$reference/details");

      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        print(response.body);
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }

  Future<dynamic> confirmOrder(String reference) async {
    try {
      final response =
          await put("$get_orders_url/item/confirm", {"reference": reference});

      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        print(response.body);
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }
}
