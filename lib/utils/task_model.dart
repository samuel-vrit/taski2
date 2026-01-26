class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.done,
  });

  final int id;
  final String title;
  final String description;
  final bool done;
}
