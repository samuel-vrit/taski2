import 'package:flutter/material.dart';
import 'package:taski/utils/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> allTasks = [];

  addTask(TaskModel newTask) {
    allTasks.add(newTask);
    notifyListeners();
  }
}
