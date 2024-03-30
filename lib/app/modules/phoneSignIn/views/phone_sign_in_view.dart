import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
                      : ElevatedButton(
                          onPressed: () {
                            final phonenumberLength =
                                controller.phoneNumber.value.length;
                            if (phonenumberLength < 10) {
                              controller.phoneNumber.value =
                                  controller.phoneNumber.value + buttons[index];
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
