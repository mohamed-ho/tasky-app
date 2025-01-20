import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constant/app_colors.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget(
      {super.key, required this.subTitle, required this.title, this.trailing});
  final String title;
  final String subTitle;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.profileItembackground,
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
            trailing: trailing),
      ),
    );
  }
}
