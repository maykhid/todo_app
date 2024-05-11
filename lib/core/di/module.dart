import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';

@module
abstract class RegisterModule {
  // @singleton
  @preResolve
  Future<Box<Task>> get taskBox async{
    return Hive.openBox<Task>('taskbox');
  }
}
