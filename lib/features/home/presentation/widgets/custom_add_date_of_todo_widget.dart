import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tasky/core/constant/app_colors.dart';

class CustomAddDateOfTodoWidget extends StatelessWidget {
  const CustomAddDateOfTodoWidget(
      {super.key, required this.dateTime, required this.onTap});
  final DateTime? dateTime;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Due Date',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 5.h,
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateTime == null
                        ? 'choose due date...'
                        : DateFormat('dd/MMM/yyyy').format(dateTime!),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Icon(
                    Icons.calendar_month_rounded,
                    color: AppColors.mainAppColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
