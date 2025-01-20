import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/config/themes/app_theme.dart';

class Tasky extends StatelessWidget {
  const Tasky({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 820),
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme(),
          onGenerateRoute: AppRoutes.routes,
          initialRoute: AppRoutes.splashScreen,
        ),
      ),
    );
  }
}
