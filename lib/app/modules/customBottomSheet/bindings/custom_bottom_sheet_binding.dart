import 'package:get/get.dart';

import '../controllers/custom_bottom_sheet_controller.dart';

class CustomBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomBottomSheetController>(
      () => CustomBottomSheetController(),
    );
  }
}
