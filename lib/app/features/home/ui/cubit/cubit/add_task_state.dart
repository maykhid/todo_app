part of 'add_task_cubit.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState.initial() = _Initial;
  const factory AddTaskState.error(String message) = _Error;
  const factory AddTaskState.loading() = _Loading;
  const factory AddTaskState.loaded() = _Loaded;
}
