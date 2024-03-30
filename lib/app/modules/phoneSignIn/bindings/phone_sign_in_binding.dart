import 'package:get/get.dart';

import '../controllers/phone_sign_in_controller.dart';

class PhoneSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneSignInController>(
      () => PhoneSignInController(),
    );
  }
}
