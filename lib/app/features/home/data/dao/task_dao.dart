import 'package:toad_app/app/features/home/data/model/task.dart';

abstract class TaskDao {
  bool get tasksExist;
  void writeTask(Task task);
  void deleteTask(int taskIndex);
  void deleteAllTasks();
  Task? readTask(int taskIndex);
  Tasks getAllTasks();
}
