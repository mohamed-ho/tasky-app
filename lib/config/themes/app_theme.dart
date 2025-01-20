import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData? appTheme() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'DMSans',
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.transparent));
  }
}
