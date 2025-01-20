import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/core/functions/show_error_dialog.dart';
import 'package:tasky/core/functions/show_loading_dialog.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:tasky/features/home/presentation/widgets/custom_todo_date.dart';
import 'package:tasky/features/home/presentation/widgets/custom_todo_periority_drop_down_widget.dart';
import 'package:tasky/features/home/presentation/widgets/custom_todo_status_drop_down_widget.dart';
import 'package:tasky/features/home/presentation/widgets/custom_todo_text_form_filed.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.todo});
  final Todo todo;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String status;
  late String periority;
  late DateTime date;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    status = widget.todo.status;
    periority = widget.todo.priority;
    date = DateTime.parse(widget.todo.updatedAt!);
    titleController.text = widget.todo.title;
    descController.text = widget.todo.desc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<TodoCubit, TodoState>(
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
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Task Details',
              style: TextStyle(
                fontSize: 16.w,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      editOrDeleteToDo(context).then((value) {
                        if (_formKey.currentState!.validate()) {
                          value == 'edit'
                              // ignore: use_build_context_synchronously
                              ? BlocProvider.of<TodoCubit>(context).updateTodo(
                                  todo: Todo(
                                  image: widget.todo.image,
                                  title: titleController.text,
                                  desc: descController.text,
                                  priority: periority,
                                  status: status,
                                  user: widget.todo.user,
                                  id: widget.todo.id,
                                ))
                              : value == 'delete'
                                  // ignore: use_build_context_synchronously
                                  ? BlocProvider.of<TodoCubit>(context)
                                      .deleteDoto(id: widget.todo.id!)
                                  : null;
                        }
                      });
                    },
                    icon: const Icon(Icons.more_vert_rounded));
              })
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/todo.png',
                    width: double.infinity,
                    height: 240.h,
                    fit: BoxFit.fill,
                  ),
                  CustomTodoTextFormField(
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter title';
                      }
                      return null;
                    },
                    hintText: 'Title',
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                  ),
                  CustomTodoTextFormField(
                    controller: descController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter description';
                      }
                      return null;
                    },
                    hintText: 'description',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  CustomTodoDate(
                      status: status,
                      initialDate: date,
                      onTap: () async {
                        await showDatePicker(
                                context: context,
                                firstDate: date,
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                                initialDate: date)
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              date = value;
                            });
                          }
                        });
                      }),
                  CustomTodoStatusDropDownWidget(
                    status: const ['waiting', 'finished', 'Inprogress'],
                    initialValue: status,
                    onChanged: (value) {
                      setState(() {
                        status = value!;
                      });
                    },
                  ),
                  CustomTodoPeriorityDropDownWidget(
                    pirority: const ['high', 'medium', 'low'],
                    onChanged: (value) {
                      setState(() {
                        periority = value!;
                      });
                    },
                    initialValue: periority,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: SizedBox(
                      height: 326.w,
                      width: 326.w,
                      child: QrImageView(
                        data: widget.todo.id!,
                        size: 326,
                        version: QrVersions.auto,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String?> editOrDeleteToDo(BuildContext context) {
    return showMenu(
        context: context,
        position: RelativeRect.fromLTRB(100, 10.h, 10, 100),
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r))),
        items: const [
          PopupMenuItem(
            value: 'edit',
            child: Text('Edit'),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          )
        ]);
  }
}
