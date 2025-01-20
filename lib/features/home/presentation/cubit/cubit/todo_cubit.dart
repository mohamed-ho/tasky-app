import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/home/domain/entities/todo.dart';
import 'package:tasky/features/home/domain/usecases/add_todo_usease.dart';
import 'package:tasky/features/home/domain/usecases/delete_doto_usecase.dart';
import 'package:tasky/features/home/domain/usecases/get_one_todo_usecase.dart';
import 'package:tasky/features/home/domain/usecases/get_todos_usecase.dart';
import 'package:tasky/features/home/domain/usecases/update_todo_usecase.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final AddTodoUsease addTodoUsease;
  final DeleteDotoUsecase deleteDotoUsecase;
  final GetOneTodoUsecase getOneTodoUsecase;
  final GetTodosUsecase getTodosUsecase;
  final UpdateTodoUsecase updateTodoUsecase;
  TodoCubit(
      {required this.addTodoUsease,
      required this.deleteDotoUsecase,
      required this.getOneTodoUsecase,
      required this.getTodosUsecase,
      required this.updateTodoUsecase})
      : super(TodoInitial());

  Future<void> addTodo({required Todo todo}) async {
    emit(TodoLoadingState());
    final result = await addTodoUsease(todo);
    result.fold((l) => emit(TodoErrorState(message: l.message)),
        (r) => emit(TodoLoadedState()));
  }

  Future<void> deleteDoto({required String id}) async {
    emit(TodoLoadingState());
    final result = await deleteDotoUsecase(id);
    result.fold((l) => emit(TodoErrorState(message: l.message)),
        (r) => emit(TodoLoadedState()));
  }

  Future<void> getOneTodo({required String id}) async {
    emit(TodoLoadingState());
    final result = await getOneTodoUsecase(id);
    result.fold((l) => emit(TodoErrorState(message: l.message)),
        (r) => emit(TodoGetedSingleTodoState(todo: r)));
  }

  Future<void> getTodos() async {
    emit(TodoLoadingState());
    final result = await getTodosUsecase();
    result.fold((l) => emit(TodoErrorState(message: l.message)),
        (r) => emit(TodoGetedListState(todos: r)));
  }

  Future<void> updateTodo({required Todo todo}) async {
    emit(TodoLoadingState());
    final result = await updateTodoUsecase(todo);
    result.fold((l) => emit(TodoErrorState(message: l.message)),
        (r) => emit(TodoLoadedState()));
  }
}
