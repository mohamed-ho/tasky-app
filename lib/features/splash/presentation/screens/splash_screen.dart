import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/features/splash/presentation/widgets/splash_content.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/splash.png',
              height: 450.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SplashContent()
          ],
        ),
      ),
    );
  }
}
