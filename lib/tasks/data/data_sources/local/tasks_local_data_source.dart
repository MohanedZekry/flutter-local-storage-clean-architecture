import 'package:dartz/dartz.dart';
import '../../models/tasks_model.dart';

abstract class TasksLocalDataSource {
  Future<bool> initDb();
  Future<List<TasksModel>> getAllTasks();
  Future<Unit> addTask(TasksModel task);
  Future<Unit> deleteTask(String title);
  Future<Unit> deleteAllTasks();
}