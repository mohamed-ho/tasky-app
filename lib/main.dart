import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/tasky.dart';
import 'package:tasky/tasky_enjection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await TaskyEnjection().init();
  runApp(const Tasky());
}
