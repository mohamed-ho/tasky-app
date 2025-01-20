import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constant/app_colors.dart';

class CustomTab extends StatelessWidget {
  const CustomTab(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.onTap});
  final bool isSelected;
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.w),
            color:
                isSelected ? AppColors.mainAppColor : AppColors.unSelectedTab),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              color: isSelected ? Colors.white : Colors.grey),
        ),
      ),
    );
  }
}
