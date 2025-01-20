import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasky/core/constant/skeltonizer_demo_data.dart';
import 'package:tasky/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tasky/features/home/presentation/widgets/profile_content_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Skeletonizer(
                child: ProfileContentWidget(
              userData: SkeltonizerDemoData.userData,
            ));
          } else if (state is AuthErrorState) {
            return AlertDialog(
              title: Text(
                'Error',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              content: Text(state.message),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<AuthCubit>(context).getProfileData(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  child: const Text('Try Again'),
                )
              ],
            );
          } else if (state is AuthGetedProfileDataSTate) {
            return ProfileContentWidget(userData: state.userData);
          } else {
            BlocProvider.of<AuthCubit>(context).getProfileData();
            return Skeletonizer(
                child: ProfileContentWidget(
              userData: SkeltonizerDemoData.userData,
            ));
          }
        },
      ),
    );
  }
}
