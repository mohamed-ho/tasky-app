import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/core/functions/show_error_dialog.dart';
import 'package:tasky/core/functions/show_loading_dialog.dart';
import 'package:tasky/features/home/presentation/cubit/cubit/todo_cubit.dart';

class LoadingDeltailsScreen extends StatelessWidget {
  const LoadingDeltailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state is TodoLoadingState) {
            showLoadingDialog(context);
          } else if (state is TodoErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, state.message);
          } else if (state is TodoGetedSingleTodoState) {
            Navigator.pushReplacementNamed(context, AppRoutes.detailsScreen,
                arguments: state.todo);
          }
        },
        child: const Center(),
      ),
    );
  }
}
