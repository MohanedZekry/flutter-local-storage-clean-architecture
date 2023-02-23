import 'package:dartz/dartz.dart';
import 'package:flutterhive/core/error/exceptions.dart';
import 'package:flutterhive/core/error/failure.dart';
import 'package:flutterhive/tasks/data/data_sources/local/tasks_local_data_source.dart';
import 'package:flutterhive/tasks/data/models/tasks_model.dart';
import 'package:flutterhive/tasks/domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class TasksRepositoryImpl implements TasksRepository {

  final TasksLocalDataSource tasksLocalDataSource;

  const TasksRepositoryImpl({
    required this.tasksLocalDataSource
  });

  @override
  Future<Either<Failure, Unit>> addTask(Tasks task) async {
    try{
      final response = await tasksLocalDataSource.addTask(
          TasksModel(
              title: task.title,
              description: task.description,
              isDone: task.isDone)
      );
      return Right(response);
    } on ConnectionException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Tasks>>> getAllTasks() async {
    try{
      final response = await tasksLocalDataSource.getAllTasks();
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }

}