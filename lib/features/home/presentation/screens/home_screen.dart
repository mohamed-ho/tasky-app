import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/config/themes/app_text_themes.dart';
import 'package:tasky/core/constant/app_colors.dart';
import 'package:tasky/core/functions/show_error_dialog.dart';
import 'package:tasky/core/functions/show_loading_dialog.dart';
import 'package:tasky/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tasky/features/home/presentation/widgets/home_content_widget.dart';
import 'package:tasky/tasky_enjection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Logo',
                  style: AppTextThemes.fontDMweight700Size24,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.profileScreen),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(320),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Icon(
                          Icons.person_2_outlined,
                          color: Colors.black,
                          size: 20.w,
                        ),
                      ),
                    ),
                    BlocProvider(
                      create: (context) => ls<AuthCubit>(),
                      child: BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthLoadingState) {
                            showLoadingDialog(context);
                          } else if (state is AuthErrorState) {
                            Navigator.pop(context);
                            showErrorDialog(context, state.message);
                          } else if (state is AuthLoadedState) {
                            Navigator.pop(context);
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoutes.loginScreen, (route) => false);
                          }
                        },
                        child: Builder(builder: (context) {
                          return IconButton(
                              onPressed: () {
                                BlocProvider.of<AuthCubit>(context).logout();
                              },
                              icon: Icon(
                                Icons.logout_outlined,
                                color: AppColors.mainAppColor,
                              ));
                        }),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const Text(
              'My Tasks',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
          ),
          const Expanded(child: HomeContentWidget())
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'first',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(320.w),
            ),
            foregroundColor: AppColors.mainAppColor,
            backgroundColor: AppColors.unSelectedTab,
            focusColor: AppColors.unSelectedTab,
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.scanCodeScreen),
            child: const Icon(Icons.qr_code_2_rounded),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: 'second',
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.addTodoScreen),
            backgroundColor: AppColors.mainAppColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(320.w),
                side: BorderSide(color: AppColors.mainAppColor)),
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
