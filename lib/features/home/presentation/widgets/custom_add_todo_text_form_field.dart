import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddTodoTextFormField extends StatelessWidget {
  const CustomAddTodoTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.lable,
      this.maxLine});
  final TextEditingController controller;
  final String lable;
  final String hintText;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: const TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            controller: controller,
            maxLines: maxLine,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please this field can not be empty";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
