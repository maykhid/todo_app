import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/app/features/home/ui/cubit/cubit/edit_task_cubit.dart';
import 'package:toad_app/app/features/home/ui/cubit/home_cubit.dart';
import 'package:toad_app/app/shared/ui/app_button.dart';
import 'package:toad_app/app/shared/ui/app_colors.dart';
import 'package:toad_app/app/shared/ui/app_text_field.dart';
import 'package:toad_app/app/shared/utils/sized_context.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
    required this.info,
    super.key,
  });

  final EditTaskInfo info;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  late EditTaskInfo info;
  @override
  void initState() {
    info = widget.info;
    _taskController.text = info.task.title;

    super.initState();
  }

  // void getAllTasks() async {
  //   final tasks = await context.read<HomeCubit>().getAllTasks();
  //   print(tasks);
  //   print(index);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditTaskCubit(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<EditTaskCubit, EditTaskState>(
            listener: (context, state) {
              state.maybeMap(
                loaded: (_) {
                  context.pop();
                  context.read<HomeCubit>().getAllTasks(); // refresh task
                },
                error: (_) {
                  // show toast
                },
                orElse: () {},
              );
            },
          ),
      
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit Task'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // task name
                const Text(
                  'Task Name',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const Gap(10),

                // task text field

                AppTextField(
                  controller: _taskController,
                ),

                const Spacer(),

                BlocBuilder<EditTaskCubit, EditTaskState>(
                  builder: (context, state) {
                    return AppButton(
                      text: 'Done',
                      width: context.width,
                      onPressed: () => context.read<EditTaskCubit>().edit(
                            Task(title: _taskController.text, isDone: false),
                            info.index,
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

class EditTaskInfo {
  EditTaskInfo({required this.task, required this.index});

  final Task task;
  final int index;
}
