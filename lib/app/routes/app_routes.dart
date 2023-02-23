import 'package:flutter/material.dart';
import 'package:flutterhive/app/routes/screens/not_found_screen.dart';
import 'package:flutterhive/tasks/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {

  static const root = '/';

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: root,
        pageBuilder: (context, state) =>
            CustomTransitionPage(
                child: const HomeScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child)
                => FadeTransition(opacity: animation, child: child),
            ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;

}