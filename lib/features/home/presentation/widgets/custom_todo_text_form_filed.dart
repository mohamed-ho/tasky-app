import 'package:flutter/material.dart';

class CustomTodoTextFormField extends StatelessWidget {
  const CustomTodoTextFormField(
      {super.key,
      required this.controller,
      this.validator,
      required this.hintText,
      this.maxline,
      this.style});
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final int? maxline;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      controller: controller,
      validator: validator,
      maxLines: maxline,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
        fillColor: Colors.transparent,
        filled: true,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
    );
  }
}
