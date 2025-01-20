import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/config/themes/app_text_themes.dart';

import 'package:tasky/core/widgets/custom_elevated_button.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        children: [
          Text(
            'Task Management &\nTo-Do List',
            style: AppTextThemes.fontDMweight700Size24,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            '''This productive tool is designed to help\n
      you better manage your task\n 
      project-wise conveniently!''',
            style: AppTextThemes.fontDMWight400Size14,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h),
            child: CustomElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.loginScreen, (route) => true),
              text: "Let's Start",
              icon: const Icon(Icons.arrow_forward),
            ),
          )
        ],
      ),
    );
  }
}
