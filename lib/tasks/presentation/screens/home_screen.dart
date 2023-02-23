import 'package:flutter/material.dart';
import 'package:flutterhive/core/widgets/app_bar_widget.dart';
import 'package:flutterhive/tasks/presentation/widgets/task_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Home Screen'),
      body: const TaskListWidget(tasks: [])
    );
  }
}
