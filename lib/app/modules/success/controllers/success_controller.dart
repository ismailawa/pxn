import 'package:get/get.dart';

class SuccessController extends GetxController {
  RxString message = RxString("");
  RxString title = RxString("");
  RxString image = RxString("");
  RxBool status = RxBool(true);

  @override
  void onInit() {
    super.onInit();
    String mess = Get.arguments["message"];
    String mtitle = Get.arguments["title"];
    String mimage = Get.arguments["image"];
    bool mstatus = Get.arguments["status"];
    message(mess);
    title(mtitle);
    image(mimage);
    status(mstatus);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
