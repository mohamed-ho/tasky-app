import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/core/functions/show_error_dialog.dart';
import 'package:tasky/core/functions/show_loading_dialog.dart';
import 'package:tasky/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tasky/features/auth/presentation/widgets/login_content_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            showLoadingDialog(context);
          } else if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.message);
          } else if (state is AuthLoadedState) {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.homeScreen, (route) => false);
          }
        },
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset(
              'assets/images/splash.png',
              width: double.infinity,
              height: 450.h,
              fit: BoxFit.fill,
            ),
            const LoginContentWidget()
          ],
        )),
      ),
    );
  }
}
