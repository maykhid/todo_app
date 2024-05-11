import 'package:injectable/injectable.dart';
import 'package:toad_app/app/features/home/data/dao/task_dao.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/core/data/model/result.dart';

@singleton
class TaskRepository {
  TaskRepository({required TaskDao taskDao}) : _taskDao = taskDao;

  final TaskDao _taskDao;

  Result<Tasks> getAllTasks() {
    try {
      final tasks = _taskDao.getAllTasks();
      return Result.success(tasks);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Result<void> deleteAllTasks() {
    try {
      final tasks = _taskDao.deleteAllTasks();
      return Result.success(tasks);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Result<Task>? readTask(int taskIndex) {
    try {
      final task = _taskDao.readTask(taskIndex);
      return Result.success(task);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Result<void> writeTask(Task newTask) {
    try {
      final task = _taskDao.writeTask(newTask);
      return Result.success(task);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }
}
