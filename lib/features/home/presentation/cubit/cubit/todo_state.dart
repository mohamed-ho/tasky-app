part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

final class TodoLoadingState extends TodoState {}

final class TodoErrorState extends TodoState {
  final String message;
  const TodoErrorState({required this.message});
}

final class TodoGetedListState extends TodoState {
  final List<Todo> todos;
  const TodoGetedListState({required this.todos});
}

final class TodoLoadedState extends TodoState {}

final class TodoGetedSingleTodoState extends TodoState {
  final Todo todo;
  const TodoGetedSingleTodoState({required this.todo});
}
