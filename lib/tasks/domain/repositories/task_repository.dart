import 'package:dartz/dartz.dart';
import 'package:flutterhive/core/error/failure.dart';
import 'package:flutterhive/tasks/data/models/tasks_model.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<TasksModel>>> getAllTasks();
  Future<Either<Failure, Unit>> addTask(TasksModel task);
}