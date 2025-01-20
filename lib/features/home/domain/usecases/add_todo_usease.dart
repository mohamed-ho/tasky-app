import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/domain/repositories/todo_repository.dart';

class AddTodoUsease {
  final TodoRepository todoRepository;

  AddTodoUsease({required this.todoRepository});

  Future<Either<ServerFailure, void>> call(Todo todo) async {
    return await todoRepository.addTodos(todo);
  }
}
