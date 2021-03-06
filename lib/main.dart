import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pxn_mobile/app/data/services/storage_services.dart';
import 'package:pxn_mobile/utils/constants.dart';

import 'app/data/providers/auth_provider.dart';
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
          fontFamily: "Roboto",
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
            bodyText2: TextStyle(color: Colors.black45),
          )),
      title: "Application",
      initialBinding: BindingsBuilder(() {
        Get.put(AuthProvider(), permanent: true);
      }),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageServices().init());
}
