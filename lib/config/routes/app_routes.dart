import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:tasky/features/auth/presentation/screens/login_screen.dart';
import 'package:tasky/features/auth/presentation/screens/signup_screen.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:tasky/features/home/presentation/screens/add_todo_screen.dart';
import 'package:tasky/features/home/presentation/screens/details_screen.dart';
import 'package:tasky/features/home/presentation/screens/home_screen.dart';
import 'package:tasky/features/home/presentation/screens/loading_deltails_screen.dart';
import 'package:tasky/features/home/presentation/screens/profile_screen.dart';
import 'package:tasky/features/home/presentation/screens/scan_code_screen.dart';
import 'package:tasky/features/splash/presentation/screens/splash_screen.dart';
import 'package:tasky/tasky_enjection.dart';

class AppRoutes {
  static const String splashScreen = 'Splash Screen';
  static const String loginScreen = 'Login Screen';
  static const String signupScreen = 'signUp Screen';
  static const String homeScreen = 'Home Screen';
  static const String detailsScreen = 'Details Screen';
  static const String scanCodeScreen = 'Scan Code Screen Screen';
  static const String addTodoScreen = 'Add Todo Screen';
  static const String profileScreen = 'profile Screen';
  static const String loadingDetailsScreen = 'Loading Details Screen';

  static Route<dynamic>? routes(RouteSettings route) {
    switch (route.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<AuthCubit>(),
                  child: const LoginScreen(),
                ));
      case signupScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<AuthCubit>(),
                  child: const SignupScreen(),
                ));
      case homeScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<TodoCubit>(),
                  child: const HomeScreen(),
                ));
      case detailsScreen:
        {
          final todo = route.arguments as Todo;
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => ls<TodoCubit>(),
                    child: DetailsScreen(
                      todo: todo,
                    ),
                  ));
        }
      case scanCodeScreen:
        return MaterialPageRoute(builder: (context) => const ScanCodeScreen());
      case addTodoScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<TodoCubit>(),
                  child: const AddTodoScreen(),
                ));
      case profileScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ls<AuthCubit>()..getProfileData(),
                  child: const ProfileScreen(),
                ));
      case loadingDetailsScreen:
        {
          final id = route.arguments as String;
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => ls<TodoCubit>()..getOneTodo(id: id),
                    child: const LoadingDeltailsScreen(),
                  ));
        }
    }
    return null;
  }
}
