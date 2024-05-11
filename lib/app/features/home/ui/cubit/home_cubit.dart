import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/app/features/home/data/task_repository.dart';
import 'package:toad_app/core/di/di.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({TaskRepository? taskRepository})
      : _taskRepository = taskRepository ?? locator<TaskRepository>(),
        super(const HomeState.initial());

  final TaskRepository _taskRepository;

  Future<void> getAllTasks() async {
    emit(const HomeState.loading());
    final response = _taskRepository.getAllTasks();

    if (response.isSuccess) {
      emit(HomeState.loaded(response.data!));
    } else {
      emit(HomeState.error(response.errorMessage!));
    }
  }
}
