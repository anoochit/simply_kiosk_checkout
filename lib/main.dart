import 'package:flutter/material.dart';
import 'package:fullscreen_window/fullscreen_window.dart';

import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // enable wake lock
  WakelockPlus.enable();

  // set fullscreen
  FullScreenWindow.setFullScreen(true);

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: themeData,
    ),
  );
}
