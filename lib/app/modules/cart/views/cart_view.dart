import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../views/views/rounded_rectangle_button_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text('d'),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 3 / 1,
              ),
              children: [
                // member
                RoundedRectangleButtonView(
                  title: 'Cancel',
                  onTap: () => Get.offAllNamed(Routes.HOME),
                ),
                // not member
                RoundedRectangleButtonView(
                  title: 'Check out',
                  onTap: () => Get.toNamed(Routes.CHECKOUT),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
