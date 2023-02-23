import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhive/app/di/injector.dart';
import 'package:flutterhive/app/routes/screens/not_found_screen.dart';
import 'package:flutterhive/tasks/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../tasks/presentation/controller/tasks_bloc.dart';

class AppRouter {

  static const root = '/';

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: root,
        pageBuilder: (context, state) =>
            CustomTransitionPage(
              child: BlocProvider(
                create: (context) => injector<TasksBloc>()..add(const GetAllTasksEvent()),
                child: const HomeScreen(),
              ),
              transitionsBuilder: (context, animation, secondaryAnimation,
                  child) => FadeTransition(opacity: animation, child: child),
            ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;

}