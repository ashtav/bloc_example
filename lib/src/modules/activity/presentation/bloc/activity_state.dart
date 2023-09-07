part of 'activity_bloc.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityInitial extends ActivityState {}

class ActivityLoading extends ActivityState {}

class ActivityLoaded extends ActivityState {
  final List<Todo> activities;

  const ActivityLoaded(this.activities);

  @override
  List<Object> get props => [activities];
}

class ActivityError extends ActivityState {
  final String errorMessage;

  const ActivityError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ActivityCompleted extends ActivityState {
  final String completedActivity;

  const ActivityCompleted(this.completedActivity);

  @override
  List<Object> get props => [completedActivity];
}
