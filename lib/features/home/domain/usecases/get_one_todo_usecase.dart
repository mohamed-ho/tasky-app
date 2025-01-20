import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/domain/repositories/todo_repository.dart';

class GetOneTodoUsecase {
  final TodoRepository todoRepository;

  GetOneTodoUsecase({required this.todoRepository});

  Future<Either<ServerFailure, Todo>> call(String id) async {
    return await todoRepository.getOneTodos(id);
  }
}
