import 'package:dartz/dartz.dart';
import 'package:flutterhive/core/error/failure.dart';
import 'package:flutterhive/core/use_case/base_use_case.dart';
import 'package:flutterhive/tasks/data/models/tasks_model.dart';
import 'package:flutterhive/tasks/domain/repositories/task_repository.dart';

class AddTaskUseCase extends BaseUseCase<Unit, TasksModel>{

  final TasksRepository taskRepository;

  AddTaskUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, Unit>> call(TasksModel param) async {
    return await taskRepository.addTask(param);
  }

}