import 'package:flutterhive/tasks/data/data_sources/local/hive/tasks_local_data_source_hive.dart';
import 'package:flutterhive/tasks/data/data_sources/local/sembast/tasks_local_data_source_sembast.dart';
import 'package:flutterhive/tasks/data/data_sources/local/tasks_local_data_source.dart';
import 'package:flutterhive/tasks/data/repositories/tasks_repository_impl.dart';
import 'package:flutterhive/tasks/domain/repositories/task_repository.dart';
import 'package:flutterhive/tasks/domain/use_cases/add_task_use_case.dart';
import 'package:flutterhive/tasks/domain/use_cases/get_all_tasks_use_case.dart';
import 'package:flutterhive/tasks/presentation/controller/tasks_bloc.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initDependencies() async {

  /// Data Source ///
  injector.registerLazySingleton<TasksLocalDataSource>(() => TasksLocalDataSourceHive());
  // injector.registerLazySingleton<TasksLocalDataSource>(() => TasksLocalDataSourceSembast());

  /// Repository ///
  injector.registerLazySingleton<TasksRepository>(
          () => TasksRepositoryImpl(tasksLocalDataSource: injector()));

  /// UseCase ///
  injector.registerLazySingleton(() => GetAllTasksUseCase(taskRepository: injector()));
  injector.registerLazySingleton(() => AddTaskUseCase(taskRepository: injector()));

  /// BloC ///
  injector.registerFactory(() => TasksBloc(getAllTasksUseCase: injector()));

  await injector<TasksLocalDataSource>().initDb();

}