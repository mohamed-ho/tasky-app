import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constant/app_colors.dart';

class CustomChooseImageOfTodo extends StatelessWidget {
  const CustomChooseImageOfTodo({super.key, required this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DottedBorder(
            color: AppColors.mainAppColor,
            dashPattern: const [1, 1],
            radius: Radius.circular(10.w),
            borderType: BorderType.RRect,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      color: AppColors.mainAppColor,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Add Img',
                      style: TextStyle(
                          color: AppColors.mainAppColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 19.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
