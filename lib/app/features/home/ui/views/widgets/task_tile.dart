import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:toad_app/app/features/home/data/model/task.dart';
import 'package:toad_app/app/features/home/ui/views/screens/edit_task_screen.dart';
import 'package:toad_app/app/features/home/ui/views/widgets/edit_button.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    required this.task,
    required this.index,
    super.key,
  });

  final Task task;
  final int index;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
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
            isChecked: isChecked,
            onTap: (selected) {
              setState(() {
                isChecked = selected!;
              });
            },
          ),

          const Gap(12),

          // text
          Text(
            widget.task.title,
            style: TextStyle(
              color: isChecked ? Colors.grey : Colors.black,
              decoration: isChecked ? TextDecoration.lineThrough : null,
              decorationColor: Colors.black,
            ),
          ),

          const Spacer(),

          // edit btn

          EditButton(
            editTaskInfo: EditTaskInfo(task: widget.task, index: widget.index),
          ),
        ],
      ),
    );
  }
}
