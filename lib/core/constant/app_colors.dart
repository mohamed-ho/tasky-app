import 'package:flutter/material.dart';

class AppColors {
  static Color textGrey = _hexToColor("#6E6A7C");
  static Color mainAppColor = _hexToColor("#5F33E1");
  static Color textfieldGrey = _hexToColor("#BABABA");
  static Color unSelectedTab = _hexToColor("#F0ECFF");
  static Color finishedTaskTypeBackColor = _hexToColor("#E3F2FF");
  static Color finishedTaskTypeColor = _hexToColor("#2B9BFF");
  static Color watingTaskTypeBackColor = _hexToColor("#FFE4F2");
  static Color watingTaskTypeColor = _hexToColor("#FF9171");
  static Color inProgressTaskTypeBackColor = _hexToColor("#F0ECFF");
  static Color inProgressTaskTypeColor = _hexToColor("#9578EC");
  static Color profileItembackground = _hexToColor("#F5F5F5");
}

Color _hexToColor(String hexColor) {
  hexColor = hexColor.replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF$hexColor'; // Add alpha value if not provided
  }
  return Color(int.parse('0x$hexColor'));
}
