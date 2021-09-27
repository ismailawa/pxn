import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/modules/airtime/billers_response_model.dart';
import 'package:pxn_mobile/app/modules/dataBundle/data_dto.dart';
import 'package:pxn_mobile/app/modules/utilities/air_request.dto.dart';
import 'package:pxn_mobile/utils/constants.dart';

class UtilitiesProvider extends GetConnect {
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

  Future<BillersresponseModel> getAirtimeBiller() async {
    final response = await get(air_biller_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      print(response.body);
      return BillersresponseModel.fromJson(
          response.body as Map<String, dynamic>);
    }
  }

  Future<dynamic> purchaceAirtime(AirRequestDto requestDto) async {
    final response = await post(air_request_url, requestDto.toMap());
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getDataProviders() async {
    final response = await get(data_providers_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getCableProviders() async {
    final response = await get(cable_providers_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getDataBundles(String serviceType) async {
    final response =
        await post(data_bundles_url, {"service_type": serviceType});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> purchaseDataBundles(DataDto dataDto) async {
    final response = await post(purcharce_data_bundles_url, dataDto.toJson());
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getElectricityProvider() async {
    final response = await get(get_electricity_provider_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> verifyElectricityAccount(Map<String, dynamic> info) async {
    final response = await post(verify_electricity_account_url, info);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> purchaceElectricity(Map<String, dynamic> info) async {
    final response = await post(purchase_electricity_account_url, info);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getCableProvider() async {
    final response = await get(get_electricity_provider_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> verifyCableAccount(Map<String, dynamic> info) async {
    final response = await post(verify_cable_account_url, info);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> verifyWalletAccount(String username) async {
    final response = await get("$user_wallet_confirmation_url$username");
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> transferWalletToWallet(Map<String, dynamic> info) async {
    final response = await post(wallet_transfer_url, info);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getMultipleChoice(Map<String, dynamic> info) async {
    final response = await post(get_multichoice_list_cable, info);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getMultipleChoiceAddons(Map<String, dynamic> info) async {
    final response = await post(purchase_electricity_account_url, info);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> purchaseCable(Map<String, dynamic> info) async {
    final response = await post(purchase_electricity_account_url, info);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }
}
