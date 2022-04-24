import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/utils/constants.dart';

class GeneralProvider extends GetConnect {
  final localStorage = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = base_url;
  }

  setTokenHeader() {
    final token = localStorage.read('token').toString();
    if (token != null) {
      httpClient.addRequestModifier((request) {
        request.headers['Authorization'] = "Bearer $token";
        return request;
      });
    }
  }

  Future<dynamic> getProducts() async {
    final Response response = await get(products_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> addToCart(dynamic payload) async {
    final Response response = await post(
        "$add_to_cart_url${payload.id}", {"productQuantity": payload.quantity});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> addOrder(dynamic payload) async {
    final Response response = await post(
        "$add_to_cart_url${payload.id}", {"productQuantity": payload.quantity});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> viewCart(dynamic payload) async {
    final token = localStorage.read('token').toString();
    print(token);

    final Response response = await post(
        "$add_to_cart_url${payload.id}", {"productQuantity": payload.quantity});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> createOrder(dynamic payload) async {
    final user = localStorage.read('user');
    final Response response = await post(create_order_url, {
      "firstName": user['fullname'].split(' ')[0],
      "lastName": user['fullname'].split(' ')[1],
      "orderNumber": payload['orderNumber'],
      "country": "nigeria",
      "address": user['addAddress'][0]['address'],
      "city": user['addAddress'][0]['city'],
      "state": user['addAddress'][0]['state'],
      "postCode": "000000",
      "phone": user['phone'],
      "email": user['email'],
      "additionalInfo": "none",
      "products": payload['products']
          .map((x) => ({
                "productId": x['product']['_id'],
                "productName": x['product']['name'],
                "quantityOrdered": x['quantity'],
                "productPrice": x['product']['price'],
                "totalPricePurchase": x['product']['price'] * x['quantity'],
                "productImage": x['product']['image'][0],
              }))
          .toList(),
      "total": payload['total']
    });
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> createReview(dynamic payload) async {
    final Response response = await post('$review_url${payload['product_id']}',
        {'rating': payload['rating'], 'message': payload['message']});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getCategories() async {
    final Response response = await get(categories_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getOrders() async {
    final userEmail = localStorage.read('user')['email'];
    final Response response = await get("$get_order_by_email_url$userEmail");
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }
}
