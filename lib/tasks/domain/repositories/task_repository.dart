import 'package:dartz/dartz.dart';
import 'package:flutterhive/core/error/failure.dart';
import '../entities/task.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<Tasks>>> getAllTasks();
  Future<Either<Failure, Unit>> addTask(Tasks task);
}