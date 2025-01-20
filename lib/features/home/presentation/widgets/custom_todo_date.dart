import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tasky/core/functions/get_todo_status_background.dart';
import 'package:tasky/core/functions/get_todo_status_forground.dart';

class CustomTodoDate extends StatelessWidget {
  const CustomTodoDate(
      {super.key,
      required this.status,
      required this.initialDate,
      required this.onTap});
  final String status;
  final DateTime initialDate;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: getTodoStatusBackground(status)),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            title: Text(
              'End Date',
              style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            subtitle: Text(DateFormat('dd MMM, yyyy').format(initialDate),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black)),
            trailing: Icon(
              Icons.calendar_month,
              color: getTodoStatusForground(status),
            ),
          ),
        ),
      ),
    );
  }
}
