import 'package:dartz/dartz.dart';
import 'package:flutterhive/core/error/exceptions.dart';
import 'package:flutterhive/tasks/data/data_sources/local/tasks_local_data_source.dart';
import 'package:hive/hive.dart';
import '../../../models/tasks_model.dart';
import 'tasks.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:path_provider/path_provider.dart';

class TasksLocalDataSourceHive implements TasksLocalDataSource {

  final _kTaskBox = 'tasks_box';

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      Hive.registerAdapter(TasksAdapter());
      await Hive.openBox<Tasks>(_kTaskBox);
      return true;
    } on Exception catch (_) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> addTask(TasksModel task) async {
    try{
      final tasksBox = Hive.box<Tasks>(_kTaskBox);
      final convertedTask = Tasks(title: task.title, description: task.description, isDone: task.isDone);
      await tasksBox.add(convertedTask);
      return Future.value(unit);
    } on Exception catch (_) {
      throw ConnectionException();
    }

  }

  @override
  Future<List<TasksModel>> getAllTasks() async {
    try {
      final tasksBox = Hive.box<Tasks>(_kTaskBox);
      final result = tasksBox.values.map<TasksModel>((e) =>
          TasksModel(
              title: e.title, description: e.description, isDone: e.isDone))
          .toList();
      return result;
    } on Exception catch (_) {
      throw NoDataException();
    }
  }

  @override
  Future<Unit> deleteTask(String title) async {
    final tasksBox = Hive.box<Tasks>(_kTaskBox);
    await tasksBox.delete(title);
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteAllTasks() async {
    final tasksBox = Hive.box<Tasks>(_kTaskBox);
    await tasksBox.clear();
    return Future.value(unit);
  }

}