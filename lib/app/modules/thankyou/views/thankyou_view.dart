import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/thankyou_controller.dart';

class ThankyouView extends GetView<ThankyouController> {
  const ThankyouView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Thank You',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
