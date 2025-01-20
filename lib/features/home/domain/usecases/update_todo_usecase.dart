import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/domain/repositories/todo_repository.dart';

class UpdateTodoUsecase {
  final TodoRepository todoRepository;

  UpdateTodoUsecase({required this.todoRepository});

  Future<Either<ServerFailure, void>> call(Todo todo) async {
    return await todoRepository.updateTodos(todo);
  }
}
