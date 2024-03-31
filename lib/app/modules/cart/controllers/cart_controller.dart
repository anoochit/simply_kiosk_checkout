import 'dart:developer';

import 'package:get/get.dart';
import 'package:simply_kiosk_checkout/app/data/mock_data.dart';
import 'package:simply_kiosk_checkout/app/data/models/cart_item.dart';

class CartController extends GetxController {
  RxString barcode = ''.obs;

  List<CartItem> cartItems = <CartItem>[];

  RxDouble cartTotalPrice = 0.0.obs;

  // FIXME : add product from database
  void addItem2Card({required String barcode}) {
    // find product
    final product = products.firstWhereOrNull(
      (element) => element.id == barcode,
    );
    // has product
    if (product != null) {
      final itemExist =
          cartItems.firstWhereOrNull((element) => element.id == product.id);
      // product exist add qt
      if (itemExist != null) {
        itemExist.qt += 1;
        itemExist.total = itemExist.price * itemExist.qt;
      } else {
        // first add
        cartItems.add(
          CartItem(
            id: product.id,
            title: product.title,
            qt: 1,
            total: product.price,
            price: product.price,
          ),
        );
      }
    }

    calculateCartTotalPrice();
    update();
  }

  void increaseQuantity({required String barcode}) {
    final item = cartItems.firstWhereOrNull((element) => element.id == barcode);

    if (item != null) {
      item.qt += 1;
      item.total = item.price * item.qt;
    }

    calculateCartTotalPrice();
    update();
  }

  void decreaseQuantity({required String barcode}) {
    final item = cartItems.firstWhereOrNull((element) => element.id == barcode);

    if (item != null) {
      item.qt -= 1;
      item.total = item.price * item.qt;
      if (item.qt == 0) {
        cartItems.removeWhere((element) => element.id == item.id);
      }
    }

    calculateCartTotalPrice();
    update();
  }

  void calculateCartTotalPrice() {
    double total = 0.0;
    for (var element in cartItems) {
      total += element.total;
      log('${element.id}-${element.qt}');
    }

    cartTotalPrice.value = total;

    update();
  }
}
