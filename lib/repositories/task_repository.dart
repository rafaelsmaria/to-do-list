import '../models/task.dart';

class TaskRepository {
  List<Task> _tasks = [];

  Future<List<Task>> loadTask() async {
    await Future.delayed(Duration(seconds: 1));

    return _tasks;
  }

  Future<List<Task>> addTask(Task task) async {
    _tasks.add(task);
    return _tasks;
  }

  Future<List<Task>> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);

    if (index != -1) {
      _tasks[index] = task;
    }

    return _tasks;
  }

  Future<List<Task>> deleteTask(String id) async {
    _tasks.removeWhere((t) => t.id == id);
    return _tasks;
  }
}
