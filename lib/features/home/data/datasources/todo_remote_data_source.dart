import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/core/server_service/end_points.dart';
import 'package:tasky/core/server_service/server_service.dart';
import 'package:tasky/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:tasky/features/home/data/models/todo_model.dart';
import 'package:tasky/tasky_enjection.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodos(TodoModel todo);
  Future<void> deleteTodos(String id);
  Future<void> updateTodos(TodoModel todo);
  Future<TodoModel> getOneTodos(String id);
}

class ToDoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final ServerService serverService;

  ToDoRemoteDataSourceImpl({required this.serverService});

  @override
  Future<void> addTodos(TodoModel todo) async {
    final token = await ls<AuthLocalDataSource>().getToken();
    if (token != null) {
      await serverService.post(
        url: EndPoints.addTodo,
        data: todo.toJson(),
        header: {
          "Authorization": "Bearer $token",
        },
      );
    } else {
      throw CachFailure(message: 'Error while geting token ');
    }
  }

  @override
  Future<void> deleteTodos(String id) async {
    await serverService.delete(
      url: EndPoints.deleteTodo(id),
      header: {
        "Authorization": "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
        "Content-Type": "application/json",
      },
    );
  }

  @override
  Future<TodoModel> getOneTodos(String id) async {
    final result = await serverService.get(
      url: EndPoints.getOneTodo(id),
      header: {
        "Authorization": "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
        "Content-Type": "application/json",
      },
    );
    return TodoModel.formJson(result);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    final result = await serverService.get(
      url: EndPoints.getTodoList,
      header: {
        "Authorization": "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
        "Content-Type": "application/json",
      },
    );

    return List<TodoModel>.from(result.map((e) => TodoModel.formJson(e)));
  }

  @override
  Future<void> updateTodos(TodoModel todo) async {
    await serverService.put(
      url: EndPoints.updateTodo(todo.id!),
      data: todo.toJson(),
      header: {
        "Authorization": "Bearer ${await ls<AuthLocalDataSource>().getToken()}",
        "Content-Type": "application/json",
      },
    );
  }
}
