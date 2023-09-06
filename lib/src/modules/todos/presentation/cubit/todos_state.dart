part of 'todos_cubit.dart';

class TodosState extends Equatable {
  final List<Todo> todos;
  final bool isLoading;
  final String name;

  const TodosState(
      {this.todos = const [], this.isLoading = false, this.name = 'John Doe'});

  @override
  List<Object> get props => [todos, isLoading, name];

  TodosState copyWith({List<Todo>? todos, bool? isLoading, String? name}) {
    return TodosState(
        todos: todos ?? this.todos,
        isLoading: isLoading ?? this.isLoading,
        name: name ?? this.name);
  }
}
