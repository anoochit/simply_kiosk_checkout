import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/phone_sign_in_controller.dart';

class PhoneSignInView extends GetView<PhoneSignInController> {
  const PhoneSignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'D', '0'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone SignIn'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Text(
                controller.phoneNumber.value,
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
                            final phonenumberLength =
                                controller.phoneNumber.value.length;
                            if (phonenumberLength > 0) {
                              controller.phoneNumber.value = controller
                                  .phoneNumber.value
                                  .substring(0, phonenumberLength - 1);
                            }
                          },
                          child: const Icon(
                            Icons.backspace,
                            size: 32,
                          ))
                      // enter number
                      : ElevatedButton(
                          onPressed: () {
                            final phonenumberLength =
                                controller.phoneNumber.value.length;
                            // insert number when less than 10 digits
                            if (phonenumberLength < 10) {
                              controller.phoneNumber.value =
                                  controller.phoneNumber.value + buttons[index];

                              // auto verify when 10 digit
                              if (controller.phoneNumber.value.length == 10) {
                                // TODO : send SMS to verify

                                // FIXME : mock verify
                                controller.phoneNumber.value = '';
                                Get.toNamed(Routes.VERIFY_CODE);
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
