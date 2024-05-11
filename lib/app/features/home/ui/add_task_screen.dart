import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:toad_app/app/shared/ui/app_button.dart';
import 'package:toad_app/app/shared/ui/app_text_field.dart';
import 'package:toad_app/app/shared/utils/sized_context.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
