import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasky/core/functions/get_todo_status_background.dart';
import 'package:tasky/core/functions/get_todo_status_forground.dart';

class ToDoStatusWidget extends StatelessWidget {
  const ToDoStatusWidget({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          color: getTodoStatusBackground(status)),
      child: Text(
        status,
        style: TextStyle(color: getTodoStatusForground(status)),
      ),
    );
  }
}
