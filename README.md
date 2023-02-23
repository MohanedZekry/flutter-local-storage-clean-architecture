# Flutter Local Storage Clean Architecture

<i> In this project we will use trending local storage packages We’ll do some benchmarking to determine how long it takes each option to perform operations, so we can have a clear understanding of which is the best choice for us. 
The project is implementing  a clean architecture so that it’s easy to understand and easy to change as the project grows in the future and implement new technologies or packages.
</i>
- [hive](https://pub.dev/packages/hive)
- [sembast](https://pub.dev/packages/sembast)
- [sqflite](https://pub.dev/packages/sqflite)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [isar](https://pub.dev/packages/isar)

## Table of Contents
- [Modules](#modules)
- [Implementation](#implementation)
  - [Hive](#hive)
  - [Sembast](#sembast)

## Modules
| Modules       | Progress   |
| :----------   | :-------:  |
| Data          |    ☑️     | 
| Domain        |    ✅     |
| Presentation  |            |

## Implementation
### Hive
is a lightweight and blazing fast key-value database written in pure Dart.
Hive having the idea of `boxes` (which store data).

Hive stores its data in boxes containing key-value sets `Hive.box`
You can call 
```dart
Hive.openBox(‘name’) 
```
regardless of whether you as of now have the box opened elsewhere.

Let’s implement the model class
```dart
import 'package:hive/hive.dart';
part 'tasks.g.dart';

@HiveType(typeId: 0)
class Tasks{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final bool isDone;

   Tasks({
    required this.name,
    required this.content,
    required this.isDone
  });
}
```
Then run a code generator by typing the following command in the terminal which will automatically generate database and Adapters for us.
```js
$ flutter packages pub run build_runner build
```

**Note:** Dart File name is `tasks.dart` so i will add part `tasks.g.dart`. g stands for generated. Thus new generated file would be `tasks.g.dart`
```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksAdapter extends TypeAdapter<Tasks> {
  @override
  final int typeId = 0;

  @override
  Tasks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tasks(
      name: fields[0] as String,
      content: fields[1] as String,
      isDone: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Tasks obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
```
### Sembast
is database stands for Simple Embedded Application Store database
NoSQL persistent store database solution for single process io applications.

```dart
final _kDbFileName = 'sembast_tasks.db';
final _kTasksStore = 'tasks_store';

late Database _database;

StoreRef<int, Map<String, dynamic>> _tasksStore;

appDocumentDir = await getApplicationDocumentsDirectory();

dbPath = join(appDocumentDir.path, _kDbFileName);

_database = await databaseFactoryIo.openDatabase(dbPath);

_tasksStore = intMapStoreFactory.store(_kTasksStore);      
```
