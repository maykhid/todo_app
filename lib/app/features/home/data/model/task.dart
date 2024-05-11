import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Tasks {
  Tasks({required this.tasks});

  factory Tasks.fromJson(List<Task> tasks) => Tasks(tasks: tasks);
  
  @HiveField(0)
  List<Task> tasks;

  @override
  String toString() => tasks.toString();
}

@HiveType(typeId: 2)
class Task {
  Task({required this.title, required this.isDone});

  @HiveField(1)
  final String title;

  @HiveField(2)
  final bool isDone;
}
