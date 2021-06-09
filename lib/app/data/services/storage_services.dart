import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices extends GetxService {
  final localStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> setStorage(String key, dynamic data) async {
    try {
      await localStorage.write(key, data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
