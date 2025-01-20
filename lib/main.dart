import 'package:flutter/material.dart';
import 'package:tasky/tasky.dart';
import 'package:tasky/tasky_enjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TaskyEnjection().init();
  runApp(const Tasky());
}
