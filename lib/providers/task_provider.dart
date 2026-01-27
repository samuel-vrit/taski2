import 'package:flutter/material.dart';
import 'package:taski/utils/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> allTasks = [];

  void addTask({required String title, required String description}) {
    var newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: description,
      isDone: false,
    );
    allTasks.add(newTask);
    notifyListeners();
  }

  markAsDone(int taskId) {
    final index = allTasks.indexWhere((t) => t.id == taskId);
    allTasks[index] = allTasks[index].copyWith(isDone: true);
    notifyListeners();
  }
}
