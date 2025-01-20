import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/functions/get_priority_color.dart';

class ToDoPriorityWiget extends StatelessWidget {
  const ToDoPriorityWiget({super.key, required this.periority});
  final String periority;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.flag_outlined,
          color: getPriorityColor(periority),
        ),
        Text(
          periority,
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: getPriorityColor(periority)),
        )
      ],
    );
  }
}
