import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
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

  Future<dynamic> getAirtimeBiller() async {
    final response = await get(air_biller_url);
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }

  Future<dynamic> getDataProviders(AirRequestDto requestDto) async {
    final response = await post(air_request_url, requestDto.toMap());
    if (response.status.hasError) {
      throw Exception(response.statusText);
    } else {
      return response.body;
    }
  }
}
