import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/config/themes/app_text_themes.dart';
import 'package:tasky/core/constant/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.hite = false,
      this.perfix,
      this.suffix,
      this.keyboardType,
      required this.controller,
      this.validator});
  final Widget? suffix;
  final Widget? perfix;
  final String hintText;
  final bool hite;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: hite,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefix: perfix,
          hintText: hintText,
          hintStyle: AppTextThemes.customTextFormFieldHintTextStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: BorderSide(
                color: AppColors.textfieldGrey,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: const BorderSide(
                color: Colors.red,
              )),
          fillColor: Colors.transparent,
          filled: true,
        ),
      ),
    );
  }
}
