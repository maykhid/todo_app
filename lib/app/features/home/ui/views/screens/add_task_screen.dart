import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/app/features/home/ui/cubit/cubit/add_task_cubit.dart';
import 'package:toad_app/app/features/home/ui/cubit/home_cubit.dart';
import 'package:toad_app/app/shared/ui/app_button.dart';
import 'package:toad_app/app/shared/ui/app_text_field.dart';
import 'package:toad_app/app/shared/utils/sized_context.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocListener<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          state.maybeMap(
            loaded: (_) {
              context.pop();
              context.read<HomeCubit>().getAllTasks();
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add New Task'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Gap(20),

                // task name
                const Text('Task Name'),

                const Gap(10),

                // task text field
                AppTextField(
                  controller: _taskController,
                ),

                const Spacer(),

                BlocBuilder<AddTaskCubit, AddTaskState>(
                  builder: (context, state) {
                    return AppButton(
                      text: 'Done',
                      isLoading: state == const AddTaskState.loading(),
                      width: context.width,
                      onPressed: () => context.read<AddTaskCubit>().addTask(
                            Task(title: _taskController.text, isDone: false),
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
