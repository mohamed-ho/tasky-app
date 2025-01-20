import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tasky/config/routes/app_routes.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/presentation/widgets/to_do_periority_widget.dart';
import 'package:tasky/features/home/presentation/widgets/to_do_status_widget.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.detailsScreen,
          arguments: todo),
      child: SizedBox(
        height: 100.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/todo.png',
                width: 65,
                height: 65,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        todo.title.length > 15
                            ? '${todo.title.substring(0, 15)}...'
                            : todo.title,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w700),
                      ),
                      ToDoStatusWidget(status: todo.status)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.desc.length > 20
                            ? '${todo.desc.substring(0, 25)}...'
                            : todo.desc,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ToDoPriorityWiget(
                            periority: todo.priority,
                          ),
                          Text(
                            DateFormat('yyyy/MM/dd')
                                .format(DateTime.parse(todo.updatedAt!)),
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.more_vert_rounded),
          ],
        ),
      ),
    );
  }
}
