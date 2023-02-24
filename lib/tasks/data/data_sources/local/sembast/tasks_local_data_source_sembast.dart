import 'package:dartz/dartz.dart';
import 'package:flutterhive/core/error/exceptions.dart';
import 'package:flutterhive/tasks/data/models/tasks_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../tasks_local_data_source.dart';
import 'package:path/path.dart';

class TasksLocalDataSourceSembast implements TasksLocalDataSource {

  final _kDbFileName = 'sembast_tasks.db';
  final _kTasksStore = 'tasks_store';

  late Database _database;

  late StoreRef<int, Map<String, dynamic>> _tasksStore;

  @override
  Future<bool> initDb() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentDir.path, _kDbFileName);
      _database = await databaseFactoryIo.openDatabase(dbPath);
      _tasksStore = intMapStoreFactory.store(_kTasksStore);
      return true;
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> addTask(TasksModel task) async {
    try {
      await _tasksStore.add(_database, task.toJson());
      return Future.value(unit);
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> deleteAllTasks() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocumentDir.path, _kDbFileName);
      await databaseFactoryIo.deleteDatabase(dbPath);
      return Future.value(unit);
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> deleteTask(String title) async {
    try {
      await _tasksStore.delete(_database);
      return Future.value(unit);
    } catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<List<TasksModel>> getAllTasks() async {
    try {
      final recordSnapshots = await _tasksStore.find(_database);
      final response = recordSnapshots.map<TasksModel>(
              (e) => TasksModel.fromJson(e.value)).toList(growable: false);
      return response;
    } catch (_) {
      throw NoDataException();
    }

  }


}