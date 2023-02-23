import '../../domain/entities/task.dart';

class TasksModel extends Tasks{

  const TasksModel({
    required super.title,
    required super.description,
    required super.isDone
  });

  factory TasksModel.fromJson(Map<String , dynamic> json) => TasksModel(
      title: json['title'],
      description: json['description'],
      isDone: json['isDone']
  );

  Map<String, dynamic> toJson() => {
    'title' : title,
    'description' : description,
    'isDone' : isDone
  };

}