import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/utils/constants.dart';

class PaymentProvider extends GetConnect {
  final localStorage = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = base_url;
    setTokenHeader();
  }

  setTokenHeader() {
    final token = localStorage.read('token').toString();
    if (token != null) {
      // It's will attach 'TOKEN' property on header from all requests
      httpClient.addRequestModifier((request) {
        request.headers['x-access-token'] = token;
        return request;
      });
    }
  }

  Future<dynamic> initialisePayment(String amount) async {
    final Response response = await post(payment_initialisation_url,
        {"amount": double.parse(amount), "currency": "NGN"});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> confirmPayment(String ref, int txtId) async {
    final Response response =
        await get("$payment_confirmation_url?tx_ref=$ref&tx_id=$txtId");
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getUserWallet(String username) async {
    final Response response =
        await get(user_wallet_confirmation_url, query: {"username": username});

    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> walletTransfer(String holderId, double amount) async {
    final Response response = await post(wallet_transfer_url, {
      "holder_id": holderId,
      "amount": amount,
    });

    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }
}
