import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showErrorDialog(BuildContext context, String message) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'Error',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(message),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: const Text('OK'),
              )
            ],
          ));
}
