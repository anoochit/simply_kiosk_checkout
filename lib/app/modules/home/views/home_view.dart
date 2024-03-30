import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../views/views/rounded_rectangle_button_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          const Spacer(),
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
                  title: 'Member',
                  onTap: () => Get.toNamed(Routes.PHONE_SIGN_IN),
                ),
                // not member
                RoundedRectangleButtonView(
                  title: 'Non-member',
                  onTap: () => Get.offAllNamed(Routes.CART),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
