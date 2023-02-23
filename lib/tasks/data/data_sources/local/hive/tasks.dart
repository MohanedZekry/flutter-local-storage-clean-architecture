import 'package:hive/hive.dart';
part 'tasks.g.dart';

@HiveType(typeId: 0)
class Tasks{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final bool isDone;

   Tasks({
    required this.title,
    required this.description,
    required this.isDone
  });

}