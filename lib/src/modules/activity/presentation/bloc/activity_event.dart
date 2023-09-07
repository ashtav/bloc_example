part of 'activity_bloc.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class LoadActivities extends ActivityEvent {}

class AddActivity extends ActivityEvent {
  final String newActivity;

  const AddActivity(this.newActivity);

  @override
  List<Object> get props => [newActivity];
}

class CompleteActivity extends ActivityEvent {
  final String completedActivity;

  const CompleteActivity(this.completedActivity);

  @override
  List<Object> get props => [completedActivity];
}

class DeleteActivity extends ActivityEvent {
  final String deletedActivity;

  const DeleteActivity(this.deletedActivity);

  @override
  List<Object> get props => [deletedActivity];
}
