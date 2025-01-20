import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constant/app_colors.dart';
import 'package:tasky/core/constant/list_of_experience_level.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  const CustomDropdownButtonFormField(
      {super.key, this.onChanged, required this.value});
  final void Function(String?)? onChanged;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: 'choose experience Level',
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
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "please choose experience ";
          }
          return null;
        },
        value: value,
        items: experienceLevel
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text((e)),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
