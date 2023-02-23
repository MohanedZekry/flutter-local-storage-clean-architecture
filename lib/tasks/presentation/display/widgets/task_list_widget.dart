import 'package:flutter/material.dart';
import 'package:flutterhive/core/values/dimens.dart';
import '../../../data/models/tasks_model.dart';


class TaskListWidget extends StatelessWidget {
  final List<TasksModel> tasks;
  const TaskListWidget({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(
          tasks[index].title
        ),
        subtitle: Text(
          tasks[index].description,
        ),
      ),
      itemCount: tasks.length,
      padding: const EdgeInsets.symmetric(vertical: pad10, horizontal: pad18),
    );
  }
}
