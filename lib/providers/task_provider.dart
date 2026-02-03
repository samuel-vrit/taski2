import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> allTasks = [];
  List<TaskModel> filteredTasks = [];

  List<TaskModel> get doneTasks => allTasks.where((t) => t.isDone).toList();

  //add new task with title and description
  void addTask({required String title, String? description}) async {
    var newTask = TaskModel(
      id: DateTime.now()
          .millisecondsSinceEpoch, // this assign unique integer to every new task
      title: title,
      description: description ?? '',
      isDone:
          false, // initially the task is not completed so it is set to false
    );

    // allTasks.add(newTask); // add created task
    notifyListeners();
  }

  toggleDone(int taskId) {
    //first check if the task exists in allTasks list. If it does not exist in allTasks then it will return -1 (indexWhere returns -1)
    final index = allTasks.indexWhere((t) => t.id == taskId);
    final filterTaskIndex = filteredTasks.indexWhere((t) => t.id == taskId);
    //if index is not  -1, then allTasks contains the task
    if (index != -1) {
      final previousStatus = allTasks[index].isDone;
      allTasks[index] = allTasks[index].copyWith(isDone: !previousStatus);
      notifyListeners();
    }

    //toggle the task in filteredTasks list also
    //if filterTaskIndex is -1, then filteredTasks does not contain the task, so skip
    if (filterTaskIndex != -1) {
      final previousStatus = filteredTasks[filterTaskIndex].isDone;
      filteredTasks[filterTaskIndex] = filteredTasks[filterTaskIndex].copyWith(
        isDone: !previousStatus,
      );
      notifyListeners();
    }
    //why are we applying toggle effect on filtered tasks also? Because we toggle status when we are in search screen also. The search screen contains the list filteredTasks
    //sometimes the filteredTasks may not contain the task with given taskId, if it does not contains then the filterTaskIndex will be -1.
  }

  //search task according to search text
  void filterTasks(String searchText) {
    if (searchText.isEmpty) {
      filteredTasks.clear();
      notifyListeners();
      return;
    }

    filteredTasks = allTasks
        .where((t) => t.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
  }

  deleteTaskById(int taskId) {
    allTasks.removeWhere((t) => t.id == taskId);
    filteredTasks.removeWhere((t) => t.id == taskId);
    notifyListeners();
  }

  // delete all done task
  deleteDoneTasks() {
    allTasks.removeWhere((t) => t.isDone);
    notifyListeners();
  }
}
