import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../views/views/rounded_rectangle_button_view.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView {
  CartView({super.key});

  final FocusNode mainFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return KeyboardListener(
            autofocus: true,
            focusNode: mainFocusNode,
            onKeyEvent: (event) {
              if (event is KeyDownEvent) {
                if (event.logicalKey != LogicalKeyboardKey.enter) {
                  controller.barcode.value =
                      controller.barcode.value + event.character!;
                } else {
                  // FIXME : use complete barcode to query product in database

                  final barcode = controller.barcode.value;
                  log(barcode);
                  controller.addItem2Card(barcode: barcode);

                  // clear current barcode
                  controller.barcode.value = '';
                }
              }
            },
            child: Scaffold(
                appBar: AppBar(
                  title: const Text('Shopping Cart'),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    // list items from barcode scanner
                    (controller.cartItems.isNotEmpty)
                        ? Expanded(
                            child: ListView.builder(
                            itemCount: controller.cartItems.length,
                            itemBuilder: (context, index) {
                              // TODO : show a product title with qt and price
                              final item = controller.cartItems[index];
                              return ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.title),
                                    Row(
                                      children: [
                                        IconButton.filledTonal(
                                          onPressed: () {
                                            // decress qt
                                            controller.decreaseQuantity(
                                              barcode: item.id,
                                            );
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 100,
                                          child: Text(
                                            '${item.qt}',
                                          ),
                                        ),
                                        IconButton.filledTonal(
                                          onPressed: () {
                                            // increase qt
                                            controller.increaseQuantity(
                                              barcode: item.id,
                                            );
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ))
                        : const Expanded(
                            child: Center(
                              child: Text('Scan Barcode'),
                            ),
                          ),
                    // total
                    Visibility(
                      visible: (controller.cartItems.isNotEmpty),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total : '),
                            Text('${controller.cartTotalPrice}'),
                          ],
                        ),
                      ),
                    ),
                    // button
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: 4 / 1,
                        ),
                        children: [
                          // cancel
                          RoundedRectangleButtonView(
                            title: 'Cancel',
                            onTap: () {
                              // TODO : clear cart and goto home page
                              controller.cartItems.clear();
                              Get.offAllNamed(Routes.HOME);
                            },
                          ),
                          // checkout
                          RoundedRectangleButtonView(
                            title: 'Check out',
                            onTap: () {
                              // TODO: save cart data and goto checkout
                              Get.toNamed(Routes.CHECKOUT);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
