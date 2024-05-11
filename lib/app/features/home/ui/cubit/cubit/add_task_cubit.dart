import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/app/features/home/data/task_repository.dart';
import 'package:toad_app/core/di/di.dart';

part 'add_task_state.dart';
part 'add_task_cubit.freezed.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit({TaskRepository? taskRepository})
      : _taskRepository = taskRepository ?? locator<TaskRepository>(),
        super(const AddTaskState.initial());

  final TaskRepository _taskRepository;

  Future<void> addTask(Task task) async {
    emit(const AddTaskState.loading());
    final response = _taskRepository.writeTask(task);

    if (response.isSuccess) {
      emit(const AddTaskState.loaded());
    } else {
      emit(AddTaskState.error(response.errorMessage!));
    }
  }
}
