import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_model.freezed.dart';
part 'tasks_model.g.dart';

@freezed
class TasksModel with _$TasksModel {

  factory TasksModel({
    required String title,
    required String description,
    @Default(false) bool isDone
  }) = _TasksModel;

  factory TasksModel.fromJson(Map<String, dynamic> json) => _$TasksModelFromJson(json);

}