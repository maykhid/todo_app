// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:toad_app/app/features/home/data/dao/hive_task_dao.dart' as _i6;
import 'package:toad_app/app/features/home/data/dao/task_dao.dart' as _i5;
import 'package:toad_app/app/features/home/data/model/task.dart' as _i4;
import 'package:toad_app/app/features/home/data/task_repository.dart' as _i7;
import 'package:toad_app/core/di/module.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.Box<_i4.Task>>(
      () => registerModule.taskBox,
      preResolve: true,
    );
    gh.singleton<_i5.TaskDao>(
        () => _i6.HiveTaskDao(taskBox: gh<_i3.Box<_i4.Task>>()));
    gh.singleton<_i7.TaskRepository>(
        () => _i7.TaskRepository(taskDao: gh<_i5.TaskDao>()));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
