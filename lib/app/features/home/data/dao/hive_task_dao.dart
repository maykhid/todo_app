import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:toad_app/app/features/home/data/dao/task_dao.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/core/data/constants.dart';

@Singleton(as: TaskDao)
class HiveTaskDao extends TaskDao {
  HiveTaskDao({
    required Box<Task> taskBox,
  }) : _taskBox = taskBox;

  final Box<Task> _taskBox;

  static const String _key = taskKey;

  @override
  void deleteTask(int taskIndex) => _taskBox.deleteAt(taskIndex);

  @override
  Task? readTask(int taskIndex) => _taskBox.getAt(taskIndex);

  @override
  bool get tasksExist => _taskBox.isNotEmpty;

  @override
  void writeTask(Task task) => _taskBox.add(task);

  @override
  Tasks getAllTasks() => Tasks(tasks: _taskBox.values.toList());

  @override
  void deleteAllTasks() => _taskBox.delete(_key);
}
