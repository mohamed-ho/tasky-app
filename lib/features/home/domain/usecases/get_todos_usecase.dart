import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/domain/repositories/todo_repository.dart';

class GetTodosUsecase {
  final TodoRepository todoRepository;

  GetTodosUsecase({required this.todoRepository});

  Future<Either<ServerFailure, List<Todo>>> call() async {
    return await todoRepository.getTodos();
  }
}
