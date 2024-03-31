import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../views/views/rounded_rectangle_button_view.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check out'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 128,
              padding: const EdgeInsets.all(16.0),
              child: RoundedRectangleButtonView(
                title: 'Credit / Debit Card',
                onTap: () {
                  // TODO : process checkout with credit card
                  Get.toNamed(Routes.PAYMENT);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 128,
              padding: const EdgeInsets.all(16.0),
              child: RoundedRectangleButtonView(
                title: 'Truemoney',
                onTap: () {
                  // TODO : process checkout with truemoney
                  Get.toNamed(Routes.PAYMENT);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 128,
              padding: const EdgeInsets.all(16.0),
              child: RoundedRectangleButtonView(
                title: 'Thai QR Payment',
                onTap: () {
                  // TODO : process checkout with thai qr payment
                  Get.toNamed(Routes.PAYMENT);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
