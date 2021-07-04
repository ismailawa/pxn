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
    final response = await post(
        purcharce_data_bundles_url, {"service_type": dataDto.toJson()});
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }
}
