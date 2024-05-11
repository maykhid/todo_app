import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:toad_app/app/shared/ui/app_button.dart';
import 'package:toad_app/app/shared/ui/app_colors.dart';
import 'package:toad_app/app/shared/ui/app_text_field.dart';
import 'package:toad_app/app/shared/utils/sized_context.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

            AppTextField(),

            const Spacer(),

            AppButton(
              text: 'Done',
              width: context.width,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
