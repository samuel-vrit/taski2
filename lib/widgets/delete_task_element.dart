import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/constants/app_constants.dart';
import 'package:taski/models/task_model.dart';
import 'package:taski/providers/task_provider.dart';

class DeleteTaskElement extends StatelessWidget {
  const DeleteTaskElement({required this.task, super.key});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.backGroundGrey,
      ),
      child: Row(
        children: [
          // Checkbox(
          //   value: true,
          //   side: BorderSide(color: Colors.grey, width: 2),
          //   onChanged: (val) {},
          // ),
          SizedBox(width: 16),
          Text(
            task.title,
            style: kBodyTextStyle.copyWith(color: AppColors.textColor02),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              context.read<TaskProvider>().deleteTaskById(task.id);
            },
            child: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
