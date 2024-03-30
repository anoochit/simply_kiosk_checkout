import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                onTap: () {},
              ),
            ),
            Container(
              width: double.infinity,
              height: 128,
              padding: const EdgeInsets.all(16.0),
              child: RoundedRectangleButtonView(
                title: 'Truemoney',
                onTap: () {},
              ),
            ),
            Container(
              width: double.infinity,
              height: 128,
              padding: const EdgeInsets.all(16.0),
              child: RoundedRectangleButtonView(
                title: 'Thai QR Payment',
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
