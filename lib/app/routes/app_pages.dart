import 'package:get/get.dart';

import 'package:pxn_mobile/app/modules/carby/bindings/carby_binding.dart';
import 'package:pxn_mobile/app/modules/carby/views/carby_view.dart';
import 'package:pxn_mobile/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:pxn_mobile/app/modules/dashboard/views/dashboard_view.dart';
import 'package:pxn_mobile/app/modules/ecommerce/bindings/ecommerce_binding.dart';
import 'package:pxn_mobile/app/modules/ecommerce/views/ecommerce_view.dart';
import 'package:pxn_mobile/app/modules/ecurrency/bindings/ecurrency_binding.dart';
import 'package:pxn_mobile/app/modules/ecurrency/views/ecurrency_view.dart';
import 'package:pxn_mobile/app/modules/forgotpassword/bindings/forgotpassword_binding.dart';
import 'package:pxn_mobile/app/modules/forgotpassword/views/forgotpassword_view.dart';
import 'package:pxn_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:pxn_mobile/app/modules/home/views/home_view.dart';
import 'package:pxn_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:pxn_mobile/app/modules/login/views/login_view.dart';
import 'package:pxn_mobile/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:pxn_mobile/app/modules/onboarding/views/onboarding_view.dart';
import 'package:pxn_mobile/app/modules/profile/bindings/profile_binding.dart';
import 'package:pxn_mobile/app/modules/profile/views/profile_view.dart';
import 'package:pxn_mobile/app/modules/registration/bindings/registration_binding.dart';
import 'package:pxn_mobile/app/modules/registration/views/registration_view.dart';
import 'package:pxn_mobile/app/modules/services/bindings/services_binding.dart';
import 'package:pxn_mobile/app/modules/services/views/services_view.dart';
import 'package:pxn_mobile/app/modules/transactions/bindings/transactions_binding.dart';
import 'package:pxn_mobile/app/modules/transactions/views/transactions_view.dart';
import 'package:pxn_mobile/app/modules/transfers/bindings/transfers_binding.dart';
import 'package:pxn_mobile/app/modules/transfers/views/transfers_view.dart';
import 'package:pxn_mobile/app/modules/utilities/bindings/utilities_binding.dart';
import 'package:pxn_mobile/app/modules/utilities/views/utilities_view.dart';
import 'package:pxn_mobile/app/modules/verification/bindings/verification_binding.dart';
import 'package:pxn_mobile/app/modules/verification/views/verification_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      // middlewares: [AuthMiddleware()],
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
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONS,
      page: () => TransactionsView(),
      binding: TransactionsBinding(),
    ),
    GetPage(
      name: _Paths.SERVICES,
      page: () => ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UTILITIES,
      page: () => UtilitiesView(),
      binding: UtilitiesBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFERS,
      page: () => TransfersView(),
      binding: TransfersBinding(),
    ),
    GetPage(
      name: _Paths.CARBY,
      page: () => CarbyView(),
      binding: CarbyBinding(),
    ),
    GetPage(
      name: _Paths.ECOMMERCE,
      page: () => EcommerceView(),
      binding: EcommerceBinding(),
    ),
    GetPage(
      name: _Paths.ECURRENCY,
      page: () => EcurrencyView(),
      binding: EcurrencyBinding(),
    ),
  ];
}
