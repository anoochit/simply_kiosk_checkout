import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/verify_code_controller.dart';

class VerifyCodeView extends GetView<VerifyCodeController> {
  const VerifyCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final buttons = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'D', '0'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Text(
                controller.otpNumber.value,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize:
                        Theme.of(context).textTheme.headlineLarge!.fontSize! *
                            2),
              ),
            ),
            const Gap(64.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 11,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) {
                  return (buttons[index] == 'D')
                      // delete
                      ? ElevatedButton(
                          onPressed: () {
                            final otpLength = controller.otpNumber.value.length;
                            if (otpLength > 0) {
                              controller.otpNumber.value = controller
                                  .otpNumber.value
                                  .substring(0, otpLength - 1);
                            }
                          },
                          child: const Icon(
                            Icons.backspace,
                            size: 32,
                          ))
                      // enter number
                      : ElevatedButton(
                          onPressed: () {
                            final otpLength = controller.otpNumber.value.length;
                            // insert number when less than 10 digits
                            if (otpLength < 6) {
                              controller.otpNumber.value =
                                  controller.otpNumber.value + buttons[index];

                              // auto verify when 6 digit
                              if (controller.otpNumber.value.length == 6) {
                                // TODO : send SMS to verify

                                // FIXME : mock verify
                                controller.otpNumber.value = '';
                                Get.offAllNamed(Routes.CART);
                              }
                            }
                          },
                          child: Text(
                            buttons[index],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
