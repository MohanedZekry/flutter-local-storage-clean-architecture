import 'package:dartz/dartz.dart';
import 'package:flutterhive/core/error/failure.dart';
import 'package:flutterhive/core/use_case/base_use_case.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetAllTasksUseCase extends BaseUseCase<List<Tasks>, DefaultParams>{

  final TasksRepository taskRepository;

  GetAllTasksUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, List<Tasks>>> call(DefaultParams param) async {
    return await taskRepository.getAllTasks();
  }

}