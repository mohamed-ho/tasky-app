import 'package:tasky/features/home/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel(
      {super.id,
      required super.image,
      required super.title,
      required super.desc,
      required super.priority,
      required super.status,
      required super.user,
      super.createdAt,
      super.updatedAt});
  factory TodoModel.formJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['_id'],
        image: json['image'],
        title: json['title'],
        desc: json['desc'],
        priority: json['priority'],
        status: json['status'],
        user: json['user'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  factory TodoModel.fromTodo(Todo todo) {
    return TodoModel(
        id: todo.id,
        image: todo.image,
        title: todo.title,
        desc: todo.desc,
        priority: todo.priority,
        status: todo.status,
        user: todo.user,
        createdAt: todo.createdAt,
        updatedAt: todo.updatedAt);
  }
  toJson() {
    return {
      "image": super.image,
      "title": super.title,
      "desc": super.desc,
      "priority": super.priority,
      "status": super.status,
      "dueDate": super.createdAt,
      "user": super.user ?? "",
    };
  }
}
