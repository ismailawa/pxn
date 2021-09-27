import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/utils/constants.dart';

class CartProvider extends GetConnect {
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

  Future<dynamic> addToCart(int id, int qty) async {
    try {
      final response =
          await post(add_to_cart_url, {"product_id": id, "quantity": qty});

      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }

  Future<dynamic> getCart() async {
    try {
      final response = await get(get_cart_url);

      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error from here", e.toString());
    }
  }

  Future<dynamic> removeFromCart(int productId) async {
    try {
      print('$remove_item_cart_url/$productId');
      final response = await delete('$remove_item_cart_url$productId');

      if (response.status.hasError) {
        print(response.body);
        throw Exception(response.statusText);
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }

  Future<dynamic> decIncCartItem(
      int sessionId, int qty, int productIt, String type) async {
    try {
      print(sessionId);
      final response = await put('$dec_inc_item_cart_url/$sessionId/update',
          {"quantity": qty, "product_id": productIt, "type": type});

      if (response.status.hasError) {
        print(response.statusText);
        throw Exception(response.statusText);
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }

  Future<dynamic> addShippingAddress(String address, String city, String state,
      String country, String mobile, String postal) async {
    try {
      final response = await post(add_shoping_address_url, {
        "address_line1": address,
        "city": city,
        "state": state,
        "country": country,
        "mobile": mobile,
        "postal_code": postal,
      });

      if (response.status.hasError) {
        throw Exception(response.statusText);
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }

  Future<dynamic> checkoutCartItem(int sessionId) async {
    try {
      final response = await post('$checkout_cart_url$sessionId', {});

      if (response.status.hasError) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (e) {
      Get.snackbar("Server error", e.toString());
    }
  }
}
