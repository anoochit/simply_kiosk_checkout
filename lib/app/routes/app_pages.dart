import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/checkout/bindings/checkout_binding.dart';
import '../modules/checkout/views/checkout_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/phone_signIn/bindings/phone_sign_in_binding.dart';
import '../modules/phone_signIn/views/phone_sign_in_view.dart';
import '../modules/thankyou/bindings/thankyou_binding.dart';
import '../modules/thankyou/views/thankyou_view.dart';
import '../modules/verify_code/bindings/verify_code_binding.dart';
import '../modules/verify_code/views/verify_code_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PHONE_SIGN_IN,
      page: () => const PhoneSignInView(),
      binding: PhoneSignInBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.THANKYOU,
      page: () => const ThankyouView(),
      binding: ThankyouBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.VERIFY_CODE,
      page: () => const VerifyCodeView(),
      binding: VerifyCodeBinding(),
    ),
  ];
}
