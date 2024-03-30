import 'package:flutter/material.dart';

final themeData = ThemeData(
  colorSchemeSeed: Colors.red,
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.red,
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    toolbarHeight: 96.0,
    titleTextStyle: TextStyle(
      fontSize: 40.0,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(
      size: 64.0,
      color: Colors.white,
    ),
  ),
  listTileTheme: const ListTileThemeData(
    titleTextStyle: TextStyle(
      fontSize: 36.0,
      color: Colors.black,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      textStyle: const TextStyle(
        fontSize: 36.0,
        color: Colors.white,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 40.0,
        color: Colors.white,
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 38.0,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontSize: 40.0,
      color: Colors.red,
      fontWeight: FontWeight.w600,
    ),
  ),
);
