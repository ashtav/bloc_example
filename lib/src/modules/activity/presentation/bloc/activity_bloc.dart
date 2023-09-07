import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../todos/data/models/todo.dart';
import '../../../todos/data/repositories/todo_repository.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<LoadActivities>((event, emit) async {
      try {
        emit(ActivityLoading());
        List<Todo> activities = await TodoRepository.getTodos();
        emit(ActivityLoaded(activities));
      } catch (e, _) {
        // Tangani kesalahan jika ada
        emit(ActivityError('Failed to load activities: $e'));
      }
    });
  }
}
