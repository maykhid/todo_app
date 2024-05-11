import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/app/features/home/data/task_repository.dart';
import 'package:toad_app/core/di/di.dart';

part 'edit_task_state.dart';
part 'edit_task_cubit.freezed.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit({TaskRepository? taskRepository})
      : _taskRepository = taskRepository ?? locator<TaskRepository>(),
        super(const EditTaskState.initial());

  final TaskRepository _taskRepository;

  Future<void> edit(Task task, int index) async {
    emit(const EditTaskState.loading());
    final response = _taskRepository.updateTask(task, index);

    if (response.isSuccess) {
      emit(const EditTaskState.loaded());
    } else {
      emit(EditTaskState.error(response.errorMessage!));
    }
  }
}
