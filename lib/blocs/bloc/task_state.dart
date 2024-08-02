part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoadSucces extends TaskState {
  final List<Task> tasks;
  TaskLoadSucces(this.tasks);
}

class TaskOperationFailure extends TaskState {}
