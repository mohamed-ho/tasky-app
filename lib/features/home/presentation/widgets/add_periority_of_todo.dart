import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/features/home/presentation/widgets/custom_todo_periority_drop_down_widget.dart';

class AddPeriorityOfTodo extends StatelessWidget {
  const AddPeriorityOfTodo(
      {super.key, required this.onChanged, required this.periority});
  final dynamic Function(String?)? onChanged;
  final String periority;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'periority',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTodoPeriorityDropDownWidget(
              initialValue: periority,
              pirority: const [
                'medium',
                'high',
                'low',
              ],
              onChanged: onChanged),
        ],
      ),
    );
  }
}
