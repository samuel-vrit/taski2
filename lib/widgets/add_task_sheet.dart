import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taski/constants/app_colors.dart';
import 'package:taski/constants/app_constants.dart';
import 'package:taski/providers/task_provider.dart';
import 'package:taski/utils/task_model.dart';

class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //Title
          TextField(
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
              Provider.of<TaskProvider>(context, listen: false).addTask(
                TaskModel(
                  id: 100,
                  title: 'New task',
                  description: 'description',
                  done: false,
                ),
              );
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
