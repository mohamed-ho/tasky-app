import 'package:tasky/features/home/data/datasources/todo_remote_data_source.dart';
import 'package:tasky/features/home/data/repositories/todo_repository_impl.dart';
import 'package:tasky/features/home/domain/repositories/todo_repository.dart';
import 'package:tasky/features/home/domain/usecases/add_todo_usease.dart';
import 'package:tasky/features/home/domain/usecases/delete_doto_usecase.dart';
import 'package:tasky/features/home/domain/usecases/get_one_todo_usecase.dart';
import 'package:tasky/features/home/domain/usecases/get_todos_usecase.dart';
import 'package:tasky/features/home/domain/usecases/update_todo_usecase.dart';
import 'package:tasky/features/home/presentation/cubit/cubit/todo_cubit.dart';
import 'package:tasky/tasky_enjection.dart';

class HomeEnjection {
  init() {
    ls.registerFactory(() => TodoCubit(
        addTodoUsease: ls(),
        deleteDotoUsecase: ls(),
        getOneTodoUsecase: ls(),
        getTodosUsecase: ls(),
        updateTodoUsecase: ls()));
    ls.registerLazySingleton(() => AddTodoUsease(todoRepository: ls()));
    ls.registerLazySingleton(() => DeleteDotoUsecase(todoRepository: ls()));
    ls.registerLazySingleton(() => GetOneTodoUsecase(todoRepository: ls()));
    ls.registerLazySingleton(() => GetTodosUsecase(todoRepository: ls()));
    ls.registerLazySingleton(() => UpdateTodoUsecase(todoRepository: ls()));

    ls.registerLazySingleton<TodoRepository>(
        () => TodoRepositoryImpl(todoRemoteDataSource: ls()));

    ls.registerLazySingleton<TodoRemoteDataSource>(
        () => ToDoRemoteDataSourceImpl(serverService: ls()));
  }
}
