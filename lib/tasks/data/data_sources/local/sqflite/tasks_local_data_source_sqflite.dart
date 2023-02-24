import 'dart:io';
import 'package:flutterhive/core/error/exceptions.dart';
import 'package:path/path.dart';
import 'package:dartz/dartz.dart';
import 'package:flutterhive/tasks/data/data_sources/local/tasks_local_data_source.dart';
import 'package:flutterhive/tasks/data/models/tasks_model.dart';
import 'package:sqflite/sqflite.dart';

class TasksLocalDataSourceSqflite implements TasksLocalDataSource {

  late Database _db;
  final _mDbName = 'nsqflite.db';
  final _mTasksTb = 'tasks_tb';

  @override
  Future<bool> initDb() async {
    try {
      final dbFolder = await getDatabasesPath();
      if (!await Directory(dbFolder).exists()) {
        await Directory(dbFolder).create(recursive: true);
      }
      final dbPath = join(dbFolder, _mDbName);
      _db = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) async {
          await _initTasksTable(db);
        },
      );
      return true;
    } catch (_) {
      throw ConnectionException();
    }
  }
  Future<void> _initTasksTable(Database db) async {
    await db.execute('''
          CREATE TABLE $_mTasksTb(
          title TEXT,
          description TEXT
          )
        ''');
  }

  @override
  Future<Unit> addTask(TasksModel task) async {
    try {
        await _db.transaction(
              (txn) async {
            await txn.rawInsert('''
          INSERT INTO $_mTasksTb 
          (
          title,
          description
          )
          VALUES
            (
              "${task.title}",
              "${task.description}"
            )''');
          },
        );
      // success inserted data
      return Future.value(unit);
    }  catch (e) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> deleteAllTasks() async {
    try {
      await _db.rawDelete('''
        DELETE FROM $_mTasksTb
      ''');
      return Future.value(unit);
    } catch (e) {
      throw ConnectionException();
    }
  }

  @override
  Future<Unit> deleteTask(String title) async {
    try {
      await _db.rawDelete('''
        DELETE FROM $_mTasksTb
        WHERE title = $title
      ''');
      return Future.value(unit);
    } catch (e) {
      throw ConnectionException();
    }
  }

  @override
  Future<List<TasksModel>> getAllTasks() async {
    final json = await _db.rawQuery('SELECT * FROM $_mTasksTb');
    return json.map<TasksModel>((e) => TasksModel.fromJson(e)).toList();
  }

}