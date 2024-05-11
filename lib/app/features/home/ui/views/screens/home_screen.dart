import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/app/features/home/ui/cubit/home_cubit.dart';
import 'package:toad_app/app/shared/ui/app_colors.dart';
import 'package:toad_app/app/shared/ui/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authCubit = context.read<AuthenticationCubit>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 123,
        title: const Padding(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 20),
          child: Row(
            children: [
              // profi;e pic
              CircleAvatar(),

              Gap(10),

              // user info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Henry'),
                  Text(
                    'henryifebunandu@gmail.com',
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w100,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/addTask'),
        backgroundColor: AppColors.lightBlue,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              const AdWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: state.maybeMap(
                  //error
                  error: (message) => Message(message: message.errorMessage),
      
                  // loaded
                  loaded: (response) {
                    final tasks = response.tasks.tasks;
      
                    if (tasks.isEmpty) {
                      return const Message(
                        message:
                            'You have no Tasks yet, click the FAB to add new tasks',
                      );
                    }
      
                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TaskTile(
                          task: tasks[index],
                          index: index,
                        ),
                      ),
                      // separatorBuilder: (context, index) => const Gap(10),
                      itemCount: tasks.length,
                    );
                  },
                  orElse: () {
                    return Container();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    required this.message,
    super.key,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(200),
        Text(message),
      ],
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.task,
    required this.index,
    super.key,
  });

  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        children: [
          // checkbox
          RoundCheckBox(
            size: 32,
            isChecked: task.isDone,
            onTap: (selected) {},
          ),

          const Gap(12),

          // text
          Text(task.title),

          const Spacer(),

          // edit btn

          EditButton(
            index: index,
          ),
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/editTask', extra: index),
      child: Container(
        width: 51,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        child: const Center(
          child: Text(
            'Edit',
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class AdWidget extends StatelessWidget {
  const AdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      decoration: BoxDecoration(
        color: AppColors.lime,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(AppImages.trophy),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Go Pro (No Ads)'),
              Text('No fuss, no ads, for only \$1 a \nmonth'),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 66,
              height: 71,
              color: AppColors.darkBlue,
              child: const Center(
                child: Text(
                  r'$1',
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
