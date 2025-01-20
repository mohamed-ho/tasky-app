import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/home/data/datasources/todo_remote_data_source.dart';
import 'package:tasky/features/home/data/models/todo_model.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource todoRemoteDataSource;

  TodoRepositoryImpl({required this.todoRemoteDataSource});
  @override
  Future<Either<ServerFailure, void>> addTodos(Todo todo) async {
    try {
      await todoRemoteDataSource.addTodos(TodoModel.fromTodo(todo));
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailure, void>> deleteTodos(String id) async {
    try {
      await todoRemoteDataSource.deleteTodos(id);
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailure, Todo>> getOneTodos(String id) async {
    try {
      final result = await todoRemoteDataSource.getOneTodos(id);
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailure, List<Todo>>> getTodos() async {
    try {
      final result = await todoRemoteDataSource.getTodos();
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerFailure, void>> updateTodos(Todo todo) async {
    try {
      await todoRemoteDataSource.updateTodos(TodoModel.fromTodo(todo));
      return const Right(null);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
