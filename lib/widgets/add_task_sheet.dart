import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/constants/app_constants.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/utils/task_model.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //Title
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Add a title',
              hintStyle: TextStyle(color: AppColors.textColor02),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          //Description
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.edit, size: 22, color: Colors.grey),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  maxLines: 5,
                  // maxLength: 10,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Add a description',
                    hintStyle: TextStyle(color: AppColors.textColor02),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.themeColor),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          //Create button
          ElevatedButton(
            style: TextButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              context.read<TaskProvider>().addTask(
                title: _titleController.text.trim(),
                description: _descriptionController.text,
              );
              // Navigator.pop(context);
            },
            child: Text(
              'Create',
              style: kBodyTextStyle.copyWith(color: AppColors.textColor02),
            ),
          ),
        ],
      ),
    );
  }
}
