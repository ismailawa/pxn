import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/services/storage_services.dart';
import 'package:pxn_mobile/utils/constants.dart';

import 'app/modules/login/bindings/login_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  await initServices();
  runApp(Pxn());
}

class Pxn extends StatelessWidget {
  const Pxn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: pxnSecondaryColor,
          fontFamily: "Lato",
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
            bodyText2: TextStyle(color: Colors.black45),
          )),
      title: "Application",
      initialBinding: LoginBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

Future<void> initServices() async {
  Get.put(() => StorageServices());
}
