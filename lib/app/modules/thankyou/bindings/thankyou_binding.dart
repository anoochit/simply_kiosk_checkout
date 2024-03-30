import 'package:get/get.dart';

import '../controllers/thankyou_controller.dart';

class ThankyouBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThankyouController>(
      () => ThankyouController(),
    );
  }
}
