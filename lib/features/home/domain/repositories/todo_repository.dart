import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<ServerFailure, List<Todo>>> getTodos();
  Future<Either<ServerFailure, void>> addTodos(Todo todo);
  Future<Either<ServerFailure, void>> deleteTodos(String id);
  Future<Either<ServerFailure, void>> updateTodos(Todo todo);
  Future<Either<ServerFailure, Todo>> getOneTodos(String id);
}
