import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RoundedRectangleButtonView extends GetView {
  const RoundedRectangleButtonView(
      {super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(),
      onPressed: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
        ),
      ),
    );
  }
}
