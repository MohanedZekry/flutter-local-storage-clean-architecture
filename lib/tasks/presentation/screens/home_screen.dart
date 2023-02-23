import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhive/core/widgets/app_bar_widget.dart';
import 'package:flutterhive/tasks/presentation/controller/tasks_bloc.dart';
import 'package:flutterhive/tasks/presentation/widgets/task_list_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget finalView;
    return Scaffold(
        appBar: getAppBar('Home Screen'),
        body: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            state.when(
                initial: () => finalView = const SizedBox(),
                loading: () => finalView = const Center(child: CircularProgressIndicator()),
                loaded: (tasks) =>  finalView = TaskListWidget(tasks: tasks),
                error: () =>  finalView = const Center(child: Text('error'))
            );
            return finalView;
          },
        )
    );
  }
}
