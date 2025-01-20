import 'package:dartz/dartz.dart';
import 'package:tasky/core/failure/failure.dart';
import 'package:tasky/features/home/domain/repositories/todo_repository.dart';

class DeleteDotoUsecase {
  final TodoRepository todoRepository;

  DeleteDotoUsecase({required this.todoRepository});

  Future<Either<ServerFailure, void>> call(String id) async {
    return await todoRepository.deleteTodos(id);
  }
}
