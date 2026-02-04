// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  int id;
  String title;
  String description;
  bool isDone;
  String createdBy;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
    required this.createdBy,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
    String? createdBy,
  }) => TaskModel(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    isDone: isDone ?? this.isDone,
    createdBy: createdBy ?? this.createdBy,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    title: json["title"],
    description: json["Description"],
    isDone: json["isDone"],
    createdBy: json["createdBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "Description": description,
    "isDone": isDone,
    "createdBy": createdBy,
  };
}
