import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lazyui/lazyui.dart';

import '../../data/models/todo.dart';
import '../../data/repositories/todo_repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(const TodosState()) {
    getTodos();
  }

  Future getTodos() async {
    try {
      emit(state.copyWith(isLoading: true));

      final res = await TodoRepository.getTodos();
      emit(state.copyWith(todos: res));
    } catch (e, s) {
      Errors.check(e, s);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future remove(int id) async {
    try {
      LzToast.overlay('Deleting...');
      await Future.delayed(300.ms);

      final todos = List<Todo>.from(state.todos);
      todos.removeWhere((e) => e.id == id);

      // emit(TodosState(todos: todos));
      emit(state.copyWith(todos: todos));
    } catch (e, s) {
      Errors.check(e, s);
    } finally {
      LzToast.dismiss();
    }
  }

  Future mark(int id) async {
    try {
      final todos = List<Todo>.from(state.todos); // it works
      // final todos = state.todos; // it doesn't work
      todos.updateWhere((e) => e.id == id, (data, i) {
        final map = data[i].toJson();
        return data[i] =
            Todo.fromJson({...map, 'completed': !map['completed']});
      });

      emit(state.copyWith(todos: todos));
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  void generateName() {
    emit(state.copyWith(name: Faker.name()));
  }
}
