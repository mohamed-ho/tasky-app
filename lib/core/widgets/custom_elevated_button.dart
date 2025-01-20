import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/config/themes/app_text_themes.dart';
import 'package:tasky/core/constant/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.onPressed, this.icon, required this.text});
  final void Function()? onPressed;
  final String text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50.h),
          backgroundColor: AppColors.mainAppColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          foregroundColor: Colors.white),
      onPressed: onPressed,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: AppTextThemes.fontDMWight700Size19),
          icon ?? const SizedBox(),
        ],
      ),
    );
  }
}
