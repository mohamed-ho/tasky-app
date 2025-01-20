import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constant/app_colors.dart';

class AppTextThemes {
  static TextStyle fontDMweight700Size24 = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 24.sp, color: Colors.black);

  static TextStyle fontDMWight400Size14 = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColors.textGrey,
      height: .8);
  static TextStyle fontDMWight700Size19 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 19.sp,
  );

  static TextStyle customTextFormFieldHintTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColors.textfieldGrey);
  static TextStyle fontDMWight400Size14ColorMainColorStyleUnderLine = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: AppColors.mainAppColor,
      decoration: TextDecoration.underline);
}
