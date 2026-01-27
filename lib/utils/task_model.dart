class TaskModel {
  int id;
  String title;
  String description;
  bool isDone;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isDone,
  }) => TaskModel(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    isDone: isDone ?? this.isDone,
  );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    title: json["title"],
    description: json["Description"],
    isDone: json["isDone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "Description": description,
    "isDone": isDone,
  };
}
