import 'package:get/get.dart';

import '../controllers/data_bundle_controller.dart';

class DataBundleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataBundleController>(
      () => DataBundleController(),
    );
  }
}
