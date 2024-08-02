import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/repositories/task_repository.dart';

import '../../models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  TaskBloc(this.taskRepository) : super(TaskInitial()) {
    on<LoadTask>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onLoadTasks(LoadTask event, Emitter<TaskState> emit) async {
    try {
      final tasks = await taskRepository.loadTask();
      emit(TaskLoadSucces(tasks));
    } catch (_) {
      emit(TaskOperationFailure());
    }
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    try {
      final tasks = await taskRepository.addTask(event.task);
      emit(TaskLoadSucces(tasks));
    } catch (_) {
      emit(TaskOperationFailure());
    }
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    try {
      final updatedTasks = await taskRepository.updateTask(event.task);
      emit(TaskLoadSucces(updatedTasks));
    } catch (_) {
      emit(TaskOperationFailure());
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    try {
      final updatedTasks = await taskRepository.deleteTask(event.id);
      emit(TaskLoadSucces(updatedTasks));
    } catch (_) {
      emit(TaskOperationFailure());
    }
  }
}
