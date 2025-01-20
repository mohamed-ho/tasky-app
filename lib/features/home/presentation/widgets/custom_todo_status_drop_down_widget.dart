import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/functions/get_todo_status_background.dart';
import 'package:tasky/core/functions/get_todo_status_forground.dart';

// ignore: must_be_immutable
class CustomTodoStatusDropDownWidget extends StatefulWidget {
  CustomTodoStatusDropDownWidget(
      {super.key,
      this.initialValue,
      required this.status,
      required this.onChanged});
  final List<String> status;
  String? initialValue;
  final Function(String?)? onChanged;
  @override
  State<CustomTodoStatusDropDownWidget> createState() =>
      _CustomTodoStatusDropDownWidgetState();
}

class _CustomTodoStatusDropDownWidgetState
    extends State<CustomTodoStatusDropDownWidget> {
  @override
  void initState() {
    super.initState();
    widget.initialValue = widget.initialValue ?? widget.status.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: DropdownButtonFormField<String>(
          value: widget.initialValue,
          dropdownColor: getTodoStatusBackground(widget.initialValue!),
          iconSize: 0,
          elevation: 0,
          decoration: InputDecoration(
            fillColor: getTodoStatusBackground(widget.initialValue!),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.transparent)),
          ),
          items: widget.status.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                width: .8.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value.replaceFirst(value[0], value[0].toUpperCase()),
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: getTodoStatusForground(widget.initialValue!)),
                    ),
                    Icon(Icons.arrow_drop_down,
                        color: getTodoStatusForground(widget.initialValue!)),
                  ],
                ),
              ),
            );
          }).toList(),
          onChanged: widget.onChanged),
    );
  }
}
