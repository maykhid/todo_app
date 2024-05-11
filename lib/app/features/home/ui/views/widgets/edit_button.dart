import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toad_app/app/features/home/ui/views/screens/edit_task_screen.dart';
import 'package:toad_app/app/shared/ui/app_colors.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    required this.editTaskInfo,
    super.key,
  });

  final EditTaskInfo editTaskInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/editTask', extra: editTaskInfo),
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
