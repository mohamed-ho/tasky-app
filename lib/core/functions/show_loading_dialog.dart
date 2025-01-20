import 'package:flutter/material.dart';

Future<dynamic> showLoadingDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
      barrierDismissible: false);
}
