// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/core/functions/show_error_dialog.dart';
import 'package:tasky/core/functions/show_loading_dialog.dart';
import 'package:tasky/core/widgets/custom_elevated_button.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:tasky/features/home/presentation/widgets/add_periority_of_todo.dart';
import 'package:tasky/features/home/presentation/widgets/bottom_sheet_widget.dart';
import 'package:tasky/features/home/presentation/widgets/custom_add_date_of_todo_widget.dart';
import 'package:tasky/features/home/presentation/widgets/custom_add_todo_text_form_field.dart';
import 'package:tasky/features/home/presentation/widgets/custom_choose_image_of_todo.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? iamge;

  String periority = 'medium';
  DateTime? dateTime;
  DateTime initial = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoCubit, TodoState>(
      listener: (context, state) {
        if (state is TodoLoadingState) {
          showLoadingDialog(context);
        } else if (state is TodoErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.message);
        } else if (state is TodoLoadedState) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.homeScreen, (route) => true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add new task',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomChooseImageOfTodo(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => BottomSheetWidget(
                                camera: () async {
                                  iamge = await _picker.pickImage(
                                      source: ImageSource.camera);
                                },
                                gallery: () async {
                                  iamge = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                },
                              ));
                    },
                  ),
                  CustomAddTodoTextFormField(
                    controller: titleController,
                    hintText: 'Enter title here...',
                    lable: 'Task title',
                  ),
                  CustomAddTodoTextFormField(
                      controller: descController,
                      maxLine: 5,
                      hintText: 'Enter description here...',
                      lable: 'Task Description'),
                  AddPeriorityOfTodo(
                    onChanged: (value) {
                      setState(() {
                        setState(() {
                          periority = value!;
                        });
                      });
                    },
                    periority: periority,
                  ),
                  CustomAddDateOfTodoWidget(
                    dateTime: dateTime,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)))
                          .then((value) {
                        if (value != null) {
                          setState(() {
                            dateTime = value;
                          });
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (iamge != null) {
                            if (dateTime != null) {
                              BlocProvider.of<TodoCubit>(context).addTodo(
                                  todo: Todo(
                                      image: iamge!.name,
                                      title: titleController.text,
                                      desc: descController.text,
                                      priority: periority,
                                      status: 'waiting',
                                      createdAt: dateTime.toString()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  'please add date time',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                'please add image',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }
                      },
                      text: 'Add task')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
