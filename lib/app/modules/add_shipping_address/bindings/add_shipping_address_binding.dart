import 'package:get/get.dart';

import '../controllers/add_shipping_address_controller.dart';

class AddShippingAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddShippingAddressController>(
      () => AddShippingAddressController(),
    );
  }
}
