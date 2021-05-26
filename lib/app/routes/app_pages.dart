import 'package:get/get.dart';

import 'package:pxn_mobile/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:pxn_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:pxn_mobile/app/modules/forgotpassword/bindings/forgotpassword_binding.dart';
import 'package:pxn_mobile/app/modules/forgotpassword/views/forgotpassword_view.dart';
import 'package:pxn_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:pxn_mobile/app/modules/login/views/login_view.dart';
import 'package:pxn_mobile/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:pxn_mobile/app/modules/onboarding/views/onboarding_view.dart';
import 'package:pxn_mobile/app/modules/registration/bindings/registration_binding.dart';
import 'package:pxn_mobile/app/modules/registration/views/registration_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
